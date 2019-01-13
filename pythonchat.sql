-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 13 Jan 2019 pada 06.40
-- Versi Server: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pythonchat`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_aiml_file`
--

CREATE TABLE `tbl_aiml_file` (
  `id_file` int(11) NOT NULL,
  `nama_file` varchar(50) NOT NULL,
  `path_file` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data untuk tabel `tbl_aiml_file`
--

INSERT INTO `tbl_aiml_file` (`id_file`, `nama_file`, `path_file`) VALUES
(2, 'basic_chat2.aiml', './bot/basic_chat2.aiml'),
(3, 'kontak_dosen.aiml', './bot/kontak_dosen.aiml'),
(4, 'magang.aiml', './bot/magang.aiml'),
(5, 'matkul.aiml', './bot/matkul.aiml'),
(6, 'skripsi.aiml', './bot/skripsi.aiml'),
(7, 'basic_chat.aiml', './bot/basic_chat.aiml'),
(8, 'kontak_dosen2.aiml', './bot/kontak_dosen2.aiml'),
(9, 'ruangdosen.aiml', './bot/ruangdosen.aiml'),
(10, 'ruanglab.aiml', './bot/ruanglab.aiml'),
(11, 'semesterpendek.aiml', './bot/semesterpendek.aiml');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_history_chat`
--

CREATE TABLE `tbl_history_chat` (
  `session_id` int(11) NOT NULL,
  `pertanyaan` text NOT NULL,
  `jawaban` text NOT NULL,
  `tanggal_chat` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_history_chat`
--

INSERT INTO `tbl_history_chat` (`session_id`, `pertanyaan`, `jawaban`, `tanggal_chat`) VALUES
(1, 'Other:HAI', 'Hai. Ada yang bisa dibantu?', '2018-07-20'),
(2, 'Other:KAMU,Question:SIAPA', 'Saya sesuatu yang bisa membantu kamu.', '2018-07-20'),
(3, 'Other:NAMA,Other:SAYA,Other:BUDI', 'Hai, senang kenalan sama kamu.', '2018-07-20'),
(4, 'Other:SAYA,Other:INGIN,Other:TAHU,Other:TENTANG,Other:MAGANG', 'Apa yang ingin kamu ketahui tentang magang? (Minimal sks, syarat sidang magang, tempat kerja magang, laporan magang)', '2018-07-20'),
(5, 'Other:MINIMAL,Other:SKS', 'Minimal untuk mengambil mata kuliah magang, kamu harus sudah lulus 100 SKS.', '2018-07-20'),
(6, 'Other:TERIMA,Other:KASIH', 'Sama-sama. Ada lagi yang bisa dibantu?', '2018-07-20'),
(7, 'Other:HAI', 'Halo juga :D', '2018-07-29'),
(8, 'Other:SAYA,Other:INGIN,Other:TANYA,Other:TENTANG,Other:MAGANG', 'Apa yang ingin kamu ketahui tentang magang? (Minimal sks, syarat sidang magang, tempat kerja magang, laporan magang)', '2018-07-29'),
(9, 'Other:SAYA,Other:INGIN,Other:TANYA,Other:KONTAK,Other:DOSEN', 'Boleh. Kontak dosen siapa ya? (Awali dengan Pak atau Ibu diikuti dengan nama)', '2018-07-29'),
(10, 'Other:TANYA,Other:KONTAK,Other:DOSEN,Other:PAK,Other:RIKI', 'Mungkin bisa diulangi ingin kontak dosen siapa? (Awali dengan Pak atau Ibu diikuti dengan nama)', '2018-07-29'),
(11, 'Other:APA,Other:KAMU,Other:TAHU,Other:INFO,Other:SKRIPSI', 'Apa yang ingin kamu ketahui tentang skripsi? (Syarat pengambilan, pembimbing, syarat sidang)', '2018-07-29'),
(12, 'Other:APA,Other:KAMU,Other:TAHU,Other:TENTANG,Intent:MATA KULIAH,Other:SKRIPSI', 'Apa yang ingin kamu ketahui tentang skripsi? (Syarat pengambilan, pembimbing, syarat sidang)', '2018-07-29'),
(13, 'Other:SAYA,Other:INGIN,Other:AMBIL,Other:MAGANG,Other:TAPI,Other:SAYA,Other:BINGUNG', '', '2018-07-29'),
(14, 'Other:BISA,Other:COBA,Other:JELASKAN,Other:TENTANG,Intent:MATA KULIAH,Other:MAGANG', 'Apa yang ingin kamu ketahui tentang magang? (Minimal sks, syarat sidang magang, tempat kerja magang, laporan magang)', '2018-07-29'),
(15, 'Other:APA,Other:SAJA,Other:SYARAT,Other:UNTUK,Other:MAGANG', 'Apa yang ingin kamu ketahui tentang magang? (Minimal sks, syarat sidang magang, tempat kerja magang, laporan magang)', '2018-07-29'),
(16, 'Other:SYARAT', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> 1) Magang<html><br/></html> 2) Skripsi<html><br/></html> 3) Tentang Absensi <html><br/></html> 4) Kontak Dosen <html><br/></html> 5) Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-07-29'),
(17, 'Other:TENTANG,Other:ABSENSI', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> 1) Magang<html><br/></html> 2) Skripsi<html><br/></html> 3) Tentang Absensi <html><br/></html> 4) Kontak Dosen <html><br/></html> 5) Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-07-29'),
(18, 'Other:SAYA,Other:INGIN,Other:AMBIL,Other:MATAKULIAH,Other:SKRIPSI,Other:TAPI,Other:BINGUNG', '', '2018-07-29'),
(19, 'Other:APA,Other:SYARAT,Other:MAGANG', 'Apa yang ingin kamu ketahui tentang magang? (Minimal sks, syarat sidang magang, tempat kerja magang, laporan magang)', '2018-07-29'),
(20, 'Other:MINIMAL,Other:SKS', 'Minimal untuk mengambil mata kuliah magang, kamu harus sudah lulus 100 SKS.', '2018-07-29'),
(21, 'Other:SIDANG', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> 1) Magang<html><br/></html> 2) Skripsi<html><br/></html> 3) Tentang Absensi <html><br/></html> 4) Kontak Dosen <html><br/></html> 5) Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-07-29'),
(22, 'Other:MAGANG', 'Apa yang ingin kamu ketahui tentang magang? (Minimal sks, syarat sidang magang, tempat kerja magang, laporan magang)', '2018-07-29'),
(23, 'Other:SIDANG', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> 1) Magang<html><br/></html> 2) Skripsi<html><br/></html> 3) Tentang Absensi <html><br/></html> 4) Kontak Dosen <html><br/></html> 5) Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-07-29'),
(24, 'Other:MAGANG', 'Apa yang ingin kamu ketahui tentang magang? (Minimal sks, syarat sidang magang, tempat kerja magang, laporan magang)', '2018-07-29'),
(25, 'Question:DI MANA,Intent:PEDOMAN,Other:LAPORAN,Other:MAGANG', '', '2018-07-29'),
(26, 'Other:PEDOMAN,Other:LAPORAN', 'Apa yang ingin kamu ketahui tentang laporan magang?(format, batas pengumpulan)', '2018-07-29'),
(27, 'Intent:FORMAT', 'Bisa kamu unduh di website resmi STT-PLN yaitu www.sttpln.ac.id', '2018-07-29'),
(28, 'Other:TERIMA,Other:KASIH', 'Sama-sama. Ada lagi yang bisa dibantu?', '2018-07-29'),
(29, 'Other:ADA', 'Apa itu?', '2018-07-29'),
(30, 'Other:PEDOMAN,Other:LAPORAN', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> 1) Magang<html><br/></html> 2) Skripsi<html><br/></html> 3) Tentang Absensi <html><br/></html> 4) Kontak Dosen <html><br/></html> 5) Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-07-29'),
(31, 'Other:ADA,Other:DOSEN,Other:YANG,Other:SAYA,Other:INGIN,Other:HUBUNGI,Other:ADA,Other:NOMOR,Other:DOSEN', 'Mungkin bisa diulangi ingin kontak dosen siapa? (Awali dengan Pak atau Ibu diikuti dengan nama)', '2018-07-29'),
(32, 'Other:NOMOR,Other:DOSEN', 'Mungkin bisa diulangi ingin kontak dosen siapa? (Awali dengan Pak atau Ibu diikuti dengan nama)', '2018-07-29'),
(33, 'Other:PAK,Person:ABDUL HARIS', 'Pak Abdul Haris: 0819-3172-9530', '2018-07-29'),
(34, 'Other:TERIMA,Other:KASIH', 'Sama-sama. Ada lagi yang bisa dibantu?', '2018-07-29'),
(35, 'Other:TIDAK', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> 1) Magang<html><br/></html> 2) Skripsi<html><br/></html> 3) Tentang Absensi <html><br/></html> 4) Kontak Dosen <html><br/></html> 5) Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-07-29'),
(36, 'Other:RUANGAN,Other:DOSEN', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> 1) Magang<html><br/></html> 2) Skripsi<html><br/></html> 3) Tentang Absensi <html><br/></html> 4) Kontak Dosen <html><br/></html> 5) Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-07-29'),
(37, 'Other:RUANGAN', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> 1) Magang<html><br/></html> 2) Skripsi<html><br/></html> 3) Tentang Absensi <html><br/></html> 4) Kontak Dosen <html><br/></html> 5) Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-07-29'),
(38, 'Other:SAYA,Other:INGIN,Other:TANYA,Other:TENTANG,Other:KULIAH', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> 1) Magang<html><br/></html> 2) Skripsi<html><br/></html> 3) Tentang Absensi <html><br/></html> 4) Kontak Dosen <html><br/></html> 5) Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-07-29'),
(39, 'Other:MATAKULIAH', 'Apa yang mau kamu tanyakan terkait mata kuliah?', '2018-07-29'),
(40, 'Other:ADA,Other:YANG,Other:INGIN,Other:SAYA,Other:TANYAKAN,Other:TENTANG,Other:MATAKULIAH', 'Apa yang mau kamu tanyakan terkait mata kuliah?', '2018-07-29'),
(41, 'Other:ADA,Other:APA,Other:SAJA,Other:MATKUL,Other:WAJIB', 'Mata kuliah wajib yang ingin kamu tanyakan? Semester berapa?', '2018-07-29'),
(42, 'Other:SEMESTER,Number:1', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> 1) Magang<html><br/></html> 2) Skripsi<html><br/></html> 3) Tentang Absensi <html><br/></html> 4) Kontak Dosen <html><br/></html> 5) Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-07-29'),
(43, 'Other:KULIAH', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> 1) Magang<html><br/></html> 2) Skripsi<html><br/></html> 3) Tentang Absensi <html><br/></html> 4) Kontak Dosen <html><br/></html> 5) Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-07-29'),
(44, 'Other:KULIAH', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> 1) Magang<html><br/></html> 2) Skripsi<html><br/></html> 3) Tentang Absensi <html><br/></html> 4) Kontak Dosen <html><br/></html> 5) Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-07-29'),
(45, 'Other:MATAKULIAH', 'Apa yang mau kamu tanyakan terkait mata kuliah?', '2018-07-29'),
(46, 'Other:SAYA,Other:INGIN,Other:TANYA,Other:KULIAH,Other:PILIHAN', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> 1) Magang<html><br/></html> 2) Skripsi<html><br/></html> 3) Tentang Absensi <html><br/></html> 4) Kontak Dosen <html><br/></html> 5) Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-07-29'),
(47, 'Other:MATAKULIAH', 'Apa yang mau kamu tanyakan terkait mata kuliah?', '2018-07-29'),
(48, 'Other:PILIHAN', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> 1) Magang<html><br/></html> 2) Skripsi<html><br/></html> 3) Tentang Absensi <html><br/></html> 4) Kontak Dosen <html><br/></html> 5) Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-07-29'),
(49, 'Other:MATAKULIAH', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> 1) Magang<html><br/></html> 2) Skripsi<html><br/></html> 3) Tentang Absensi <html><br/></html> 4) Kontak Dosen <html><br/></html> 5) Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-07-29'),
(50, 'Other:KULIAH', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> 1) Magang<html><br/></html> 2) Skripsi<html><br/></html> 3) Tentang Absensi <html><br/></html> 4) Kontak Dosen <html><br/></html> 5) Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-07-29'),
(51, 'Other:SAYA,Other:INGIN,Other:AMBIL,Other:SKRIPSI', 'Apa yang ingin kamu ketahui tentang skripsi? (Syarat pengambilan, pembimbing, syarat sidang)', '2018-07-29'),
(52, 'Other:APA,Other:ADA,Other:SYARAT,Other:YANG,Other:SAYA,Other:HARUS,Other:KETAHUI', 'Untuk mengambil mata kuliah skripsi, harus minimal berada di semester 8 dan telah mengambil mata kuliah magang.', '2018-07-29'),
(53, 'Question:APAKAH,Other:SKRIPSI,Other:BOLEH,Other:SAMBIL,Other:KULIAH', '', '2018-07-29'),
(54, 'Question:APAKAH,Other:KULIAH,Other:BOLEH,Other:SAMBIL,Other:SKRIPSI', 'Apa yang ingin kamu ketahui tentang skripsi? (Syarat pengambilan, pembimbing, syarat sidang)', '2018-07-29'),
(55, 'Other:ADA,Other:SARAN,Other:MATA,Other:KULIAH,Other:YANG,Other:HARUS,Other:SAYA,Other:AMBIL', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> 1) Magang<html><br/></html> 2) Skripsi<html><br/></html> 3) Tentang Absensi <html><br/></html> 4) Kontak Dosen <html><br/></html> 5) Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-07-29'),
(56, 'Other:MAGANG', 'Apa yang ingin kamu ketahui tentang magang? (Minimal sks, syarat sidang magang, tempat kerja magang, laporan magang)', '2018-07-29'),
(57, 'Other:LAPORAN', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> 1) Magang<html><br/></html> 2) Skripsi<html><br/></html> 3) Tentang Absensi <html><br/></html> 4) Kontak Dosen <html><br/></html> 5) Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-07-29'),
(58, 'Other:MAGANG', 'Apa yang ingin kamu ketahui tentang magang? (Minimal sks, syarat sidang magang, tempat kerja magang, laporan magang)', '2018-07-29'),
(59, 'Other:LAPORAN', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> 1) Magang<html><br/></html> 2) Skripsi<html><br/></html> 3) Tentang Absensi <html><br/></html> 4) Kontak Dosen <html><br/></html> 5) Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-07-29'),
(60, 'Other:MAGANG', 'Apa yang ingin kamu ketahui tentang magang? (Minimal sks, syarat sidang magang, tempat kerja magang, laporan magang)', '2018-07-29'),
(61, 'Other:PEDOMAN,Other:LAPORAN', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> 1) Magang<html><br/></html> 2) Skripsi<html><br/></html> 3) Tentang Absensi <html><br/></html> 4) Kontak Dosen <html><br/></html> 5) Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-07-29'),
(62, 'Other:MAGANG', 'Apa yang ingin kamu ketahui tentang magang? (Minimal sks, syarat sidang magang, tempat kerja magang, laporan magang)', '2018-07-29'),
(63, 'Other:LAPORAN', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> 1) Magang<html><br/></html> 2) Skripsi<html><br/></html> 3) Tentang Absensi <html><br/></html> 4) Kontak Dosen <html><br/></html> 5) Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-07-29'),
(64, 'Other:KULIAH', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> 1) Magang<html><br/></html> 2) Skripsi<html><br/></html> 3) Tentang Absensi <html><br/></html> 4) Kontak Dosen <html><br/></html> 5) Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-07-31'),
(65, 'Other:MATAKULIAH', 'Apa yang mau kamu tanyakan terkait mata kuliah?(Matkul Wajib, Matkul Pilihan, Lulus Mata Kuliah,)', '2018-07-31'),
(66, 'Other:ADA,Other:KODE,Other:MATKUL', 'Sepertinya terlalu banyak bila saya sebutkan. Untuk sekarang kamu bisa melihat melalui anjungan mahasiswa.', '2018-07-31'),
(67, 'Other:MATKUL,Other:WAJIB', 'Mata kuliah wajib yang ingin kamu tanyakan? Semester berapa ya?', '2018-07-31'),
(68, 'Other:HAI', 'Halo', '2018-07-31'),
(69, 'Other:BERAPA,Other:NOMOR,Other:PAK,Person:ABDUL HARIS', 'Apa Anda ingin meminta nomor kontak dosen?(Ya/Tidak)', '2018-07-31'),
(70, 'Other:YA', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> 1) Magang<html><br/></html> 2) Skripsi<html><br/></html> 3) Tentang Absensi <html><br/></html> 4) Kontak Dosen <html><br/></html> 5) Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-07-31'),
(71, 'Other:BERAPA,Other:NOMOR,Other:PAK,Person:HARIS', 'Apa Anda ingin meminta nomor kontak dosen?(Ya/Tidak)', '2018-07-31'),
(72, 'Other:BERAPA', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> 1) Magang<html><br/></html> 2) Skripsi<html><br/></html> 3) Tentang Absensi <html><br/></html> 4) Kontak Dosen <html><br/></html> 5) Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-07-31'),
(73, 'Other:HAI', 'Halo juga :D', '2018-07-31'),
(74, 'Other:BERAPA,Other:NOMOR', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> 1) Magang<html><br/></html> 2) Skripsi<html><br/></html> 3) Tentang Absensi <html><br/></html> 4) Kontak Dosen <html><br/></html> 5) Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-07-31'),
(75, 'Other:BERAPA,Other:NOMOR,Other:PAK,Person:HARIS', '', '2018-07-31'),
(76, 'Other:BERAPA,Other:NOMOR,Other:PAK,Person:HARIS', '', '2018-07-31'),
(77, 'Other:BERAPA,Other:NOMOR,Location:HARIS', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> 1) Magang<html><br/></html> 2) Skripsi<html><br/></html> 3) Tentang Absensi <html><br/></html> 4) Kontak Dosen <html><br/></html> 5) Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-07-31'),
(78, 'Other:BERAPA,Other:NOMOR,Other:PAK,Person:HARIS', '', '2018-07-31'),
(79, 'Other:BERAPA,Other:NOMOR,Other:PAK,Other:HARIS', '', '2018-07-31'),
(80, 'Other:BERAPA,Other:NOMOR,Other:PAK,Person:ABDUL HARIS', '', '2018-07-31'),
(81, 'Other:BERAPA,Other:NOMOR,Other:PAK,Person:ABDUL,Other:ROKHIM', 'Maaf mungkin namanya bisa lebih jelas lagi? Mohon tambahkan Pak atau Ibu di depan nama dosen.', '2018-07-31'),
(82, 'Other:BERAPA,Other:NOMOR,Location:ABDUL,Other:ROKHIM', 'Maaf mungkin namanya bisa lebih jelas lagi? Mohon tambahkan Pak atau Ibu di depan nama dosen.', '2018-07-31'),
(83, 'Other:BERAPA,Other:NOMOR,Other:PAK,Other:ABDURRASYID', 'Maaf mungkin namanya bisa lebih jelas lagi? Mohon tambahkan Pak atau Ibu di depan nama dosen.', '2018-07-31'),
(84, 'Other:BERAPA,Other:NOMOR,Other:ABDURRASYID', 'Maaf mungkin namanya bisa lebih jelas lagi? Mohon tambahkan Pak atau Ibu di depan nama dosen.', '2018-07-31'),
(85, 'Other:BERAPA,Other:NOMOR,Other:PAK,Person:ABDUL HARIS', 'Pak Abdul Haris: 0819-3172-9530', '2018-07-31'),
(86, 'Other:BERAPA,Other:NOMOR,Other:PAK,Other:ABDURRASYID', 'Pak Abdurrasyid: 0817-9888-420', '2018-07-31'),
(87, 'Other:BERAPA,Other:NOMOR,Other:TELEPON,Other:PAK,Other:ZEN', 'Pak Achmad Bachtiar Zen: 0813-8007-6763', '2018-07-31'),
(88, 'Other:SAYA,Other:INGIN,Other:MINTA,Intent:NOMOR,Other:DOSEN', 'Maaf mungkin namanya bisa lebih jelas lagi? Mohon tambahkan Pak atau Ibu di depan nama dosen.', '2018-07-31'),
(89, 'Intent:KONTAK,Other:DOSEN', 'Anda ingin meminta kontak dosen siapa ya? (Awali dengan Pak atau Ibu diikuti dengan nama)', '2018-07-31'),
(90, 'Other:PAK,Person:HARIS', 'Maaf mungkin namanya bisa lebih jelas lagi? Mohon tambahkan Pak atau Ibu di depan nama dosen.', '2018-07-31'),
(91, 'Other:HAHAHA', 'Maaf mungkin namanya bisa lebih jelas lagi? Mohon tambahkan Pak atau Ibu di depan nama dosen.', '2018-07-31'),
(92, 'Other:HAI', 'Halo', '2018-07-31'),
(93, 'Other:SAYA,Other:INGIN,Other:MINTA,Intent:KONTAK,Other:DOSEN', 'Anda ingin meminta kontak dosen siapa ya? (Awali dengan Pak atau Ibu diikuti dengan nama)', '2018-07-31'),
(94, 'Other:PAK,Person:ABDUL HARIS', 'Maaf mungkin namanya bisa lebih jelas lagi? Mohon tambahkan Pak atau Ibu di depan nama dosen.KONTAK_DOSEN', '2018-07-31'),
(95, 'Other:SAYA,Other:INGIN,Other:MINTA,Intent:KONTAK,Other:DOSEN', 'Anda ingin meminta kontak dosen siapa ya? (Awali dengan Pak atau Ibu diikuti dengan nama)', '2018-07-31'),
(96, 'Other:PAK,Person:ABDUL HARIS', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> 1) Magang<html><br/></html> 2) Skripsi<html><br/></html> 3) Tentang Absensi <html><br/></html> 4) Kontak Dosen <html><br/></html> 5) Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-07-31'),
(97, 'Other:SAYA,Other:INGIN,Other:MINTA,Intent:KONTAK,Other:DOSEN', 'Kamu mau kontak dosen siapa? Mohon sebutkan nama (Awali dengan Pak atau Ibu diikuti dengan nama)', '2018-07-31'),
(98, 'Other:PAK,Other:OCID', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> 1) Magang<html><br/></html> 2) Skripsi<html><br/></html> 3) Tentang Absensi <html><br/></html> 4) Kontak Dosen <html><br/></html> 5) Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-07-31'),
(99, 'Other:SAYA,Other:INGIN,Other:MINTA,Intent:KONTAK,Other:DOSEN', 'Boleh. Kontak dosen siapa ya? (Awali dengan Pak atau Ibu diikuti dengan nama)', '2018-07-31'),
(100, 'Other:PAK,Person:ABDUL,Other:ROKHIM', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> 1) Magang<html><br/></html> 2) Skripsi<html><br/></html> 3) Tentang Absensi <html><br/></html> 4) Kontak Dosen <html><br/></html> 5) Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-07-31'),
(101, 'Other:AKU,Other:INGIN,Intent:KONTAK,Other:DOSEN', 'Anda ingin meminta kontak dosen siapa ya? (Awali dengan Pak atau Ibu diikuti dengan nama)', '2018-07-31'),
(102, 'Location:IBU,Other:DWINA', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> 1) Magang<html><br/></html> 2) Skripsi<html><br/></html> 3) Tentang Absensi <html><br/></html> 4) Kontak Dosen <html><br/></html> 5) Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-07-31'),
(103, 'Other:HAI', 'Hai. Ada yang bisa dibantu?', '2018-07-31'),
(104, 'Intent:KONTAK,Other:DOSEN', 'Boleh. Kontak dosen siapa ya? (Awali dengan Pak atau Ibu diikuti dengan nama)', '2018-07-31'),
(105, 'Other:PAK,Person:HARIS', 'Pak Abdul Haris: 0819-3172-9530', '2018-07-31'),
(106, 'Other:SAYA,Other:INGIN,Other:MINTA,Intent:KONTAK,Other:DOSEN', 'Anda ingin meminta kontak dosen siapa ya? (Awali dengan Pak atau Ibu diikuti dengan nama)', '2018-07-31'),
(107, 'Location:IBU,Other:DINE', 'Ibu Dine Tiara Kusuma: 0821-1265-5596', '2018-07-31'),
(108, 'Other:TERIMA,Other:KASIH', 'Sama-sama. Ada lagi yang bisa dibantu?', '2018-07-31'),
(109, 'Other:TIDAK,Other:ADA', 'Mungkin Anda ingin menanyakan hal lain?', '2018-07-31'),
(110, 'Other:BERAPA,Other:NOMOR,Other:PAK,Person:JATNIKA', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> 1) Magang<html><br/></html> 2) Skripsi<html><br/></html> 3) Tentang Absensi <html><br/></html> 4) Kontak Dosen <html><br/></html> 5) Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-07-31'),
(111, 'Other:BERAPA,Other:NOMOR,Location:IBU,Other:PUJI', 'Ibu Puji Catur S. Praptini: 0838-7906-0234', '2018-07-31'),
(112, 'Other:TERIMA,Other:KASIH', 'Sama-sama. Ada lagi yang bisa dibantu?', '2018-07-31'),
(113, 'Other:TIDAK,Other:ADA', 'Mungkin Anda ingin menanyakan hal lain?', '2018-07-31'),
(114, 'Other:DIMANA,Location:LABORATORIUM DASAR', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> 1) Magang<html><br/></html> 2) Skripsi<html><br/></html> 3) Tentang Absensi <html><br/></html> 4) Kontak Dosen <html><br/></html> 5) Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-07-31'),
(115, 'Question:DI MANA,Location:LABORATORIUM DASAR', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> 1) Magang<html><br/></html> 2) Skripsi<html><br/></html> 3) Tentang Absensi <html><br/></html> 4) Kontak Dosen <html><br/></html> 5) Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-07-31'),
(116, 'Other:DI,Other:MANA,Location:LABORATORIUM LANJUT', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> 1) Magang<html><br/></html> 2) Skripsi<html><br/></html> 3) Tentang Absensi <html><br/></html> 4) Kontak Dosen <html><br/></html> 5) Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-07-31'),
(117, 'Other:DI,Other:MANA,Location:LABORATORIUM DASAR', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> 1) Magang<html><br/></html> 2) Skripsi<html><br/></html> 3) Tentang Absensi <html><br/></html> 4) Kontak Dosen <html><br/></html> 5) Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-07-31'),
(118, 'Question:DI MANA,Location:LABORATORIUM LANJUT', 'Laboratorium Komputer Lanjut ada di lantai 3. Bila dari lift, akan langsung terlihat laboratorium komputer lanjut.', '2018-07-31'),
(119, 'Question:DI MANA,Location:LABORATORIUM MULTIMEDIA', 'Laboratorium Komputer Multimedia ada di lantai 3 Bila dari lift, belok ke kiri.', '2018-07-31'),
(120, 'Intent:MATA,Other:KULIAH', 'Apa yang mau kamu tanyakan terkait mata kuliah?(Matkul Wajib, Matkul Pilihan, Lulus Mata Kuliah,)', '2018-07-31'),
(121, 'Other:MATAKULIAH,Other:WAJIB', 'Mata kuliah wajib yang ingin kamu tanyakan? Semester berapa ya?', '2018-07-31'),
(122, 'Number:5', 'Sistem Informasi, Pemrograman SQL, Teknik Kompilasi, Kecerdasan Buatan, Teknik Animasi, Sistem Basis Data + Praktik, Jaringan Komputer + Praktik, Keamanan Sistem Komputer, Metode Numerik', '2018-07-31'),
(123, 'Other:PILIHAN', 'Mata kuliah pilihan yang ingin kamu tanyakan? Semester berapa? 6 atau 7?', '2018-07-31'),
(124, 'Number:7', 'Untuk SI atau Jaringan?', '2018-07-31'),
(125, 'Other:JARINGAN', 'Embedded System, Sistem Kinerja Jaringan, Forensik Komputer dan Jaringan Network Forensik, Robotik', '2018-07-31'),
(126, 'Other:HAI', 'Iya', '2018-07-31'),
(127, 'Other:HAI', 'Hai. Butuh bantuan?', '2018-07-31'),
(128, 'Other:HAI', 'Hai. Ada yang bisa dibantu?', '2018-07-31'),
(129, 'Other:HAI', 'Iya', '2018-07-31'),
(130, 'Other:HAI', 'Halo', '2018-07-31'),
(131, 'Other:KAMU,Question:SIAPA', 'Saya sesuatu yang bisa membantu kamu.', '2018-07-31'),
(132, 'Other:SAYA,Other:BINGUNG,Intent:MATA,Other:KULIAH', 'Apa yang mau kamu tanyakan terkait mata kuliah?(Matkul Wajib, Matkul Pilihan, Lulus Mata Kuliah,)', '2018-07-31'),
(133, 'Other:HAI', 'Hai. Butuh bantuan?', '2018-08-01'),
(134, 'Other:SAYA,Other:INGIN,Other:BERTANYA,Other:SOAL,Other:MAGANG', 'Apa yang ingin kamu ketahui tentang magang? (Minimal sks, syarat sidang magang, tempat kerja magang, laporan magang)', '2018-08-01'),
(135, 'Question:DIMANA,Other:SAYA,Other:BISA,Other:MENDAPAT,Other:TEMPAT,Other:KERJA,Other:MAGANG', 'Kamu bebas memilih tempat magang kamu. Yang penting masih berhubungan dengan IT.<html><br></br></html>Atau bila kesulitan mencari tempat magang, bisa menghubungi jurusan.', '2018-08-01'),
(136, 'Other:BERAPA,Other:LEMBAR,Other:MINIMAL,Other:LAPORAN,Other:MAGANG', 'Apa yang ingin kamu ketahui tentang laporan magang?(format, batas pengumpulan)', '2018-08-01'),
(137, 'Intent:FORMAT', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> 1) Magang<html><br/></html> 2) Skripsi<html><br/></html> 3) Tentang Absensi <html><br/></html> 4) Kontak Dosen <html><br/></html> 5) Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-08-01'),
(138, 'Intent:FORMAT,Other:LAPORAN', 'Kamu bisa unduh format laporan magang di situs resmi STT-PLN di sttpln.ac.id', '2018-08-01'),
(139, 'Other:TERIMA,Other:KASIH', 'Sama-sama. Ada lagi yang bisa dibantu?', '2018-08-01'),
(140, 'Other:TIDAK,Other:ADA', 'Mungkin Anda ingin menanyakan hal lain?', '2018-08-01'),
(141, 'Other:TIDAK', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> 1) Magang<html><br/></html> 2) Skripsi<html><br/></html> 3) Tentang Absensi <html><br/></html> 4) Kontak Dosen <html><br/></html> 5) Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-08-01'),
(142, 'Other:TERIMA,Other:KASIH', 'Sama-sama. Ada lagi yang bisa dibantu?', '2018-08-01'),
(143, 'Other:HAI', 'Hai. Butuh bantuan?', '2018-08-02'),
(144, 'Question:APA,Other:KAMU,Other:BISA,Other:MENJAWAB,Other:TENTANG,Other:MAGANG', 'Apa yang ingin kamu ketahui tentang magang? (Minimal sks, syarat sidang magang, tempat kerja magang, laporan magang)', '2018-08-02'),
(145, 'Other:TEMPAT,Other:KERJA,Other:MAGANG', 'Kamu bebas memilih tempat magang kamu. Yang penting masih berhubungan dengan IT.<html><br></br></html>Atau bila kesulitan mencari tempat magang, bisa menghubungi jurusan.', '2018-08-02'),
(146, 'Other:BAGAIAMANA,Other:DENGAN,Other:LAPORAN,Other:MAGANG', 'Apa yang ingin kamu ketahui tentang laporan magang?(format, batas pengumpulan)', '2018-08-02'),
(147, 'Intent:FORMAT,Other:LAPORAN', 'Bisa kamu unduh di website resmi STT-PLN yaitu www.sttpln.ac.id', '2018-08-02'),
(148, 'Other:BATAS,Other:PENGUMPULAN', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> 1) Magang<html><br/></html> 2) Skripsi<html><br/></html> 3) Tentang Absensi <html><br/></html> 4) Kontak Dosen <html><br/></html> 5) Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-08-02'),
(149, 'Other:MINIMAL,Other:SEMESTER,Other:BERAPA,Other:UNTUK,Other:MAGANG', 'Untuk mengambil mata kuliah magang, harus minimal berada di semester 7 dan tidak boleh mengambil mata kuliah selain magang.', '2018-08-02'),
(150, 'Other:TERIMA,Other:KASIH', 'Sama-sama. Ada lagi yang bisa dibantu?', '2018-08-02'),
(151, 'Other:TIDAK,Other:ADA', 'Mungkin Anda ingin menanyakan hal lain?', '2018-08-02'),
(152, 'Other:MINIMAL,Other:SKS,Other:UNTUK,Other:MAGANG', 'Apa yang ingin kamu ketahui tentang magang? (Minimal sks, syarat sidang magang, tempat kerja magang, laporan magang)', '2018-08-02'),
(153, 'Other:MINIMAL,Other:SKS', 'Minimal untuk mengambil mata kuliah magang, kamu harus sudah lulus 100 SKS.', '2018-08-02'),
(154, 'Other:SEMESTER,Other:PENDEK', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> 1) Magang<html><br/></html> 2) Skripsi<html><br/></html> 3) Tentang Absensi <html><br/></html> 4) Kontak Dosen <html><br/></html> 5) Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-08-02'),
(155, 'Other:ADA,Other:SARAN,Intent:MATA,Other:KULIAH,Question:APA,Other:YANG,Other:HARUS,Other:SAYA,Other:AMBIL', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> 1) Magang<html><br/></html> 2) Skripsi<html><br/></html> 3) Tentang Absensi <html><br/></html> 4) Kontak Dosen <html><br/></html> 5) Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-08-02'),
(156, 'Other:SAYA,Other:INGIN,Other:TAHU,Other:NAMA,Other:PEMBIMBING,Other:MAGANG,Other:SAYA', 'Hai, senang kenalan sama kamu.', '2018-08-02'),
(157, 'Question:SIAPA,Other:SAYA', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> 1) Magang<html><br/></html> 2) Skripsi<html><br/></html> 3) Tentang Absensi <html><br/></html> 4) Kontak Dosen <html><br/></html> 5) Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-08-02'),
(158, 'Other:HAI', 'Hai. Butuh bantuan?', '2018-08-02'),
(159, 'Other:IYA', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> 1) Magang<html><br/></html> 2) Skripsi<html><br/></html> 3) Tentang Absensi <html><br/></html> 4) Kontak Dosen <html><br/></html> 5) Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-08-02'),
(160, 'Other:SAVE', 'Tersimpan.', '2018-08-03'),
(161, 'Other:SAVE', 'Tersimpan.', '2018-08-03'),
(162, 'Other:SAVE', 'Tersimpan.', '2018-08-03'),
(163, 'Other:SAVE', 'Tersimpan.', '2018-08-03'),
(164, 'Other:SAVE', 'Tersimpan.', '2018-08-03'),
(165, 'Other:SAVE', 'Tersimpan.', '2018-08-03'),
(166, 'Other:SAVE', 'Tersimpan.', '2018-08-03'),
(167, 'Other:SAVE', 'Tersimpan.', '2018-08-03'),
(168, 'Other:BERAPA,Other:NOMOR,Other:PAK,Other:SUKRI', 'Pak Sukri Mursani: 021-5495303', '2018-08-03'),
(169, 'Number:1', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> 1) Magang<html><br/></html> 2) Skripsi<html><br/></html> 3) Tentang Absensi <html><br/></html> 4) Kontak Dosen <html><br/></html> 5) Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-08-03'),
(170, 'Other:SAYA,Other:INGIN,Other:TANYA,Other:MAGANG', 'Apa yang ingin kamu ketahui tentang magang? (Minimal sks, syarat sidang magang, tempat kerja magang, laporan magang)', '2018-08-03'),
(171, 'Other:MINIMAL,Other:SKS', 'Minimal untuk mengambil mata kuliah magang, kamu harus sudah lulus 100 SKS.', '2018-08-03'),
(172, 'Other:KIRA-KIRA,Other:TEMPAT,Other:UNTUK,Other:KERJA,Other:MAGANG,Other:HARUS,Question:BAGAIMANA', 'Kamu bebas memilih tempat magang kamu. Yang penting masih berhubungan dengan IT.<html><br></br></html>Atau bila kesulitan mencari tempat magang, bisa menghubungi jurusan.', '2018-08-03'),
(173, 'Other:SAVE', 'Tersimpan.', '2018-08-03'),
(174, 'Question:APA,Other:KAMU,Other:TAU,Other:TEMPAT,Other:KERJA,Other:MAGANG', 'Kamu bebas memilih tempat magang kamu. Yang penting masih berhubungan dengan IT dan yang kamu kerjakan tidak cuma bikin kopi dan fotokopi.<html><br></br></html>Atau bila kesulitan mencari tempat magang, bisa menghubungi jurusan.', '2018-08-03'),
(175, 'Other:HAI', 'Hai', '2018-08-03'),
(176, 'Other:BERAPA,Other:NOMOR,Other:PAK,Person:HARIS', 'Pak Abdul Haris: 0819-3172-9530', '2018-08-03'),
(177, 'Other:SAYA,Other:INGIN,Other:TAHU,Intent:SOAL,Other:SKRIPSI', 'Apa yang ingin kamu ketahui tentang skripsi? (Syarat pengambilan, pembimbing, syarat sidang)', '2018-08-08'),
(178, 'Intent:SYARAT SIDANG', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> 1) Magang<html><br/></html> 2) Skripsi<html><br/></html> 3) Tentang Absensi <html><br/></html> 4) Kontak Dosen <html><br/></html> 5) Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-08-08'),
(179, 'Intent:SYARAT SIDANG SKRIPSI', 'Untuk mengambil mata kuliah skripsi, harus minimal berada di semester 8 dan telah mengambil mata kuliah magang.', '2018-08-08'),
(180, 'Other:SAVE', 'Tersimpan.', '2018-08-08'),
(181, 'Other:SYA,Other:INGIN,Other:TAHU,Intent:SOAL,Other:SKRIPSI', 'Apa yang ingin kamu ketahui tentang skripsi? (Syarat pengambilan, pembimbing, syarat sidang)', '2018-08-08'),
(182, 'Other:SYARAT,Other:PENGAMBILAN', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> 1) Magang<html><br/></html> 2) Skripsi<html><br/></html> 3) Tentang Absensi <html><br/></html> 4) Kontak Dosen <html><br/></html> 5) Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-08-08'),
(183, 'Other:SKRIPSI', 'Apa yang ingin kamu ketahui tentang skripsi? (Syarat pengambilan, pembimbing, syarat sidang)', '2018-08-08'),
(184, 'Intent:SYARAT SIDANG', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> 1) Magang<html><br/></html> 2) Skripsi<html><br/></html> 3) Tentang Absensi <html><br/></html> 4) Kontak Dosen <html><br/></html> 5) Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-08-08'),
(185, 'Intent:SYARAT SIDANG SKRIPSI', 'Untuk mengambil mata kuliah skripsi, harus minimal berada di semester 8 dan telah mengambil mata kuliah magang.', '2018-08-08'),
(186, 'Other:SAVE', 'Tersimpan.', '2018-08-08'),
(187, 'Intent:SYARAT SIDANG SKRIPSI', 'Untuk mengambil mata kuliah skripsi, harus minimal berada di semester 8 dan telah mengambil mata kuliah magang.', '2018-08-08'),
(188, 'Other:SAVE', 'Tersimpan.', '2018-08-08'),
(189, 'Intent:SYARAT SIDANG SKRIPSI', 'Untuk mengambil mata kuliah skripsi, harus minimal berada di semester 8 dan telah mengambil mata kuliah magang.', '2018-08-08'),
(190, 'Intent:SYARAT SIDANG,Other:DONG', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> 1) Magang<html><br/></html> 2) Skripsi<html><br/></html> 3) Tentang Absensi <html><br/></html> 4) Kontak Dosen <html><br/></html> 5) Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-08-08'),
(191, 'Intent:SYARAT SIDANG MAGANG', 'Apa yang ingin kamu ketahui tentang magang? (Minimal sks, syarat sidang magang, tempat kerja magang, laporan magang)', '2018-08-08'),
(192, 'Intent:SYARAT SIDANG MAGANG', 'Apa yang ingin kamu ketahui tentang magang? (Minimal sks, syarat sidang magang, tempat kerja magang, laporan magang)', '2018-08-08'),
(193, 'Intent:SYARAT SIDANG', 'Mohon maaf pertanyaan atau pernyataannya belum jelas. Mungkin bisa diulangi.', '2018-08-08'),
(194, 'Other:SKRIPSI', 'Apa yang ingin kamu ketahui tentang skripsi? (Syarat pengambilan, pembimbing, syarat sidang skripsi)', '2018-08-08'),
(195, 'Other:SYARAT,Other:PENGAMBILAN,Intent:SKRIPSI', '', '2018-08-08'),
(196, 'Intent:SYARAT,Other:AMBIL,Intent:SKRIPSI', 'Untuk mengambil mata kuliah skripsi, harus minimal berada di semester 8 dan telah mengambil mata kuliah magang.', '2018-08-08'),
(197, 'Intent:SYARAT SIDANG SKRIPSI', 'Untuk mengambil mata kuliah skripsi, harus minimal berada di semester 8 dan telah mengambil mata kuliah magang.', '2018-08-08'),
(198, 'Other:SAVE', 'Tersimpan.', '2018-08-08'),
(199, 'Intent:MAGANG', 'Apa yang ingin kamu ketahui tentang magang? (Minimal sks, syarat sidang magang, tempat kerja magang, laporan magang)', '2018-08-08'),
(200, 'Intent:SYARAT SIDANG MAGANG', 'Apa yang ingin kamu ketahui tentang magang? (Minimal sks, syarat sidang magang, tempat kerja magang, laporan magang)', '2018-08-08'),
(201, 'Intent:SYARAT SIDANG', 'Mohon maaf pertanyaan atau pernyataannya belum jelas. Mungkin bisa diulangi.', '2018-08-08'),
(202, 'Intent:MAGANG', 'Apa yang ingin kamu ketahui tentang magang? (Minimal sks, syarat sidang magang, tempat kerja magang, laporan magang)', '2018-08-08'),
(203, 'Other:SAVE', 'Tersimpan.', '2018-08-08'),
(204, 'Intent:MAGANG', 'Apa yang ingin kamu ketahui tentang magang? (Minimal sks, syarat sidang magang, tempat kerja magang, laporan magang)', '2018-08-08'),
(205, 'Intent:SYARAT SIDANG MAGANG', 'Mohon maaf pertanyaan atau pernyataannya belum jelas. Mungkin bisa diulangi.', '2018-08-08'),
(206, 'Other:SAVE', 'Tersimpan.', '2018-08-08'),
(207, 'Intent:MAGANG', 'Apa yang ingin kamu ketahui tentang magang? (Minimal sks, syarat sidang magang, tempat kerja magang, laporan magang)', '2018-08-08'),
(208, 'Intent:SYARAT SIDANG MAGANG', 'Mohon maaf pertanyaan atau pernyataannya belum jelas. Mungkin bisa diulangi.', '2018-08-08'),
(209, 'Other:SAVE', 'Tersimpan.', '2018-08-08'),
(210, 'Intent:MAGANG', 'Apa yang ingin kamu ketahui tentang magang? (Minimal sks, syarat sidang magang, tempat kerja magang, laporan magang)', '2018-08-08'),
(211, 'Intent:MAGANG', 'Apa yang ingin kamu ketahui tentang magang? (Minimal sks, syarat sidang magang, tempat kerja magang, laporan magang)', '2018-08-08'),
(212, 'Intent:SYARAT SIDANG', 'Mohon maaf pertanyaan atau pernyataannya belum jelas. Mungkin bisa diulangi.', '2018-08-08'),
(213, 'Intent:TEMPAT,Other:KERJA', 'Kamu bebas memilih tempat magang kamu. Yang penting masih berhubungan dengan IT dan yang kamu kerjakan tidak cuma bikin kopi dan fotokopi.', '2018-08-08'),
(214, 'Other:SEMESTER,Intent:MAGANG', 'Untuk mengambil mata kuliah magang, harus minimal berada di semester 7 dan tidak boleh mengambil mata kuliah selain magang.', '2018-08-08'),
(215, 'Intent:MINIMAL SKS', 'Mohon maaf pertanyaan atau pernyataannya belum jelas. Mungkin bisa diulangi.', '2018-08-08'),
(216, 'Intent:MINIMAL SKS', 'Mohon maaf pertanyaan atau pernyataannya belum jelas. Mungkin bisa diulangi.', '2018-08-08'),
(217, 'Intent:MINIMAL SKS,Other:MAGANG', 'Mohon maaf pertanyaan atau pernyataannya belum jelas. Mungkin bisa diulangi.', '2018-08-08'),
(218, 'Intent:SYARAT SIDANG', 'Mohon maaf pertanyaan atau pernyataannya belum jelas. Mungkin bisa diulangi.', '2018-08-08'),
(219, 'Other:SAVE', 'Tersimpan.', '2018-08-08'),
(220, 'Intent:SYARAT SIDANG', 'Mohon maaf pertanyaan atau pernyataannya belum jelas. Mungkin bisa diulangi.', '2018-08-08'),
(221, 'Intent:MAGANG', 'Apa yang ingin kamu ketahui tentang magang? (Minimal sks, syarat sidang magang, tempat kerja magang, laporan magang)', '2018-08-08'),
(222, 'Intent:SYARAT SIDANG', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> 1) Magang<html><br/></html> 2) Skripsi<html><br/></html> 3) Tentang Absensi <html><br/></html> 4) Kontak Dosen <html><br/></html> 5) Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-08-08'),
(223, 'Intent:SYARAT SIDANG MAGANG', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> 1) Magang<html><br/></html> 2) Skripsi<html><br/></html> 3) Tentang Absensi <html><br/></html> 4) Kontak Dosen <html><br/></html> 5) Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-08-08'),
(224, 'Intent:SYARAT SIDANG MAGANG', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> 1) Magang<html><br/></html> 2) Skripsi<html><br/></html> 3) Tentang Absensi <html><br/></html> 4) Kontak Dosen <html><br/></html> 5) Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-08-08'),
(225, 'Other:HAI', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> 1) Magang<html><br/></html> 2) Skripsi<html><br/></html> 3) Tentang Absensi <html><br/></html> 4) Kontak Dosen <html><br/></html> 5) Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-08-08'),
(226, 'Other:TERIMA,Other:KASIH', 'Sama-sama. Ada lagi yang bisa dibantu?', '2018-08-08'),
(227, 'Other:TIDAK,Other:ADA', 'Mungkin Anda ingin menanyakan hal lain?', '2018-08-08'),
(228, 'Other:TERIMA,Other:KASIH', 'Sama-sama. Ada lagi yang bisa dibantu?', '2018-08-08'),
(229, 'Other:HAI', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> 1) Magang<html><br/></html> 2) Skripsi<html><br/></html> 3) Tentang Absensi <html><br/></html> 4) Kontak Dosen <html><br/></html> 5) Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-08-08'),
(230, 'Other:HAI', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> 1) Magang<html><br/></html> 2) Skripsi<html><br/></html> 3) Tentang Absensi <html><br/></html> 4) Kontak Dosen <html><br/></html> 5) Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-08-08'),
(231, 'Other:HALO', 'Hai', '2018-08-08'),
(232, 'Other:HAI', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> 1) Magang<html><br/></html> 2) Skripsi<html><br/></html> 3) Tentang Absensi <html><br/></html> 4) Kontak Dosen <html><br/></html> 5) Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-08-08'),
(233, 'Other:HALO', 'Halo', '2018-08-08'),
(234, 'Other:SAVE', 'Tersimpan.', '2018-08-08'),
(235, 'Other:HAI', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> 1) Magang<html><br/></html> 2) Skripsi<html><br/></html> 3) Tentang Absensi <html><br/></html> 4) Kontak Dosen <html><br/></html> 5) Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-08-08'),
(236, 'Other:NAMA,Other:KAMU,Question:SIAPA', 'Saya tidak punya nama pasti. Tapi kamu bisa panggil sebagai chatbot jurusan. Nama kamu siapa?', '2018-08-08'),
(237, 'Question:SIAPA,Other:KAMU', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> 1) Magang<html><br/></html> 2) Skripsi<html><br/></html> 3) Tentang Absensi <html><br/></html> 4) Kontak Dosen <html><br/></html> 5) Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-08-08'),
(238, 'Intent:MINIMAL SKS,Other:MAGANG', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> 1) Magang<html><br/></html> 2) Skripsi<html><br/></html> 3) Tentang Absensi <html><br/></html> 4) Kontak Dosen <html><br/></html> 5) Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-08-08'),
(239, 'Other:SEMESTER,Other:MAGAGN', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> 1) Magang<html><br/></html> 2) Skripsi<html><br/></html> 3) Tentang Absensi <html><br/></html> 4) Kontak Dosen <html><br/></html> 5) Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-08-08'),
(240, 'Other:SEMESTER,Intent:MAGANG', 'Apa yang ingin kamu ketahui tentang magang? (Minimal sks, syarat sidang magang, tempat kerja magang, laporan magang)', '2018-08-08'),
(241, 'Intent:TEMPAT KERJA MAGANG', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> 1) Magang<html><br/></html> 2) Skripsi<html><br/></html> 3) Tentang Absensi <html><br/></html> 4) Kontak Dosen <html><br/></html> 5) Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-08-08'),
(242, 'Intent:TEMPAT,Other:KERJA', 'Kamu bebas memilih tempat magang kamu. Yang penting masih berhubungan dengan IT dan yang kamu kerjakan tidak cuma bikin kopi dan fotokopi.', '2018-08-08'),
(243, 'Intent:FORMAT LAPORAN', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> 1) Magang<html><br/></html> 2) Skripsi<html><br/></html> 3) Tentang Absensi <html><br/></html> 4) Kontak Dosen <html><br/></html> 5) Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-08-08'),
(244, 'Intent:FORMAT', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> 1) Magang<html><br/></html> 2) Skripsi<html><br/></html> 3) Tentang Absensi <html><br/></html> 4) Kontak Dosen <html><br/></html> 5) Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-08-08'),
(245, 'Intent:LAPORAN,Other:MAGANG', 'Apa yang ingin kamu ketahui tentang laporan magang?(format, batas pengumpulan)', '2018-08-08'),
(246, 'Other:PENGUMPULAN,Other:LAPORAN', 'Awal mulai ataupun batas akhir pengumpulan akan diberitahukan saat jadwal sudah ada. Jadwal ini bisa berubah-ubah sesuai keadaan.', '2018-08-08'),
(247, 'Other:PEDOMAN,Intent:LAPORAN MAGANG', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> 1) Magang<html><br/></html> 2) Skripsi<html><br/></html> 3) Tentang Absensi <html><br/></html> 4) Kontak Dosen <html><br/></html> 5) Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-08-08'),
(248, '', '', '2018-08-08'),
(249, 'Other:PENGUMPULAN,Other:LAPORAN', 'Awal mulai ataupun batas akhir pengumpulan akan diberitahukan saat jadwal sudah ada. Jadwal ini bisa berubah-ubah sesuai keadaan.', '2018-08-08'),
(250, 'Other:PENGUMPULAN,Intent:LAPORAN MAGANG', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> 1) Magang<html><br/></html> 2) Skripsi<html><br/></html> 3) Tentang Absensi <html><br/></html> 4) Kontak Dosen <html><br/></html> 5) Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-08-08'),
(251, 'Intent:PEMBIMBING MAGANG', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> 1) Magang<html><br/></html> 2) Skripsi<html><br/></html> 3) Tentang Absensi <html><br/></html> 4) Kontak Dosen <html><br/></html> 5) Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-08-08'),
(252, 'Other:PENGUMPULAN,Other:LAPORAN', 'Awal mulai ataupun batas akhir pengumpulan akan diberitahukan saat jadwal sudah ada. Jadwal ini bisa berubah-ubah sesuai keadaan.', '2018-08-08'),
(253, 'Other:LEMBAR,Other:PENGESAHAN,Other:MAGANG', 'Lembar pengesahan, RPKM, dan semua format lainnya ada di pedoman laporan kerja magang yang bisa kamu unduh di sttpln.ac.id', '2018-08-08'),
(254, 'Intent:LAPORAN MAGANG', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> 1) Magang<html><br/></html> 2) Skripsi<html><br/></html> 3) Tentang Absensi <html><br/></html> 4) Kontak Dosen <html><br/></html> 5) Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-08-08'),
(255, 'Intent:FORMAT LAPORAN', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> 1) Magang<html><br/></html> 2) Skripsi<html><br/></html> 3) Tentang Absensi <html><br/></html> 4) Kontak Dosen <html><br/></html> 5) Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-08-08'),
(256, 'Intent:BATAS PENGUMPULAN,Other:LAPORAN', 'Awal mulai ataupun batas akhir pengumpulan akan diberitahukan saat jadwal sudah ada. Jadwal ini bisa berubah-ubah sesuai keadaan.', '2018-08-08');
INSERT INTO `tbl_history_chat` (`session_id`, `pertanyaan`, `jawaban`, `tanggal_chat`) VALUES
(257, 'Intent:BATAS PENGUMPULAN', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> 1) Magang<html><br/></html> 2) Skripsi<html><br/></html> 3) Tentang Absensi <html><br/></html> 4) Kontak Dosen <html><br/></html> 5) Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-08-08'),
(258, 'Other:SKRIPSI', 'Apa yang ingin kamu ketahui tentang skripsi? (Syarat pengambilan, pembimbing, syarat sidang skripsi)', '2018-08-08'),
(259, 'Intent:SYARAT,Other:AMBIL,Intent:SKRIPSI', 'Untuk mengambil mata kuliah skripsi, harus minimal berada di semester 8 dan telah mengambil mata kuliah magang.', '2018-08-08'),
(260, 'Other:SYARAT,Other:PENGAMBILAN,Intent:SKRIPSI', '', '2018-08-08'),
(261, 'Other:SYARAT,Other:PENGAMBILAN', '', '2018-08-08'),
(262, 'Intent:PEMBIMBING SKRIPSI', 'Apa yang ingin kamu ketahui tentang skripsi? (Syarat pengambilan, pembimbing, syarat sidang skripsi)', '2018-08-08'),
(263, 'Other:SAYA,Other:INGIN,Other:TAHU,Intent:SKRIPSI,Other:DONG', '', '2018-08-08'),
(264, 'Question:APA,Other:KAMU,Other:TAHU,Other:INFO,Other:SKRIPSI,Other:SEKARANG', '', '2018-08-08'),
(265, 'Intent:SYARAT SIDANG SKRIPSI', 'Apa yang ingin kamu ketahui tentang skripsi? (Syarat pengambilan, pembimbing, syarat sidang skripsi)', '2018-08-08'),
(266, 'Other:LANJUTKAN', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> 1) Magang<html><br/></html> 2) Skripsi<html><br/></html> 3) Tentang Absensi <html><br/></html> 4) Kontak Dosen <html><br/></html> 5) Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-08-08'),
(267, 'Question:APA,Intent:SYARAT SIDANG SKRIPSI', '1) Penulisan skripsi telah disetujui oleh dosen pembimbing untuk diujikan pada ujian sidang skripsi.<html><br/></html>2) Telah lulus semua mata kuliah dengan minimal C yang sesuai dengan kurikulum yang berlaku.<html><br/></html>3)IPK minimal 2,0.<html><br/></html>4) Memiliki sertifikat TOEFL.<html><br/></html>Balas dengan \"Lanjutkan\" untuk syarat berikutnya.', '2018-08-08'),
(268, 'Intent:SYARAT SIDANG', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> 1) Magang<html><br/></html> 2) Skripsi<html><br/></html> 3) Tentang Absensi <html><br/></html> 4) Kontak Dosen <html><br/></html> 5) Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-08-08'),
(269, 'Other:RUANGAN,Other:LAB', 'Apakah kamu ingin mengetahui lokasi dari laboratorium? Laboratorium apa?', '2018-08-08'),
(270, 'Other:RUANGAN,Location:LABORATORIUM', 'Apakah kamu ingin mengetahui lokasi dari laboratorium? Laboratorium apa?', '2018-08-08'),
(271, 'Location:LABORATORIUM MULTIMEDIA', 'Laboratorium Komputer Multimedia ada di lantai 3 Bila dari lift, belok ke kiri.', '2018-08-08'),
(272, 'Location:LABORATORIUM DASAR', 'Laboratorium Komputer Dasar ada di lantai 3 berdekatan dengan laboratorium komputer open source. Bila dari lift, belok ke kanan hingga ujung lalu ke kiri.', '2018-08-08'),
(273, 'Other:TERIMA,Other:KASIH', 'Sama-sama. Ada lagi yang bisa dibantu?', '2018-08-08'),
(274, 'Other:DI,Question:MANA,Location:LABORATORIUM DASAR', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> 1) Magang<html><br/></html> 2) Skripsi<html><br/></html> 3) Tentang Absensi <html><br/></html> 4) Kontak Dosen <html><br/></html> 5) Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-08-08'),
(275, 'Question:DIMANA,Location:LABORATORIUM DASAR', 'Laboratorium Komputer Dasar ada di lantai 3 berdekatan dengan laboratorium komputer open source. Bila dari lift, belok ke kanan hingga ujung lalu ke kiri.', '2018-08-08'),
(276, 'Question:DIMANA,Location:LABORATORIUM OPEN,Location:SOURCE', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> 1) Magang<html><br/></html> 2) Skripsi<html><br/></html> 3) Tentang Absensi <html><br/></html> 4) Kontak Dosen <html><br/></html> 5) Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-08-08'),
(277, 'Question:DIMANA,Location:LABORATORIUM SIMPEL', 'Laboratorium Komputer Dasar ada di lantai 5 berdekatan dengan laboratorium komputer dasar 2. Sebelum masuk ke ruang jurusan, belok ke kiri.', '2018-08-08'),
(278, 'Other:RUANGAN,Other:DOSEN', 'Kamu ingin tahu ruangan dosen? Ruangan siapa?', '2018-08-08'),
(279, 'Other:SAYA,Other:INGIN,Other:TAHU,Intent:RUANGAN,Other:DOSEN', 'Kamu ingin tahu ruangan dosen? Ruangan siapa?', '2018-08-08'),
(280, 'Other:PAK,Person:ABDUL HARIS', 'Ruangannya berada di lantai 3. Ruangan di samping lift, dekat dengan pintu masuk menuju operation room atau lab bahasa inggris.', '2018-08-08'),
(281, 'Intent:SEMESTER,Other:PENDEK', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> 1) Magang<html><br/></html> 2) Skripsi<html><br/></html> 3) Tentang Absensi <html><br/></html> 4) Kontak Dosen <html><br/></html> 5) Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-08-08'),
(282, 'Other:SP', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> 1) Magang<html><br/></html> 2) Skripsi<html><br/></html> 3) Tentang Absensi <html><br/></html> 4) Kontak Dosen <html><br/></html> 5) Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-08-08'),
(284, 'Other:SP', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> 1) Magang<html><br/></html> 2) Skripsi<html><br/></html> 3) Tentang Absensi <html><br/></html> 4) Kontak Dosen <html><br/></html> 5) Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-08-08'),
(285, 'Question:APA,Other:ITU,Intent:SEMESTER,Other:PENDEK', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> 1) Magang<html><br/></html> 2) Skripsi<html><br/></html> 3) Tentang Absensi <html><br/></html> 4) Kontak Dosen <html><br/></html> 5) Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-08-08'),
(286, 'Question:APA,Intent:SEMESTER PENDEK', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> 1) Magang<html><br/></html> 2) Skripsi<html><br/></html> 3) Tentang Absensi <html><br/></html> 4) Kontak Dosen <html><br/></html> 5) Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-08-08'),
(287, 'Question:APA,Other:SP', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> 1) Magang<html><br/></html> 2) Skripsi<html><br/></html> 3) Tentang Absensi <html><br/></html> 4) Kontak Dosen <html><br/></html> 5) Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-08-08'),
(288, 'Other:SYARAT,Other:SP', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> 1) Magang<html><br/></html> 2) Skripsi<html><br/></html> 3) Tentang Absensi <html><br/></html> 4) Kontak Dosen <html><br/></html> 5) Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-08-08'),
(289, 'Other:SAYA,Other:INGIN,Other:TAHU,Other:SP', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> 1) Magang<html><br/></html> 2) Skripsi<html><br/></html> 3) Tentang Absensi <html><br/></html> 4) Kontak Dosen <html><br/></html> 5) Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-08-08'),
(290, 'Other:SAVE', 'Tersimpan.', '2018-08-08'),
(291, 'Question:APA,Intent:SEMESTER PENDEK', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> - Magang<html><br/></html> - Skripsi<html><br/></html> - Tentang Absensi <html><br/></html> - Kontak Dosen <html><br/></html> - Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-08-08'),
(292, 'Other:ADA,Other:YANG,Other:SAYA,Other:INGIN,Other:TAHU,Other:TENTANG,Intent:SEMESTER PENDEK', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> - Magang<html><br/></html> - Skripsi<html><br/></html> - Tentang Absensi <html><br/></html> - Kontak Dosen <html><br/></html> - Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-08-08'),
(293, 'Other:SAYA,Other:INGIN,Other:TAHU,Other:TENTANG,Intent:SEMESTER PENDEK', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> - Magang<html><br/></html> - Skripsi<html><br/></html> - Tentang Absensi <html><br/></html> - Kontak Dosen <html><br/></html> - Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-08-08'),
(294, 'Intent:SEMESTER,Other:PENDEK', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> - Magang<html><br/></html> - Skripsi<html><br/></html> - Tentang Absensi <html><br/></html> - Kontak Dosen <html><br/></html> - Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-08-08'),
(295, 'Other:S', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> - Magang<html><br/></html> - Skripsi<html><br/></html> - Tentang Absensi <html><br/></html> - Kontak Dosen <html><br/></html> - Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-08-08'),
(296, 'Other:SP', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> - Magang<html><br/></html> - Skripsi<html><br/></html> - Tentang Absensi <html><br/></html> - Kontak Dosen <html><br/></html> - Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-08-08'),
(297, 'Other:TENTANG,Intent:SEMESTER PENDEK', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> - Magang<html><br/></html> - Skripsi<html><br/></html> - Tentang Absensi <html><br/></html> - Kontak Dosen <html><br/></html> - Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-08-08'),
(298, 'Other:TENTANG,Intent:SKRIPSI', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> - Magang<html><br/></html> - Skripsi<html><br/></html> - Tentang Absensi <html><br/></html> - Kontak Dosen <html><br/></html> - Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-08-08'),
(299, 'Other:SKRIPSI', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> - Magang<html><br/></html> - Skripsi<html><br/></html> - Tentang Absensi <html><br/></html> - Kontak Dosen <html><br/></html> - Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-08-08'),
(300, 'Other:SAYA,Other:INGIN,Other:TAHU,Intent:SOAL,Other:SKRIPSI', 'Apa yang ingin kamu ketahui tentang skripsi? (Syarat pengambilan, pembimbing, syarat sidang skripsi)', '2018-08-08'),
(301, 'Intent:SYARAT,Other:AMBIL,Intent:SKRIPSI', 'Untuk mengambil mata kuliah skripsi, harus minimal berada di semester 8 dan telah mengambil mata kuliah magang.', '2018-08-08'),
(302, 'Question:APA,Other:SYARAT,Other:UNTUK,Other:AMBIL,Intent:SKRIPSI', 'Untuk mengambil mata kuliah skripsi, harus minimal berada di semester 8 dan telah mengambil mata kuliah magang.', '2018-08-08'),
(303, 'Other:SYARAT,Other:PENGAMBILAN', '', '2018-08-08'),
(304, 'Question:APA,Other:SYARAT,Other:UNTUK,Other:PENGAMBILAN,Other:SKRIPSI', '', '2018-08-08'),
(305, 'Question:APA,Other:BOLEH,Other:MEMILIH,Intent:PEMBIMBING SKRIPSI', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> - Magang<html><br/></html> - Skripsi<html><br/></html> - Tentang Absensi <html><br/></html> - Kontak Dosen <html><br/></html> - Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-08-08'),
(306, 'Intent:SYARAT SIDANG SKRIPSI', '1) Penulisan skripsi telah disetujui oleh dosen pembimbing untuk diujikan pada ujian sidang skripsi.<html><br/></html>2) Telah lulus semua mata kuliah dengan minimal C yang sesuai dengan kurikulum yang berlaku.<html><br/></html>3)IPK minimal 2,0.<html><br/></html>4) Memiliki sertifikat TOEFL.<html><br/></html>Balas dengan \"Lanjutkan\" untuk syarat berikutnya.', '2018-08-08'),
(307, 'Other:LANJUTKAN', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> - Magang<html><br/></html> - Skripsi<html><br/></html> - Tentang Absensi <html><br/></html> - Kontak Dosen <html><br/></html> - Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-08-08'),
(308, 'Intent:SYARAT SIDANG', '1) Penulisan skripsi telah disetujui oleh dosen pembimbing untuk diujikan pada ujian sidang skripsi.<html><br/></html>2) Telah lulus semua mata kuliah dengan minimal C yang sesuai dengan kurikulum yang berlaku.<html><br/></html>3)IPK minimal 2,0.<html><br/></html>4) Memiliki sertifikat TOEFL.<html><br/></html>Balas dengan \"Lanjutkan\" untuk syarat berikutnya.', '2018-08-08'),
(309, 'Other:TERIMA,Other:KASIH', 'Sama-sama. Ada lagi yang bisa dibantu?', '2018-08-08'),
(310, '', '', '2018-08-08'),
(311, 'Other:ADA', 'Apa itu?', '2018-08-08'),
(312, 'Other:SAYA,Other:INGIN,Other:MENCARI,Other:INFO,Other:TENTANG,Intent:MAGANG', 'Apa yang ingin kamu ketahui tentang magang? (Minimal sks, syarat sidang magang, tempat kerja magang, laporan magang)', '2018-08-08'),
(313, 'Other:PADA,Other:SEMESTER,Question:BERAPA,Other:SAYA,Other:BISA,Other:MAGANG', 'OTHER SEMESTER  MAGANG', '2018-08-08'),
(314, 'Other:SEMESTER,Question:BERAPA,Other:BISA,Other:MAGANG', 'Untuk mengambil mata kuliah magang, harus minimal berada di semester 7 dan tidak boleh mengambil mata kuliah selain magang.', '2018-08-08'),
(315, 'Other:BERAPAKAH,Intent:MINIMAL,Other:SKS,Other:UNTUK,Other:BISA,Other:AMBIL,Intent:MAGANG', 'Minimal untuk mengambil mata kuliah magang, kamu harus sudah lulus 100 SKS.', '2018-08-08'),
(316, 'Question:APA,Other:AJA,Other:SYARAT,Other:UNTUK,Other:SIDANG,Intent:MAGANG', 'Apa yang ingin kamu ketahui tentang magang? (Minimal sks, syarat sidang magang, tempat kerja magang, laporan magang)', '2018-08-08'),
(317, 'Intent:SYARAT SIDANG MAGANG', '1) Menyerahkan lembar pengesahan laporan kerja magang yang sudah di acc oleh dosen pembimbing kerja magang dan pembimbing lapangan.<html><br/></html>2) Surat selesai kerja magang.<html><br/></html>3)Laporan RPKM, harian, mingguan, sesuai format yang ditentukan.', '2018-08-08'),
(318, 'Other:SAYA,Other:BINGUNG,Other:MEMILIH,Intent:TEMPAT,Other:KERJA,Intent:MAGANG', 'Apa yang ingin kamu ketahui tentang magang? (Minimal sks, syarat sidang magang, tempat kerja magang, laporan magang)', '2018-08-08'),
(319, 'Other:KAMU,Other:ADA,Intent:FORMAT LAPORAN', 'Kamu bisa unduh format laporan magang di situs resmi STT-PLN di sttpln.ac.id', '2018-08-08'),
(320, 'Other:KAMU,Other:ADA,Intent:LAPORAN,Other:MAGANG', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> - Magang<html><br/></html> - Skripsi<html><br/></html> - Tentang Absensi <html><br/></html> - Kontak Dosen <html><br/></html> - Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-08-08'),
(321, 'Other:KAMU,Other:TAHU,Intent:FORMAT LAPORAN', 'Kamu bisa unduh format laporan magang di situs resmi STT-PLN di sttpln.ac.id', '2018-08-08'),
(322, 'Other:KAMU,Other:TAHU,Intent:FORMAT LAPORAN', 'Kamu bisa unduh format laporan magang di situs resmi STT-PLN di sttpln.ac.id', '2018-08-08'),
(323, 'Other:KAMU,Other:TAHU,Intent:FORMAT', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> - Magang<html><br/></html> - Skripsi<html><br/></html> - Tentang Absensi <html><br/></html> - Kontak Dosen <html><br/></html> - Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-08-08'),
(324, 'Other:TAHU,Intent:LAPORAN,Other:MAGANG', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> - Magang<html><br/></html> - Skripsi<html><br/></html> - Tentang Absensi <html><br/></html> - Kontak Dosen <html><br/></html> - Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-08-08'),
(325, 'Other:SAYA,Other:BUTUH,Other:PEDOMAN,Intent:LAPORAN MAGANG', 'Kamu bisa unduh format laporan magang di situs resmi STT-PLN di sttpln.ac.id', '2018-08-08'),
(326, 'Question:DIMANA,Other:SAYA,Other:BISA,Other:MENDAPATKAN,Other:PEDOMAN,Intent:LAPORAN MAGANG', 'Kamu bisa unduh format laporan magang di situs resmi STT-PLN di sttpln.ac.id', '2018-08-08'),
(327, 'Question:DIMANA,Other:SAYA,Other:BISA,Other:DAPAT,Other:LEMBAR,Other:PENGESAHAN', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> - Magang<html><br/></html> - Skripsi<html><br/></html> - Tentang Absensi <html><br/></html> - Kontak Dosen <html><br/></html> - Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-08-08'),
(328, 'Question:DIMANA,Other:SAYA,Other:BISA,Other:DAPAT,Other:LEMBAR,Other:PENGESAHAN,Other:MAGANG', 'Lembar pengesahan, RPKM, dan semua format lainnya ada di pedoman laporan kerja magang yang bisa kamu unduh di sttpln.ac.id', '2018-08-08'),
(329, 'Other:SAYA,Other:MAU,Other:TANYA,Intent:LAPORAN MAGANG', 'Apa yang ingin kamu ketahui tentang laporan magang?(format, batas pengumpulan)', '2018-08-08'),
(330, 'Intent:FORMAT', 'Bisa kamu unduh di website resmi STT-PLN yaitu www.sttpln.ac.id', '2018-08-08'),
(331, 'Intent:BATAS PENGUMPULAN,Other:LAPORAN', 'Awal mulai ataupun batas akhir pengumpulan akan diberitahukan saat jadwal sudah ada. Jadwal ini bisa berubah-ubah sesuai keadaan.', '2018-08-08'),
(332, 'Question:BAGAIMANA,Other:DENGAN,Intent:BATAS PENGUMPULAN,Other:LAPORAN', 'Awal mulai ataupun batas akhir pengumpulan akan diberitahukan saat jadwal sudah ada. Jadwal ini bisa berubah-ubah sesuai keadaan.', '2018-08-08'),
(333, 'Other:TERIMA,Other:KASIH', 'Sama-sama. Ada lagi yang bisa dibantu?', '2018-08-08'),
(334, 'Other:TIDAK,Other:ADA', 'Mungkin Anda ingin menanyakan hal lain?', '2018-08-08'),
(335, 'Other:BYE', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> - Magang<html><br/></html> - Skripsi<html><br/></html> - Tentang Absensi <html><br/></html> - Kontak Dosen <html><br/></html> - Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-08-08'),
(336, 'Other:SAMPAI,Other:JUMPA', 'Sampai bertemu lagi. Kamu bisa close tab ini.', '2018-08-08'),
(337, 'Other:KAMU,Other:TAHU,Other:RUANGAN,Other:LAB', 'Apakah kamu ingin mengetahui lokasi dari laboratorium? Laboratorium apa?', '2018-08-08'),
(338, 'Other:LAB,Other:MULTI', 'Mohon maaf, langsung sebutkan saja nama laboratoriumnya.', '2018-08-08'),
(339, 'Other:LAB,Location:LANJUT', 'Mohon maaf, langsung sebutkan saja nama laboratoriumnya.', '2018-08-08'),
(340, 'Other:LAB,Other:DASAR', 'Mohon maaf, langsung sebutkan saja nama laboratoriumnya.', '2018-08-08'),
(341, 'Question:DIMANA,Location:LABORATORIUM MULTIMEDIA', 'Laboratorium Komputer Multimedia ada di lantai 3 Bila dari lift, belok ke kiri.', '2018-08-08'),
(342, 'Intent:SEMESTER,Other:PENDEK', 'Mohon maaf, langsung sebutkan saja nama laboratoriumnya.', '2018-08-08'),
(343, 'Intent:SEMESTER,Other:PENDEK', 'Mohon maaf, langsung sebutkan saja nama laboratoriumnya.', '2018-08-08'),
(344, 'Other:TERIMA,Other:KASIH', 'Sama-sama. Ada lagi yang bisa dibantu?', '2018-08-08'),
(345, 'Intent:SEMESTER,Other:PENDEK', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> - Magang<html><br/></html> - Skripsi<html><br/></html> - Tentang Absensi <html><br/></html> - Kontak Dosen <html><br/></html> - Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-08-08'),
(346, 'Other:SAYA,Other:INGIN,Other:TAHU,Other:TENTANG,Intent:SEMESTER PENDEK', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> - Magang<html><br/></html> - Skripsi<html><br/></html> - Tentang Absensi <html><br/></html> - Kontak Dosen <html><br/></html> - Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-08-08'),
(347, 'Other:SAYA,Other:INGIN,Other:IZIN', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> - Magang<html><br/></html> - Skripsi<html><br/></html> - Tentang Absensi <html><br/></html> - Kontak Dosen <html><br/></html> - Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-08-08'),
(348, 'Other:HAI', 'Hai', '2018-08-08'),
(349, 'Intent:MATA KULIAH', 'Apa yang mau kamu tanyakan terkait mata kuliah?(Matkul Wajib, Matkul Pilihan, Lulus Mata Kuliah,)', '2018-08-08'),
(350, 'Other:KAMU,Other:TAU,Other:TENTANG,Intent:MATA KULIAH', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> - Magang<html><br/></html> - Skripsi<html><br/></html> - Tentang Absensi <html><br/></html> - Kontak Dosen <html><br/></html> - Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-08-08'),
(351, 'Other:KAMU,Other:TAU,Other:TENTANG,Other:MATAKULIAH', 'Apa yang mau kamu tanyakan terkait mata kuliah?(Matkul Wajib, Matkul Pilihan, Lulus Mata Kuliah,)', '2018-08-08'),
(352, 'Intent:MATA KULIAH WAJIB', 'Mata kuliah wajib yang ingin kamu tanyakan? Semester berapa ya?', '2018-08-08'),
(353, 'Number:4', 'Bahasa Rakitan, Sistem Berkas, Pemrograman Objek, Perangkat Lunak Jaringan 2, Mikroprosesor + Praktik, Teori Bahasa dan Otomata, Pengolahan Citra, Etika Profesi, Rangkaian Listrik + Praktik', '2018-08-08'),
(354, 'Intent:SEMESTER,Other:PENDEK', 'Apa yang ingin kamu ketahui tentang semester pendek (SP)?', '2018-08-08'),
(355, 'Question:KAPAN,Other:ADA,Other:SP', 'Apa yang ingin kamu ketahui tentang semester pendek (SP)?', '2018-08-08'),
(356, 'Question:KAPAN,Other:JADWAL,Other:SP,Other:DILAKUKAN', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> - Magang<html><br/></html> - Skripsi<html><br/></html> - Tentang Absensi <html><br/></html> - Kontak Dosen <html><br/></html> - Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-08-08'),
(357, 'Question:KAPAN,Other:JADWAL,Other:PENDAFTARAN', 'Informasi terkait jadwal pendaftaran atau pelaksanaan SP bersifat tentatif atau tidak tetap. Tergantung situasi dan kondisi sehingga kamu harus menunggu jadwal dari jurusan.', '2018-08-08'),
(358, 'Question:APA,Other:ITU,Intent:SEMESTER,Other:PENDEK', 'Semester pendek adalah sebuah semester yang jangka waktunya kurang lebih sebulan untuk mengulang mata kuliah. Biasanya diadakan saat liburan semester ganjil atau genap.<html><br/></html>Semester pendek digunakan untuk memperbaiki nilai.', '2018-08-08'),
(359, 'Question:APA,Other:SAJA,Intent:SYARAT,Other:SP', 'Semester pendek adalah sebuah semester yang jangka waktunya kurang lebih sebulan untuk mengulang mata kuliah. Biasanya diadakan saat liburan semester ganjil atau genap.<html><br/></html>Semester pendek digunakan untuk memperbaiki nilai.', '2018-08-08'),
(360, 'Question:BAGAIMANA,Other:CARA,Other:DAFTAR,Other:SP', 'Untuk pendaftaran semester pendek prosedurnya sama seperti mengisi KRS pada awal tiap semester.', '2018-08-08'),
(361, 'Question:APA,Other:SAJA,Intent:SYARAT,Other:UNTUK,Other:SEMESTER,Other:PENDEK', 'Semester pendek adalah sebuah semester yang jangka waktunya kurang lebih sebulan untuk mengulang mata kuliah. Biasanya diadakan saat liburan semester ganjil atau genap.<html><br/></html>Semester pendek digunakan untuk memperbaiki nilai.', '2018-08-08'),
(362, 'Other:HAI', 'Hai, ada yang mau ditanyakan?', '2018-08-09'),
(363, 'Question:BERAPA,Intent:NOMOR,Other:PAK,Other:EKA', 'Pak Eka Putra: 085265792254', '2018-08-09'),
(364, 'Question:DIMANA,Other:RUANGAN,Other:PAK,Person:ABDUL HARIS', 'Ruangannya berada di lantai 3. Ruangan di samping lift, dekat dengan pintu masuk menuju operation room atau lab bahasa inggris.', '2018-08-09'),
(365, 'Question:DIMANA,Other:RUANGAN,Other:IBU,Other:DIAN,Other:HARTANTI', 'Ruangannya berada di lantai 5. Bersebelahan dengan ruang laboratorium simpel dan laboratorium dasar 2. Apabila dari lift, ke arah pintu masuk jurusan kemudian belok kiri ke arah lab simpel. Lalu ke kanan sedikit.', '2018-08-09'),
(366, 'Other:AKU,Other:BINGUNG,Other:PILIH,Intent:MATA,Other:KULIAH', 'Apa yang mau kamu tanyakan terkait mata kuliah?(Matkul Wajib, Matkul Pilihan, Lulus Mata Kuliah,)', '2018-08-09'),
(367, 'Intent:MATA KULIAH WAJIB', 'Mata kuliah wajib yang ingin kamu tanyakan? Semester berapa ya?', '2018-08-09'),
(368, 'Number:3', 'Struktur Data, Pemrograman Visual, Sistem Operasi, Komunikasi Data, Perangkat Lunak Jaringan 1, Teknik Digital + Praktik, Kalkulus 2, Fisika Listrik dan Magnet, Sumber Daya Energi', '2018-08-09'),
(369, 'Other:TERIMA,Other:KASIH', 'Sama-sama. Ada lagi yang bisa dibantu?', '2018-08-09'),
(370, 'Other:ADA', 'Apa itu?', '2018-08-09'),
(371, 'Other:MASIH,Other:TENTANG,Intent:MATA KULIAH', 'Apa yang mau kamu tanyakan terkait mata kuliah?(Matkul Wajib, Matkul Pilihan, Lulus Mata Kuliah,)', '2018-08-09'),
(372, 'Other:KALAU,Intent:MATA KULIAH PILIHAN', 'Apa yang mau kamu tanyakan terkait mata kuliah?(Matkul Wajib, Matkul Pilihan, Lulus Mata Kuliah,)', '2018-08-09'),
(373, 'Other:AKU,Other:MAU,Other:TANYA,Other:YANG,Other:PILIHAN', 'Mata kuliah pilihan yang ingin kamu tanyakan? Semester berapa? 6 atau 7?', '2018-08-09'),
(374, 'Number:6', 'Untuk SI atau Jaringan?', '2018-08-09'),
(375, 'Other:SI', 'Data Mining dan Warehousing, Rekayasa Pengembangan Web, Audit TI, Web Design, Mobile Programming, Optimasi Basis Data', '2018-08-09'),
(376, 'Question:APA,Other:SAJA,Other:SYARAT,Other:LULUS,Other:DARI,Other:SUATU,Intent:MATA,Other:KULIAH', 'Minimal untuk lulus dari suatu mata kuliah harus bernilai C. Untuk lulus dari perguruan tinggi, tidak boleh ada nilai D lebih dari 2 sks.', '2018-08-09'),
(377, 'Other:OKE', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> - Magang<html><br/></html> - Skripsi<html><br/></html> - Tentang Absensi <html><br/></html> - Kontak Dosen <html><br/></html> - Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-08-09'),
(378, 'Intent:MATA KULIAH PILIHAN', 'Mata kuliah pilihan yang ingin kamu tanyakan? Semester berapa? 6 atau 7?', '2018-08-09'),
(379, 'Number:7', 'Untuk SI atau Jaringan?', '2018-08-09'),
(380, 'Other:JARINGAN', 'Embedded System, Sistem Kinerja Jaringan, Forensik Komputer dan Jaringan Network Forensik, Robotik', '2018-08-09'),
(381, 'Other:AKU,Other:MAU,Other:SKRIPSI', 'Apa yang ingin kamu ketahui tentang skripsi? (Syarat pengambilan, pembimbing, syarat sidang skripsi)', '2018-08-09'),
(382, 'Other:AKU,Other:MAU,Other:AMBIL,Intent:MAGANG,Other:TAPI,Other:MASIH,Other:BINGUNG', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> - Magang<html><br/></html> - Skripsi<html><br/></html> - Tentang Absensi <html><br/></html> - Kontak Dosen <html><br/></html> - Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-08-09'),
(383, 'Other:AKU,Other:BINGUNG,Other:MAU,Other:AMBIL,Intent:MAGANG,Other:ATAU,Other:TIDAK', 'Apa yang ingin kamu ketahui tentang magang? (Minimal sks, syarat sidang magang, tempat kerja magang, laporan magang)', '2018-08-09'),
(384, 'Other:AKU,Other:BINGUNG,Intent:TEMPAT,Other:KERJA,Other:BUAT,Other:MAGANG', 'Kamu bebas memilih tempat magang kamu. Yang penting masih berhubungan dengan IT dan yang kamu kerjakan tidak cuma bikin kopi dan fotokopi.', '2018-08-09'),
(385, 'Other:KALAU,Intent:LAPORAN MAGANG', 'Apa yang ingin kamu ketahui tentang laporan magang?(format, batas pengumpulan)', '2018-08-09'),
(386, 'Intent:FORMAT', 'Bisa kamu unduh di website resmi STT-PLN yaitu www.sttpln.ac.id', '2018-08-09'),
(387, 'Other:PADA,Other:SEMESTER,Question:BERAPA,Other:KITA,Other:BOLEH,Other:AMBIL,Intent:MAGANG', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> - Magang<html><br/></html> - Skripsi<html><br/></html> - Tentang Absensi <html><br/></html> - Kontak Dosen <html><br/></html> - Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-08-09'),
(388, 'Other:SEMESTER,Question:BERAPA,Other:KITA,Other:BOLEH,Other:MAGANG', 'Untuk mengambil mata kuliah magang, harus minimal berada di semester 7 dan tidak boleh mengambil mata kuliah selain magang kecuali saat semester 8 kamu bisa ambil bersama dengan skripsi.', '2018-08-09'),
(389, 'Other:TERUS,Intent:MINIMAL SKS,Other:BUAT,Intent:MAGANG', 'Apa yang ingin kamu ketahui tentang magang? (Minimal sks, syarat sidang magang, tempat kerja magang, laporan magang)', '2018-08-09'),
(390, 'Other:AKU,Other:MAU,Other:AMBIL,Intent:MAGANG,Other:TAPI,Other:MASIH,Other:BINGUNG', 'Apa yang ingin kamu ketahui tentang magang? (Minimal sks, syarat sidang magang, tempat kerja magang, laporan magang)', '2018-08-09'),
(391, 'Question:BERAPA,Intent:MINIMAL,Other:SKSNYA', 'Minimal untuk mengambil mata kuliah magang, kamu harus sudah lulus 100 SKS.', '2018-08-09'),
(392, 'Other:TERIMA,Other:KASIH', 'Sama-sama. Ada lagi yang bisa dibantu?', '2018-08-09'),
(393, 'Other:ADA', 'Apa itu?', '2018-08-09'),
(394, 'Question:DIMANA,Other:RUANGAN,Location:LABORATORIUM', 'Apakah kamu ingin mengetahui lokasi dari laboratorium? Laboratorium apa?', '2018-08-09'),
(395, 'Location:LABORATORIUM,Other:JARINGAN', 'Mohon maaf, langsung sebutkan saja nama laboratoriumnya.', '2018-08-09'),
(396, 'Other:TERIMA,Other:KASIH', 'Sama-sama. Ada lagi yang bisa dibantu?', '2018-08-09'),
(397, 'Other:ADA', 'Apa itu?', '2018-08-09'),
(398, 'Other:SAYA,Other:MASIH,Other:BINGUNG,Other:DENGAN,Other:SP', 'Apa yang ingin kamu ketahui tentang semester pendek (SP)?', '2018-08-09'),
(399, 'Question:APA,Other:ITU,Other:SP', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> - Magang<html><br/></html> - Skripsi<html><br/></html> - Tentang Absensi <html><br/></html> - Kontak Dosen <html><br/></html> - Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-08-09'),
(400, 'Question:APA,Other:SIH,Other:SP', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> - Magang<html><br/></html> - Skripsi<html><br/></html> - Tentang Absensi <html><br/></html> - Kontak Dosen <html><br/></html> - Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-08-09'),
(401, 'Question:APA,Other:ITU,Intent:SEMESTER,Other:PENDEK', 'Semester pendek adalah sebuah semester yang jangka waktunya kurang lebih sebulan untuk mengulang mata kuliah. Biasanya diadakan saat liburan semester ganjil atau genap.<html><br/></html>Semester pendek digunakan untuk memperbaiki nilai.', '2018-08-09'),
(402, 'Question:APA,Other:ADA,Other:SYARAT,Other:UNTUK,Other:AMBIL,Other:SP', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> - Magang<html><br/></html> - Skripsi<html><br/></html> - Tentang Absensi <html><br/></html> - Kontak Dosen <html><br/></html> - Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-08-09'),
(403, 'Question:APA,Intent:SYARAT AMBIL SEMESTER,Intent:PENDEK', 'Apa yang ingin kamu ketahui tentang semester pendek (SP)?', '2018-08-09'),
(404, 'Question:APA,Other:SYARAT,Other:DARI,Other:SEMESTER,Other:PENDEK', 'Apa yang ingin kamu ketahui tentang semester pendek (SP)?', '2018-08-09'),
(405, 'Question:APA,Intent:SYARAT SEMESTER,Other:PENDEK', 'Semester pendek adalah sebuah semester yang jangka waktunya kurang lebih sebulan untuk mengulang mata kuliah. Biasanya diadakan saat liburan semester ganjil atau genap.<html><br/></html>Semester pendek digunakan untuk memperbaiki nilai.', '2018-08-09'),
(406, 'Other:SYARATNYA,Question:APA', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> - Magang<html><br/></html> - Skripsi<html><br/></html> - Tentang Absensi <html><br/></html> - Kontak Dosen <html><br/></html> - Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-08-09'),
(407, 'Other:SYARATNYA,Question:APA,Other:SAJA', 'QUESTION APA Other:SYARATNYA,Question:APA,Other:SAJA INTENT SYARAT Other:SYARATNYA,Question:APA,Other:SAJA SP', '2018-08-09'),
(408, 'Question:BAGAIMANA,Other:CARA,Other:DAFTAR,Other:SP', 'Untuk pendaftaran semester pendek prosedurnya sama seperti mengisi KRS pada awal tiap semester. Mengisi rencana studi melalui anjungan', '2018-08-09'),
(409, 'Question:KAPAN,Other:JADWAL,Other:PENDAFTARAN,Other:DIBUKA', 'Informasi terkait jadwal pendaftaran atau pelaksanaan SP bersifat tentatif atau tidak tetap. Tergantung situasi dan kondisi sehingga kamu harus menunggu jadwal dari jurusan.', '2018-08-09'),
(410, 'Question:KAPAN,Other:KELAS,Other:MATER,Number:1,Other:DIBUKA', 'Pembukaan kelas untuk semester pendek bergantung pada pengajuan mahasiswa. Apabila mencapai 15 orang, maka kelas akan dibuka.', '2018-08-09'),
(411, 'Other:KALAU,Other:NILAI,Other:SAYA,Other:C,Other:BOLEH,Other:IKUT,Other:SP', '', '2018-08-09'),
(412, 'Other:SAYA,Other:INGIN,Other:IKUT,Other:SP,Other:TAPI,Other:NILAI,Other:SAYA,Other:B', 'Nilai B tidak perlu mengambil semester pendek. Banyak-banyak bersyukur.', '2018-08-09'),
(413, 'Other:TERIMA,Other:KASIH', 'Sama-sama. Ada lagi yang bisa dibantu?', '2018-08-09'),
(414, 'Other:ADA', 'Apa itu?', '2018-08-09'),
(415, 'Other:SAYA,Other:MAU,Other:IZIN', 'Maksud kamu, kamu ingin bertanya soal prosedur izin kuliah? Izin karena apa kalau boleh tahu?', '2018-08-09'),
(416, 'Other:IZIN,Other:ACARA,Other:KELUARGA', '', '2018-08-09'),
(417, 'Other:ADA,Other:ACARA,Other:KELUARGA', 'Untuk yang ini tidak bisa izin ya. Mungkin bisa menghubungi dosen atau staf jurusan langsung terkait acara yang berhubungan dengan keluarga.', '2018-08-09'),
(418, 'Other:BAIK', 'Sama-sama. Ada lagi yang bisa dibantu?', '2018-08-09'),
(419, 'Other:TIDAK,Other:ADA', 'Mungkin Anda ingin menanyakan hal lain?', '2018-08-09'),
(420, 'Other:TIDAK', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> - Magang<html><br/></html> - Skripsi<html><br/></html> - Tentang Absensi <html><br/></html> - Kontak Dosen <html><br/></html> - Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-08-09'),
(421, 'Other:SAMPAI,Other:JUMPA', 'Sampai bertemu lagi. Kamu bisa close tab ini.', '2018-08-09'),
(422, 'Other:SAYA,Other:MAU,Other:DAFTAR,Other:SP', 'Apa yang ingin kamu ketahui tentang semester pendek (SP)?', '2018-08-09'),
(423, 'Other:SYARAT,Other:SP', 'Apa yang ingin kamu ketahui tentang semester pendek (SP)?', '2018-08-09'),
(424, 'Other:SYARATNYA,Question:APA,Other:SAJA', '1)Mata kuliah yang di-SP-kan harus sudah pernah diambil.<html><br/></html>2)Apabila sebelumnya mendapat nilai E, maka mata kuliah tersebut tidak bisa untuk semester pendek.<html><br/></html>3)Mata kuliah dengan nilai C bisa diulang dengan semester pendek.<html><br/></html>4)Untuk dibuka kelas SP, harus minimal ada 15 orang.', '2018-08-09'),
(425, 'Other:TERIMA,Other:KASIH', 'Sama-sama. Ada lagi yang bisa dibantu?', '2018-08-09'),
(426, 'Other:ADA', 'Apa itu?', '2018-08-09'),
(427, 'Other:SAYA,Other:MAU,Other:AMBIL,Intent:SKRIPSI', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> - Magang<html><br/></html> - Skripsi<html><br/></html> - Tentang Absensi <html><br/></html> - Kontak Dosen <html><br/></html> - Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-08-09'),
(428, 'Other:SKRIPSI', 'Apa yang ingin kamu ketahui tentang skripsi? (Syarat pengambilan, pembimbing, syarat sidang skripsi)', '2018-08-09'),
(429, 'Other:SYARAT,Other:PENGAMBILAN', 'Untuk mengambil mata kuliah skripsi, harus minimal berada di semester 8 dan telah atau sambil mengambil mata kuliah magang.', '2018-08-09'),
(430, 'Other:LALU,Intent:SYARAT SIDANG SKRIPSI', '1) Penulisan skripsi telah disetujui oleh dosen pembimbing untuk diujikan pada ujian sidang skripsi.<html><br/></html>2) Telah lulus semua mata kuliah dengan minimal C yang sesuai dengan kurikulum yang berlaku.<html><br/></html>3)IPK minimal 2,0.<html><br/></html>4) Memiliki sertifikat TOEFL.<html><br/></html>Balas dengan \"Lanjutkan\" untuk syarat berikutnya.', '2018-08-09'),
(431, 'Other:LANJUTKAN', '5) Memiliki 5 sertifikat soft skill.<html><br/></html>6) Memiliki 5 sertifikat seminar.<html><br/></html>7) Tidak mempunyai tunggakan keuangan dan membayar biaya ujian sidang sesuai ketentuan yang berlaku.<html><br/></html>8) Tidak mempunyai pinjaman buku perpustakaan.<html><br/></html>Ingin melihat syarat sebelumnya atau ingin lanjutkan untuk melihat lampiran form yang harus dipenuhi?(Balas \"Lanjutkan\" atau \"Sebelumnya\")', '2018-08-09'),
(432, 'Other:LANJUTKAN', 'Lampiran form yang harus dipenuhi antara lain: <html><br/></html>1) Lembar persetujuan sidang skripsi.<html><br/></html>2) Surat keterangan telah memenuhi persyaratan akademik, bebas keuangan, dan bebas peminjaman buku perpustakaan.<html><br/></html>3) Permohonan mengikuti ujian sidang skripsi. Ada pertanyaan lain?', '2018-08-09'),
(433, 'Other:ADA', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> - Magang<html><br/></html> - Skripsi<html><br/></html> - Tentang Absensi <html><br/></html> - Kontak Dosen <html><br/></html> - Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-08-09'),
(434, 'Other:SAYA,Other:BUTUH,Intent:PEMBIMBING SKRIPSI', 'Pembimbing utama skripsi bisa dipilih sendiri oleh mahasiswa dengan mendatangi dosen yang bersangkutan secara langsung. Untuk dosen pembimbing kedua ditentukan oleh jurusan.', '2018-08-09'),
(435, 'Question:BERAPA,Intent:NOMOR,Other:PAK,Person:HARIS', 'Pak Abdul Haris: 0819-3172-9530', '2018-08-09'),
(436, 'Question:DIMANA,Other:RUANGAN,Other:IBU,Other:DIAN', 'Mohon maaf. Yang kamu katakan belum aku mengerti. Mungkin bisa mencoba bertanya dengan memilih salah satu dari kategori berikut:<html><br/></html> - Magang<html><br/></html> - Skripsi<html><br/></html> - Tentang Absensi <html><br/></html> - Kontak Dosen <html><br/></html> - Ruangan Dosen <html><br/></html> Atau mungkin hal lainnya?', '2018-08-09');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_startup_log`
--

CREATE TABLE `tbl_startup_log` (
  `id_file` int(11) NOT NULL,
  `nama_file` varchar(50) NOT NULL,
  `diubah_pada` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data untuk tabel `tbl_startup_log`
--

INSERT INTO `tbl_startup_log` (`id_file`, `nama_file`, `diubah_pada`) VALUES
(1, 'std-startup.xml', '2018-08-09'),
(2, 'std-startup.xml', '2018-08-09'),
(3, 'std-startup.xml', '2018-08-09'),
(4, 'std-startup.xml', '2018-08-09');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_training_log`
--

CREATE TABLE `tbl_training_log` (
  `id_file` int(11) NOT NULL,
  `nama_file` varchar(50) NOT NULL,
  `size_file` int(11) NOT NULL,
  `diubah_pada` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_training_log`
--

INSERT INTO `tbl_training_log` (`id_file`, `nama_file`, `size_file`, `diubah_pada`) VALUES
(1, 'corpusposner', 6843, '2018-07-19'),
(2, 'corpusposner', 6843, '2018-07-19'),
(3, 'corpusposner', 7, '2018-07-19'),
(4, 'corpusposner', 71, '2018-07-19'),
(5, 'corpusposner.txt', 124, '2018-07-21'),
(6, 'corpusposner', 849, '2018-07-21'),
(7, 'corpusposner.txt', 27, '2018-07-21'),
(8, 'Skripsi_siap_bos.txt', 281, '2018-07-21'),
(9, 'query.txt', 697, '2018-07-21'),
(10, 'NOTEPAD_SUBNET.txt', 849, '2018-07-21'),
(11, 'query.txt', 697, '2018-07-21'),
(12, 'requirements.txt', 102, '2018-07-21'),
(13, 'rtd_requirements.txt', 150, '2018-07-21'),
(14, 'wifid.txt', 27, '2018-07-21'),
(15, 'corpusposner.txt', 281, '2018-07-21'),
(16, 'corpusposner.txt', 8, '2018-07-21'),
(17, 'corpusposner.txt', 8, '2018-07-21'),
(18, 'corpusposner.txt', 8, '2018-07-21'),
(19, 'corpusposner.txt', 8, '2018-07-21'),
(20, 'corpusposner.txt', 8, '2018-07-21'),
(21, 'corpusposner.txt', 8, '2018-07-21'),
(22, 'corpusposner.txt', 9259, '2018-07-21'),
(23, 'corpusposner.txt', 8823, '2018-07-31'),
(24, 'corpusposner.txt', 11543, '2018-08-03'),
(25, 'corpusposner.txt', 11543, '2018-08-03'),
(26, 'corpusposner.txt', 11671, '2018-08-09');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_user`
--

CREATE TABLE `tbl_user` (
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data untuk tabel `tbl_user`
--

INSERT INTO `tbl_user` (`username`, `password`) VALUES
('admin', 'admin'),
('irfan', '12345');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_aiml_file`
--
ALTER TABLE `tbl_aiml_file`
  ADD PRIMARY KEY (`id_file`);

--
-- Indexes for table `tbl_history_chat`
--
ALTER TABLE `tbl_history_chat`
  ADD PRIMARY KEY (`session_id`);

--
-- Indexes for table `tbl_startup_log`
--
ALTER TABLE `tbl_startup_log`
  ADD PRIMARY KEY (`id_file`);

--
-- Indexes for table `tbl_training_log`
--
ALTER TABLE `tbl_training_log`
  ADD PRIMARY KEY (`id_file`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_aiml_file`
--
ALTER TABLE `tbl_aiml_file`
  MODIFY `id_file` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `tbl_history_chat`
--
ALTER TABLE `tbl_history_chat`
  MODIFY `session_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=437;
--
-- AUTO_INCREMENT for table `tbl_startup_log`
--
ALTER TABLE `tbl_startup_log`
  MODIFY `id_file` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tbl_training_log`
--
ALTER TABLE `tbl_training_log`
  MODIFY `id_file` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
