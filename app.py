from flask import Flask, render_template, request, jsonify, url_for, redirect, session, flash, send_from_directory, send_file
import aiml
import os
import pickle, re, itertools, collections, datetime
import pymysql as MySQLdb
from werkzeug.utils import secure_filename
 
from sklearn.naive_bayes import MultinomialNB
from sklearn.feature_extraction import DictVectorizer
from sklearn.pipeline import Pipeline

from nltk.tag import hmm, DefaultTagger
from nltk.chunk import ChunkParserI
from nltk.tag.sequential import UnigramTagger,BigramTagger,TrigramTagger

from openpyxl import Workbook

db = MySQLdb.connect(host="localhost", user="root", password="", db="pythonchat")
cur = db.cursor()
upload_aiml = './bot/' #sesuaikan dengan tempat penyimpanan file aiml
upload_train = './corpus/' #sesuaikan dengan tempat penyimpanan file training
allowed_ext1 = set(['txt'])
allowed_ext2 = set(['aiml'])
allowed_ext3 = set(['xml'])
time = datetime.datetime.now()

app = Flask(__name__)
app.secret_key = "supersecretkey"
app.config['UPLOAD_AIML'] = upload_aiml
app.config['UPLOAD_TRAIN'] = upload_train


def to_bilou(teranotisasi): #PROSES BILOU TAGGING
    #print(teranotisasi)
    proper_bilou_token = []
    for idx, teranotisasi_token in enumerate(teranotisasi):
        kata, tag, ner = teranotisasi_token
        if ner != 'O':
            if idx == len(teranotisasi)-1:
                nersebelum = teranotisasi[idx-1][2]
                if nersebelum == 'O':
                    ner = "U-" + ner
                elif nersebelum == ner:
                    ner = "L-" + ner
            else:
                nersesudah = teranotisasi[idx+1][2]
                nersebelum = teranotisasi[idx-1][2] 
                if idx == 0:
                    if nersesudah != ner:
                        ner = "U-" + ner
                elif nersebelum == 'O':
                    if nersesudah == 'O':
                        ner = "U-" + ner
                    elif nersesudah == ner:
                        ner = "B-" + ner
                    elif nersesudah != ner:
                        ner = "U-" + ner
                elif nersebelum == ner:
                    if nersesudah == 'O':
                        ner = "L-" + ner
                    elif nersesudah == ner:
                        ner = "I-" + ner
                    elif nersesudah != ner:
                        ner = "L-" + ner
                elif nersebelum != ner:
                    if nersesudah != ner:
                        ner = "U-" + ner
                    elif nersesudah == ner:
                        ner = "B-" + ner
        proper_bilou_token.append((kata, tag, ner))
    return proper_bilou_token
	
def ngramtagging(train): #PROSES POS TAGGING
    train_data = []
    train_data.append(train)
    backoff_tagger = DefaultTagger('nn')
    unigram_tagger = UnigramTagger(train_data, backoff = backoff_tagger)
    bigram_tagger = BigramTagger(train_data, backoff = unigram_tagger)
    trigram_tagger = TrigramTagger(train_data, backoff = bigram_tagger)
    return trigram_tagger

