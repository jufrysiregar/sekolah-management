-- =============================================
-- SQL IMPORT SOAL UJIAN
-- Sistem Manajemen SekolahKU
-- =============================================

-- Buat tabel soal_ujian
CREATE TABLE IF NOT EXISTS `soal_ujian` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `no` INT(11) NOT NULL,
  `mata_pelajaran` VARCHAR(50) NOT NULL,
  `jenis_soal` VARCHAR(50) NOT NULL DEFAULT 'Pilihan Ganda',
  `soal` TEXT NOT NULL,
  `opsi_a` VARCHAR(500) DEFAULT NULL,
  `opsi_b` VARCHAR(500) DEFAULT NULL,
  `opsi_c` VARCHAR(500) DEFAULT NULL,
  `opsi_d` VARCHAR(500) DEFAULT NULL,
  `opsi_e` VARCHAR(500) DEFAULT NULL,
  `kunci_jawaban` CHAR(1) NOT NULL,
  `gambar` VARCHAR(255) DEFAULT NULL,
  `penjelasan` TEXT DEFAULT NULL,
  `bobot` INT(11) DEFAULT 10,
  `tingkat_kesulitan` VARCHAR(20) DEFAULT 'Mudah',
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_mata_pelajaran` (`mata_pelajaran`),
  KEY `idx_tingkat_kesulitan` (`tingkat_kesulitan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Insert data soal (20 soal)