def chunking(hasilNER): #PROSES CHUNKING
    lastdata = []
    sementara = []
    if len(hasilNER) == '1': #JIKA HANYA ADA SATU KATA
        kata, ner = hasilNER
        if "B-" in ner:
                if ner == 'B-PER':
                    ner = 'Person'
                    lastdata.append({ner: kata.upper()})
                elif ner == 'B-ORG':
                    ner = 'Organization'
                    lastdata.append({ner: kata.upper()})
                elif ner == 'B-NUM':
                    ner = 'Number'
                    lastdata.append({ner: kata.upper()})
                elif ner == 'B-LOC':
                    ner = 'Location'
                    lastdata.append({ner: kata.upper()})
                elif ner == 'B-QUE':
                    ner = 'Question'
                    lastdata.append({ner: kata.upper()})
                elif ner == 'B-INTENT':
                    ner = 'Intent'
                    lastdata.append({ner: kata.upper()})
        elif "L-" in ner:
                if ner == 'L-PER':
                    ner = 'Person'
                    lastdata.append({ner: kata.upper()})
                elif ner == 'L-ORG':
                    ner = 'Organization'
                    lastdata.append({ner: kata.upper()})
                elif ner == 'L-NUM':
                    ner = 'Number'
                    lastdata.append({ner: kata.upper()})
                elif ner == 'L-LOC':
                    ner = 'Location'
                    lastdata.append({ner: kata.upper()})
                elif ner == 'L-QUE':
                    ner = 'Question'
                    lastdata.append({ner: kata.upper()})
                elif ner == 'L-INTENT':
                    ner = 'Intent'
                    lastdata.append({ner: kata.upper()})
    else:
        for idx, single in enumerate(hasilNER): #JIKA ADA BEBERAPA KATA
            kata, ner = single
            if ner != 'O': #CEK YANG BUKAN O
                if idx == len(hasilNER)-1: #JIKA SUDAH MENCAPAI LIST TERAKHIR
                    if "U-" in ner:
                        if ner == 'U-PER':
                            ner = 'Person'
                            lastdata.append({ner: kata.upper()})
                        elif ner == 'U-ORG':
                            ner = 'Organization'
                            lastdata.append({ner: kata.upper()})
                        elif ner == 'U-NUM':
                            ner = 'Number'
                            lastdata.append({ner: kata.upper()})
                        elif ner == 'U-LOC':
                            ner = 'Location'
                            lastdata.append({ner: kata.upper()})
                        elif ner == 'U-QUE':
                            ner = 'Question'
                            lastdata.append({ner: kata.upper()})
                        elif ner == 'U-INTENT':
                            ner = 'Intent'
                            lastdata.append({ner: kata.upper()})
                    elif "B-" in ner:
                        if ner == 'B-PER':
                            ner = 'Person'
                            lastdata.append({ner: kata.upper()})
                        elif ner == 'B-ORG':
                            ner = 'Organization'
                            lastdata.append({ner: kata.upper()})
                        elif ner == 'B-NUM':
                            ner = 'Number'
                            lastdata.append({ner: kata.upper()})                            
                        elif ner == 'B-LOC':
                            ner = 'Location'
                            lastdata.append({ner: kata.upper()})                            
                        elif ner == 'B-QUE':
                            ner = 'Question'
                            lastdata.append({ner: kata.upper()})                           
                        elif ner == 'B-INTENT':
                            ner = 'Intent'
                            lastdata.append({ner: kata.upper()})
                    elif "I-" in ner:
                        sementara.append(kata)
                        kata = ' '.join(sementara)
                        if ner == 'I-PER':
                            ner = 'Person'
                            lastdata.append({ner: kata.upper()})
                            sementara.clear()
                        elif ner == 'I-ORG':
                            ner = 'Organization'
                            lastdata.append({ner: kata.upper()})
                            sementara.clear()
                        elif ner == 'I-NUM':
                            ner = 'Number'
                            lastdata.append({ner: kata.upper()})
                            sementara.clear()
                        elif ner == 'I-LOC':
                            ner = 'Location'
                            lastdata.append({ner: kata.upper()})
                            sementara.clear()
                        elif ner == 'I-INTENT':
                            ner = 'Intent'
                            lastdata.append({ner: kata.upper()})
                            sementara.clear()
                        elif ner == 'I-QUE':
                            ner = 'Question'
                            lastdata.append({ner: kata.upper()})
                            sementara.clear()
                    elif "L-" in ner:
                        if not sementara:
                            if ner == 'L-PER':
                                ner = 'Person'
                                lastdata.append({ner: kata.upper()})
                            elif ner == 'L-ORG':
                                ner = 'Organization'
                                lastdata.append({ner: kata.upper()})
                            elif ner == 'L-NUM':
                                ner = 'Number'
                                lastdata.append({ner: kata.upper()})
                            elif ner == 'L-LOC':
                                ner = 'Location'
                                lastdata.append({ner: kata.upper()})
                            elif ner == 'L-INTENT':
                                ner = 'Intent'
                                lastdata.append({ner: kata.upper()})
                            elif ner == 'L-QUE':
                                ner = 'Question'
                                lastdata.append({ner: kata.upper()})
                        else:
                            sementara.append(kata)
                            kata = ' '.join(sementara)
                            if ner == 'L-PER':
                                ner = 'Person'
                                lastdata.append({ner: kata.upper()})
                                sementara.clear()
                            elif ner == 'L-ORG':
                                ner = 'Organization'
                                lastdata.append({ner: kata.upper()})
                                sementara.clear()
                            elif ner == 'L-NUM':
                                ner = 'Number'
                                lastdata.append({ner: kata.upper()})
                                sementara.clear()
                            elif ner == 'L-LOC':
                                ner = 'Location'
                                lastdata.append({ner: kata.upper()})
                                sementara.clear()
                            elif ner == 'L-INTENT':
                                ner = 'Intent'
                                lastdata.append({ner: kata.upper()})
                                sementara.clear()
                            elif ner == 'L-QUE':
                                ner = 'Question'
                                lastdata.append({ner: kata.upper()})
                                sementara.clear()
                else: #JIKA BELUM LIST TERAKHIR
                    nersesudah = hasilNER[idx+1][1]
                    if "U-" in ner:
                        if ner == 'U-PER':
                            ner = 'Person'
                            lastdata.append({ner: kata.upper()})
                        elif ner == 'U-ORG':
                            ner = 'Organization'
                            lastdata.append({ner: kata.upper()})
                        elif ner == 'U-NUM':
                            ner = 'Number'
                            lastdata.append({ner: kata.upper()})
                        elif ner == 'U-LOC':
                            ner = 'Location'
                            lastdata.append({ner: kata.upper()})
                        elif ner == 'U-QUE':
                            ner = 'Question'
                            lastdata.append({ner: kata.upper()})
                        elif ner == 'U-INTENT':
                            ner = 'Intent'
                            lastdata.append({ner: kata.upper()})
                    elif "B-" in ner:
                        sementara.append(kata)
                        if nersesudah == 'O':
                            if ner == 'B-PER':
                                ner = 'Person'
                                lastdata.append({ner: kata.upper()})
                                sementara.clear()
                            elif ner == 'B-ORG':
                                ner = 'Organization'
                                lastdata.append({ner: kata.upper()})
                                sementara.clear()
                            elif ner == 'B-NUM':
                                ner = 'Number'
                                lastdata.append({ner: kata.upper()})
                                sementara.clear()
                            elif ner == 'B-LOC':
                                ner = 'Location'
                                lastdata.append({ner: kata.upper()})
                                sementara.clear()
                            elif ner == 'B-QUE':
                                ner = 'Question'
                                lastdata.append({ner: kata.upper()})
                                sementara.clear()
                            elif ner == 'B-INTENT':
                                ner = 'Intent'
                                lastdata.append({ner: kata.upper()})
                                sementara.clear()
                    elif "I-" in ner:
                        sementara.append(kata)
                        if nersesudah == 'O':
                            kata = ' '.join(sementara)
                            if ner == 'I-PER':
                                ner = 'Person'
                                lastdata.append({ner: kata.upper()})
                                sementara.clear()
                            elif ner == 'I-ORG':
                                ner = 'Organization'
                                lastdata.append({ner: kata.upper()})
                                sementara.clear()
                            elif ner == 'I-NUM':
                                ner = 'Number'
                                lastdata.append({ner: kata.upper()})
                                sementara.clear()
                            elif ner == 'I-LOC':
                                ner = 'Location'
                                lastdata.append({ner: kata.upper()})
                                sementara.clear()
                            elif ner == 'I-INTENT':
                                ner = 'Intent'
                                lastdata.append({ner: kata.upper()})
                                sementara.clear()
                            elif ner == 'I-QUE':
                                ner = 'Question'
                                lastdata.append({ner: kata.upper()})
                                sementara.clear()
                    elif "L-" in ner:
                        if not sementara:
                            if ner == 'L-PER':
                                ner = 'Person'
                                lastdata.append({ner: kata.upper()})
                            elif ner == 'L-ORG':
                                ner = 'Organization'
                                lastdata.append({ner: kata.upper()})
                            elif ner == 'L-NUM':
                                ner = 'Number'
                                lastdata.append({ner: kata.upper()})
                            elif ner == 'L-LOC':
                                ner = 'Location'
                                lastdata.append({ner: kata.upper()})
                            elif ner == 'L-INTENT':
                                ner = 'Intent'
                                lastdata.append({ner: kata.upper()})
                            elif ner == 'L-QUE':
                                ner = 'Question'
                                lastdata.append({ner: kata.upper()})
                        else:
                            sementara.append(kata)
                            kata = ' '.join(sementara)
                            if ner == 'L-PER':
                                ner = 'Person'
                                lastdata.append({ner: kata.upper()})
                                sementara.clear()
                            elif ner == 'L-ORG':
                                ner = 'Organization'
                                lastdata.append({ner: kata.upper()})
                                sementara.clear()
                            elif ner == 'L-NUM':
                                ner = 'Number'
                                lastdata.append({ner: kata.upper()})
                                sementara.clear()
                            elif ner == 'L-LOC':
                                ner = 'Location'
                                lastdata.append({ner: kata.upper()})
                                sementara.clear()
                            elif ner == 'L-INTENT':
                                ner = 'Intent'
                                lastdata.append({ner: kata.upper()})
                                sementara.clear()
                            elif ner == 'L-QUE':
                                ner = 'Question'
                                lastdata.append({ner: kata.upper()})
                                sementara.clear()
            else:
                ner = 'Other'
                lastdata.append({ner: kata.upper()})
    return lastdata

def ner_features(tokens, index, history): #FEATURE EXTRACTION
    """
    `tokens`  = kata yang berpasangan dengan POS-nya [(w1, t1), ...]
    `index`   = index dari token yang ingin diperiksa fiturnya
    `history` = BILOU tag yang sebelumnya
    """
 
    # Pad the sequence with placeholders
    tokens = [('__START2__', '__START2__'), ('__START1__', '__START1__')] + list(tokens) + [('__END1__', '__END1__'), ('__END2__', '__END2__')]
    history = ['__START2__', '__START1__'] + list(history)
 
    # shift the index with 2, to accommodate the padding
    index += 2
 
    word, pos = tokens[index] #kata dan pos tag saat ini
    prevword, prevpos = tokens[index - 1] #satu kata sebelum dan satu pos tag sebelum
    prevprevword, prevprevpos = tokens[index - 2] #dua kata sebelum dan dua pos tag sebelum
    nextword, nextpos = tokens[index + 1] #satu kata sesudah dan satu pos tag sesudah
    nextnextword, nextnextpos = tokens[index + 2] #dua kata sesudah dan dua pos tag sesudah
    #prevbilou = history[-1] #satu entitas sebelum
    #prevprevbilou = history[-2] #dua entitas sebelum
	
 
    feat_dict = {
        'word': word,
        'pos': pos,
		'bigram': '%s %s' % (word,nextword),
		
        'next-word': nextword,
        #'next-pos': nextpos,
        #'next-shape': shape(nextword),
 
        'next-next-word': nextnextword,
        #'next-next-pos': nextnextpos,
        #'next-next-shape': shape(nextnextword),
 
        'prev-word': prevword,
        #'prev-pos': prevpos,
        #'prev-bilou': prevbilou,
        #'prev-shape': shape(prevword),
 
        'prev-prev-word': prevprevword,
        #'prev-prev-pos': prevprevpos,
        #'prev-prev-bilou': prevprevbilou,
        #'prev-prev-shape': shape(prevprevword),
    }
    #print(feat_dict)
    return feat_dict