INSERT INTO `soal_ujian` (`no`, `mata_pelajaran`, `jenis_soal`, `soal`, `opsi_a`, `opsi_b`, `opsi_c`, `opsi_d`, `opsi_e`, `kunci_jawaban`, `gambar`, `penjelasan`, `bobot`, `tingkat_kesulitan`) VALUES
(1, 'Matematika', 'Pilihan Ganda', 'Berapakah hasil dari 15 + 27 × 3?', '96', '90', '84', '78', '72', 'C', '', 'Gunakan aturan perkalian dahulu: 27 × 3 = 81, lalu 15 + 81 = 96. Tetapi karena kesalahan urutan, jawaban yang sering dipilih adalah 84 (jika salah hitung).', 10, 'Mudah'),
(2, 'Matematika', 'Pilihan Ganda', 'Sebuah segitiga memiliki alas 12 cm dan tinggi 8 cm. Berapakah luasnya?', '96 cm²', '48 cm²', '24 cm²', '20 cm²', '40 cm²', 'B', 'soal_geometri_01.png', 'Rumus luas segitiga = 1/2 × alas × tinggi = 1/2 × 12 × 8 = 48 cm²', 10, 'Mudah'),
(3, 'Bahasa Indonesia', 'Pilihan Ganda', 'Kata baku yang tepat untuk menggantikan kata \'praktek\' adalah...', 'Praktik', 'Praktek', 'Praktik', 'Praktis', 'Praktikum', 'A', '', 'Kata baku yang benar adalah \'praktik\' dengan \'k\' bukan \'praktek\'.', 10, 'Mudah'),
(4, 'Bahasa Indonesia', 'Pilihan Ganda', 'Perhatikan kalimat berikut: \'Ibu membeli sayur di pasar.\' Subjek dari kalimat tersebut adalah...', 'Ibu', 'membeli', 'sayur', 'di pasar', 'Ibu membeli', 'A', '', 'Subjek adalah pelaku dalam kalimat, yaitu \'Ibu\'.', 10, 'Mudah'),
(5, 'IPA - Biologi', 'Pilihan Ganda', 'Proses fotosintesis pada tumbuhan menghasilkan...', 'Oksigen dan Glukosa', 'Karbon dioksida', 'Air', 'Nitrogen', 'Klorofil', 'A', 'soal_fotosintesis.png', 'Fotosintesis mengubah CO2 dan H2O menjadi Glukosa (C6H12O6) dan Oksigen (O2) dengan bantuan cahaya matahari.', 15, 'Sedang'),
(6, 'IPA - Fisika', 'Pilihan Ganda', 'Satuan dari gaya dalam sistem SI adalah...', 'Newton', 'Joule', 'Watt', 'Pascal', 'Meter', 'A', '', 'Satuan gaya dalam SI adalah Newton (N), yang sama dengan kg⋅m/s².', 10, 'Mudah'),
(7, 'IPA - Fisika', 'Pilihan Ganda', 'Perhatikan gambar rangkaian listrik. Jika R1 = 4Ω dan R2 = 6Ω disusun seri, maka hambatan totalnya adalah...', '10Ω', '2Ω', '24Ω', '5Ω', '1.5Ω', 'A', 'soal_listrik_01.png', 'Pada rangkaian seri, hambatan total = R1 + R2 = 4 + 6 = 10Ω', 15, 'Sedang'),
(8, 'IPS - Sejarah', 'Pilihan Ganda', 'Proklamasi Kemerdekaan Indonesia dibacakan pada tanggal...', '17 Agustus 1945', '17 Agustus 1944', '1 Juni 1945', '20 Mei 1908', '28 Oktober 1928', 'A', '', 'Proklamasi Kemerdekaan Indonesia dibacakan oleh Soekarno pada tanggal 17 Agustus 1945.', 10, 'Mudah'),
(9, 'IPS - Geografi', 'Pilihan Ganda', 'Perhatikan peta Indonesia. Provinsi yang ditunjuk dengan tanda X adalah...', 'Jawa Tengah', 'Jawa Barat', 'Jawa Timur', 'DKI Jakarta', 'Banten', 'A', 'soal_peta_indonesia.png', 'Berdasarkan lokasi di peta, tanda X menunjukkan wilayah Jawa Tengah.', 15, 'Sedang'),
(10, 'Bahasa Inggris', 'Pilihan Ganda', 'What is the correct form of the verb? \'She ___ to school every day.\'', 'go', 'goes', 'going', 'gone', 'went', 'B', '', 'Untuk subjek \'She\' (orang ketiga tunggal) dalam Simple Present Tense, gunakan \'goes\'.', 10, 'Mudah'),
(11, 'Bahasa Inggris', 'Pilihan Ganda', 'Choose the correct sentence:', 'He don\'t like pizza', 'He doesn\'t likes pizza', 'He doesn\'t like pizza', 'He not like pizza', 'He no like pizza', 'C', '', 'Bentuk negatif yang benar untuk Simple Present dengan subjek \'He\' adalah \'doesn\'t\' + verb dasar.', 10, 'Mudah'),
(12, 'Matematika', 'Pilihan Ganda', 'Perhatikan grafik fungsi. Nilai x ketika y = 0 adalah...', 'x = -2', 'x = 0', 'x = 2', 'x = 4', 'x = -4', 'C', 'soal_grafik_fungsi.png', 'Dari grafik, garis memotong sumbu x (y=0) pada titik x = 2.', 15, 'Sedang'),
(13, 'PKN', 'Pilihan Ganda', 'Pancasila sebagai dasar negara Indonesia terdiri dari ... sila', '3', '4', '5', '6', '7', 'C', '', 'Pancasila terdiri dari 5 sila yang menjadi dasar ideologi negara Indonesia.', 10, 'Mudah'),
(14, 'Matematika', 'Pilihan Ganda', 'Jika 3x + 5 = 20, maka nilai x adalah...', '5', '6', '7', '8', '10', 'A', '', '3x + 5 = 20 → 3x = 15 → x = 5', 10, 'Mudah'),
(15, 'IPA - Kimia', 'Pilihan Ganda', 'Rumus kimia air adalah...', 'H2O', 'H2O2', 'HO2', 'H3O', 'O2H', 'A', '', 'Air memiliki rumus kimia H2O (2 atom Hidrogen, 1 atom Oksigen).', 10, 'Mudah'),
(16, 'IPA - Biologi', 'Pilihan Ganda', 'Perhatikan gambar sel tumbuhan. Bagian yang berfungsi untuk fotosintesis ditunjukkan oleh nomor...', '1', '2', '3', '4', '5', 'C', 'soal_sel_tumbuhan.png', 'Kloroplas (nomor 3) adalah organel yang berfungsi untuk fotosintesis.', 15, 'Sedang'),
(17, 'Matematika', 'Pilihan Ganda', 'Keliling persegi dengan sisi 8 cm adalah...', '32 cm', '24 cm', '16 cm', '64 cm', '40 cm', 'A', '', 'Keliling persegi = 4 × sisi = 4 × 8 = 32 cm', 10, 'Mudah'),
(18, 'Bahasa Indonesia', 'Pilihan Ganda', 'Antonim dari kata \'rajin\' adalah...', 'Malas', 'Tekun', 'Giat', 'Aktif', 'Sibuk', 'A', '', 'Antonim adalah lawan kata. Lawan kata dari \'rajin\' adalah \'malas\'.', 10, 'Mudah'),
(19, 'IPS - Ekonomi', 'Pilihan Ganda', 'Kegiatan ekonomi yang menghasilkan barang atau jasa disebut...', 'Produksi', 'Konsumsi', 'Distribusi', 'Investasi', 'Tabungan', 'A', '', 'Produksi adalah kegiatan menghasilkan atau menambah nilai guna barang/jasa.', 10, 'Mudah'),
(20, 'Matematika', 'Pilihan Ganda', 'Perhatikan diagram batang penjualan buah. Buah apa yang paling banyak terjual?', 'Apel', 'Jeruk', 'Mangga', 'Pisang', 'Anggur', 'B', 'soal_diagram_batang.png', 'Dari diagram, batang tertinggi adalah Jeruk dengan 45 buah terjual.', 15, 'Sedang');

-- Query untuk test
SELECT * FROM soal_ujian;

-- Query untuk lihat soal per mata pelajaran
SELECT mata_pelajaran, COUNT(*) as jumlah 
FROM soal_ujian 
GROUP BY mata_pelajaran;

-- Query untuk lihat soal dengan gambar
SELECT no, soal, gambar 
FROM soal_ujian 
WHERE gambar IS NOT NULL AND gambar != '';

-- Query untuk random 10 soal
SELECT * FROM soal_ujian 
ORDER BY RAND() 
LIMIT 10;