def readdata(): #BACA DATA TRAINING 
    with open("corpus/corpusposner.txt", "r") as f: #data training dalam satu folder yang sama, sesuaikan dengan lokasi penyimpanan data training
        vallist = [word for line in f for word in line.split()] #SENTENCE TOKENIZING
    #print(vallist)
    f.close()
    with open("corpus/postagcorpus2.txt", "r") as f: #data training dalam satu folder yang sama, sesuaikan dengan lokasi penyimpanan data pos training
        vallist2 = [word for line in f for word in line.split()]
    f.close()
    standard_form_tokens = []
    untuk_postag = []
    hasil = []
    for idx, vallist in enumerate(vallist): #WORD TOKENIZING
        anotasi = vallist.split('/')
        kata, tag, ner = anotasi[0], anotasi[1], anotasi[2]
			
        standard_form_tokens.append((kata, tag.lower(), ner))
        untuk_postag.append((kata, tag.lower()))

    for idx, vallist2 in enumerate(vallist2):
        anotasi = vallist2.split('/')
        kata, tag= anotasi[0], anotasi[1]
        untuk_postag.append((kata, tag.lower()))
    tritag = ngramtagging(untuk_postag) #POS TAGGING Training

    bilou_scheme = to_bilou(standard_form_tokens) #BILOU TAGGING
    hasil.append(bilou_scheme)
    return hasil, tritag
    

class ScikitLearnChunk(ChunkParserI): #PEMROSESAN TRAINING NER
    
    @classmethod
    def to_dataset(cls, parsed_sentences, feature_detector): #mengubah ke dalam bentuk dataset matrix X dan y
        #print(len(parsed_sentences))
        X, y = [], []
        for parsed in parsed_sentences:
            #print(parsed)
            kata, tag, bilou = zip(*parsed)
            tagged = list(zip(kata, tag))
            #print(range(len(parsed)))
            for index in range(len(parsed)):
                X.append(feature_detector(tagged, index, history=bilou[:index]))
                y.append(bilou[index])
        return X, y

    @classmethod
    def get_minibatch(cls, parsed_sentences, feature_detector, batch_size=350): #memecah dataset 
        #print(parsed_sentences)
        batch = list(itertools.islice(parsed_sentences, batch_size))
        #print(batch)
        X, y = cls.to_dataset(batch, feature_detector)
        return X, y 
		
    @classmethod
    def train(cls, parsed_sentences, feature_detector, all_classes, **kwargs): #training ner
        X, y = cls.get_minibatch(parsed_sentences, feature_detector, kwargs.get('batch_size', 250))
        vectorize = DictVectorizer(sparse=False)
        vectorize.fit(X)
        #print(vectorize.get_feature_names())
		
        clf = MultinomialNB(alpha=1.0, class_prior=None, fit_prior=True)
		
        while len(X):
            X = vectorize.transform(X)
            clf.partial_fit(X, y, all_classes)
            X, y = cls.get_minibatch(parsed_sentences, feature_detector, kwargs.get('batch_size', 250))
	
        clf = Pipeline([('vectorizer', vectorize), ('classifier', clf)])
		
        return cls(clf, feature_detector)
		
    def __init__(self, classifier, feature_detector):
        self._classifier = classifier
        self._feature_detector = feature_detector

    def parse(self, tokens): #proses klasifikasi input user
        history = []
        bilou_tagged = []
        hasil = []
        for index, (kata, tag) in enumerate(tokens):
            bilou_tag = self._classifier.predict([self._feature_detector(tokens, index, history)])[0]
            #score = list(zip(self._classifier.classes_, self._classifier.predict_proba([self._feature_detector(tokens, index, history)])[0]))

            history.append(bilou_tag)
            bilou_tagged.append((kata, bilou_tag))
            #hasil.append((kata, bilou_tag, score))
			
        return bilou_tagged#, hasil
		
    def score(self, parsed_sentences): #akurasi
        X_test, y_test = self.__class__.to_dataset(parsed_sentences, self._feature_detector)
        return self._classifier.score(X_test, y_test)
		
def train_multinb(): #MEMANGGIL PROSES TRAINING 
    reader, tritag = readdata()
	
    all_classes = ['O', 'B-PER', 'I-PER', 'L-PER', 'U-PER', 'B-ORG', 'I-ORG', 'L-ORG', 'U-NUM', 'B-LOC', 'I-LOC', 'L-LOC', 'U-LOC', 'U-ORG', 'U-QUE', 'U-INTENT', 'B-INTENT', 'I-INTENT', 'L-INTENT', 'B-QUE', 'L-QUE']

    try_ner = ScikitLearnChunk.train(itertools.islice(reader, 10000), feature_detector = ner_features, all_classes = all_classes, batch_size = 250)

    accuracy = try_ner.score(itertools.islice(reader, 250))
    print("Akurasi: ", accuracy)
    return try_ner, tritag

kernel = aiml.Kernel() #PEMANGGILAN AIML
ner, tritag = train_multinb() #TRAINING NER

if os.path.isfile("bot/bot_brain.brn"):
    kernel.bootstrap(brainFile = "bot/bot_brain.brn")
else:
    kernel.bootstrap(learnFiles = os.path.abspath("bot/std-startup.xml"), commands = "load aiml b")
    kernel.saveBrain("bot/bot_brain.brn")
	
def answer(message):

    while True:
        kalimat2 = re.split(r'(?<!\w\.\w.)(?<![A-Z][a-z]\.)(?<![A-Z]\.)(?<=\.|\?|\!)\s', message)# SENTENCE TOKENIZING
        untuk_kata = []
        for kata2 in kalimat2:
            kata2 = re.findall(r'(?i)\b[a-z]+(?:[\'-]?[a-z]+)*\b|(?:[A-Z]\.)+|[\d\.]{2,}|[\d\,]{2,}|\d+', kata2) # WORD TOKENIZING
            sudahtag = tritag.tag(kata2) #POS TAGGING
            untuk_kata.append(sudahtag)
        untuk_kata = [item for sublist in untuk_kata for item in sublist]
        print(sudahtag)
        print(ner.parse(untuk_kata)) # ENTITY CLASSIFYING
        result = chunking(ner.parse(untuk_kata)) #CHUNKING
        #print(result)
        result = (', '.join("{!s}={!r}".format(k,v) for d in result for k,v in d.items()))
        #print(result)
        result = result.replace("'","").replace(", ", ",").replace("=",":")
        print(result)
        if message == "quit":
            bot_response = kernel.respond(result)
        elif message == "save":
            os.remove("bot/bot_brain.brn")
            kernel.bootstrap(learnFiles = os.path.abspath("bot/std-startup.xml"), commands = "load aiml b")
            kernel.saveBrain("bot/bot_brain.brn")
            bot_response = kernel.respond(result)
        else:
            bot_response = kernel.respond(result)
            # print bot_response
            print(bot_response)
            cur.execute("""INSERT INTO tbl_history_chat(pertanyaan,jawaban,tanggal_chat) VALUES (%s,%s,%s)""",(result,bot_response,time.strftime('%Y-%m-%d')))
            db.commit()
        return jsonify({'status':'OK','answer':bot_response})

def allowed_filetxt(filename):
    return '.' in filename and \
           filename.rsplit('.', 1)[1].lower() in allowed_ext1

def allowed_fileaiml(filename):
    return '.' in filename and \
           filename.rsplit('.', 1)[1].lower() in allowed_ext2
		
def allowed_filexml(filename):
    return '.' in filename and \
           filename.rsplit('.', 1)[1].lower() in allowed_ext3

@app.route("/")
def hello():
    if session.get('logged_in'):
        return redirect(url_for('.admin'))
    else:
        return render_template('chat.html')

@app.route('/login', methods=['GET', 'POST'])
def login():
    error = None
    if session.get('logged_in'):
        return redirect(url_for('.admin'))
    else:
        if request.method == 'POST':
            usern = str(request.form['username'])
            passw = str(request.form['password'])
        
            cur.execute("SELECT COUNT(1) FROM tbl_user WHERE username = %s;", [usern])
            if cur.fetchone()[0]:
                cur.execute("SELECT password FROM tbl_user  WHERE password = %s;", [passw])
                for row in cur.fetchall():
                    if passw == row[0]:
                        session['logged_in'] = usern
                        return redirect(url_for('.admin'))
                    else:
                        flash('Salah password!')
            else:
                flash('Salah password!')
    return render_template('login.html')

@app.route('/logout')
def logout():
    session.clear()
    return redirect(url_for('.hello'))

@app.route('/admin')
def admin():
    cur.execute("""SELECT * FROM tbl_aiml_file""")
    isi = cur.fetchall()
    return render_template('admin.html', isi = isi)
	
@app.route('/datatraining', methods = ['GET', 'POST'])
def datatraining():
    if request.method == 'POST':
        if 'train_file' not in request.files:
            flash('No file here')
        trainf = request.files['train_file']
        if trainf.filename == '':
            flash('No selected train file')
        if trainf and allowed_filetxt(trainf.filename):
            trainf.filename = "corpusposner.txt"
            file_path = os.path.join(app.config['UPLOAD_TRAIN'],trainf.filename)
            if os.path.exists(file_path):
                os.remove(file_path)
            filename = secure_filename(trainf.filename)
            trainf.save(os.path.join(app.config['UPLOAD_TRAIN'], filename))
            trainf.seek(0,2)
            size_of = trainf.tell()
            cur.execute("""INSERT INTO tbl_training_log(nama_file,size_file,diubah_pada) VALUES (%s,%s,%s)""",(filename,size_of,time.strftime('%Y-%m-%d')))
            db.commit()
            train_multinb()
            flash('Train File successfully uploaded')
        else:
            flash('Train failed')
    train_multinb()
    return render_template('datatraining.html')
	
@app.route('/aimlbaru', methods = ['GET', 'POST'])
def aimlbaru():
    if request.method == 'POST':
        std_startupf = request.files['std-startup']
        aimlf = request.files['aiml_file']
        if std_startupf and allowed_filexml(std_startupf.filename) and aimlf and allowed_fileaiml(aimlf.filename):
            std_startupf.filename = "std-startup.xml"
            filename = secure_filename(std_startupf.filename)
            filename2 = secure_filename(aimlf.filename)
            cur.execute("""SELECT nama_file FROM tbl_aiml_file""")
            for row in cur.fetchall():
                if filename2 == row[0]:
                    flash('Silahkan menggunakan menu upload file aiml lama karena file dengan nama ini sudah pernah di upload sebelumnya.')
                    return redirect(url_for('.aimlbaru'))
            try:
                cur.execute("""INSERT INTO tbl_startup_log(nama_file,diubah_pada) VALUES (%s,%s)""",(filename,time.strftime('%Y-%m-%d')))
                db.commit()
            except(MySQLdb.Error, MySQLdb.Warning) as e:
                print(e)
                return None
            try:
                cur.execute("""INSERT INTO tbl_aiml_file(nama_file,path_file) VALUES (%s,%s)""",(filename2,upload_aiml+filename2))
                db.commit()
            except(MySQLdb.Error, MySQLdb.Warning) as e:
                print(e)
                return None
            std_startupf.save(os.path.join(app.config['UPLOAD_AIML'],filename))
            aimlf.save(os.path.join(app.config['UPLOAD_AIML'], filename2))
            os.remove("bot/bot_brain.brn")
            kernel.bootstrap(learnFiles = os.path.abspath("bot/std-startup.xml"), commands = "load aiml b")
            kernel.saveBrain("bot/bot_brain.brn")
            flash('Upload berhasil')
        else:
            flash('Upload gagal')
    return render_template('aimlbaru.html')
	
@app.route('/aimllama', methods = ['GET','POST'])
def aimllama():
    if request.method == 'POST':
        aimlf = request.files['aiml_file']
        if aimlf.filename == '':
            flash('No selected aiml file')
        if aimlf and allowed_fileaiml(aimlf.filename):
            filename = secure_filename(aimlf.filename)       
            cur.execute("""SELECT nama_file FROM tbl_aiml_file""")
            for row in cur.fetchall():
                if filename == row[0]:
                    file_path = os.path.join(app.config['UPLOAD_AIML'], filename)
                    if os.path.exists(file_path):
                        os.remove(file_path)
                    aimlf.save(os.path.join(app.config['UPLOAD_AIML'], filename))
                    os.remove("bot/bot_brain.brn")
                    kernel.bootstrap(learnFiles = os.path.abspath("bot/std-startup.xml"), commands = "load aiml b")
                    kernel.saveBrain("bot/bot_brain.brn")
                    flash('AIML File succesfully uploaded.')                         
        else:
            flash('Format tidak sesuai')
    return render_template('aimllama.html')
	
@app.route('/chatlog')
def chatlog():
    cur.execute("""SELECT * FROM tbl_history_chat""")
    chatlog = cur.fetchall()
    return render_template('chatlog.html', chatlog=chatlog)
	
@app.route("/ask", methods=['POST','GET'])
def ask():
    message = str(request.form['chatmessage'])
    jawaban = answer(message)
    return jawaban

@app.route('/download/<typefile>/<path:filename>', methods = ['GET', 'POST'])
def download(typefile, filename):
    if typefile == 'trainfile':
        return send_file(filename, as_attachment=True)
    elif typefile == 'aimlfile':
        return send_file(filename)
    elif typefile == 'startupfile':
        return send_from_directory(app.config['UPLOAD_AIML'], filename=filename, as_attachment=True)
    return 'Cannot Download File, Please Go Back.'
	
@app.route('/delete/<int:item_id>', methods = ['GET', 'POST'])
def deletefile(item_id):
    cur.execute("""SELECT nama_file FROM tbl_aiml_file WHERE id_file = %s""", (item_id))
    item = cur.fetchone()
    print(item)
    cur.execute("""DELETE FROM tbl_aiml_file WHERE id_file = %s""", (item_id))
    db.commit()
    os.remove(os.path.join(app.config['UPLOAD_AIML'], item[0]))
    return redirect(url_for('.admin'))
	
@app.route('/export/<path:filename>', methods = ['GET'])
def export(filename):
    
    wb = Workbook()
    cur.execute("""SELECT * FROM tbl_history_chat""")
    results = cur.fetchall()
    ws = wb.create_sheet(0)
    ws.title = 'chatlog'
    for row in results:
        ws.append(row)
    workbook_name = 'Chatlog'
    wb.save(workbook_name+".xlsx")
    return send_file(filename)

    
if __name__ == "__main__":
    app.run(debug=True)