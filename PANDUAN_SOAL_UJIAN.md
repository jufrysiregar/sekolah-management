# 📚 BANK SOAL UJIAN - BETA TEST
## SMK Cerdas Satu Bangsa

### 📋 Deskripsi
File ini berisi 20 soal ujian untuk beta test sistem penampilan soal untuk murid.

---

## 📁 Isi Paket

### **1. BANK_SOAL_UJIAN.csv**
File Excel/CSV berisi 20 soal dengan struktur:
- No
- Mata Pelajaran
- Jenis Soal
- Soal
- Opsi A, B, C, D, E
- Kunci Jawaban
- Gambar (nama file)
- Penjelasan
- Bobot
- Tingkat Kesulitan

### **2. Folder images/ (7 gambar)**
Berisi gambar-gambar soal:
1. **soal_geometri_01.png** - Soal luas segitiga
2. **soal_fotosintesis.png** - Diagram fotosintesis
3. **soal_listrik_01.png** - Rangkaian listrik seri
4. **soal_peta_indonesia.png** - Peta Indonesia (Jawa Tengah)
5. **soal_grafik_fungsi.png** - Grafik fungsi linear
6. **soal_sel_tumbuhan.png** - Struktur sel tumbuhan
7. **soal_diagram_batang.png** - Diagram penjualan buah

---

## 📊 Breakdown Soal

### **Mata Pelajaran:**
- Matematika: 6 soal
- Bahasa Indonesia: 3 soal
- IPA (Biologi, Fisika, Kimia): 5 soal
- IPS (Sejarah, Geografi, Ekonomi): 3 soal
- Bahasa Inggris: 2 soal
- PKN: 1 soal

### **Tingkat Kesulitan:**
- Mudah: 14 soal
- Sedang: 6 soal

### **Soal dengan Gambar:**
- 7 soal menggunakan gambar/diagram
- 13 soal text only

---

## 🎯 Cara Menggunakan untuk Beta Test

### **1. Import ke Database**
```sql
-- Buat tabel soal
CREATE TABLE soal_ujian (
    id INT PRIMARY KEY AUTO_INCREMENT,
    mata_pelajaran VARCHAR(50),
    jenis_soal VARCHAR(50),
    soal TEXT,
    opsi_a VARCHAR(255),
    opsi_b VARCHAR(255),
    opsi_c VARCHAR(255),
    opsi_d VARCHAR(255),
    opsi_e VARCHAR(255),
    kunci_jawaban CHAR(1),
    gambar VARCHAR(255),
    penjelasan TEXT,
    bobot INT,
    tingkat_kesulitan VARCHAR(20)
);

-- Import dari CSV
LOAD DATA INFILE 'BANK_SOAL_UJIAN.csv'
INTO TABLE soal_ujian
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
```

### **2. Upload Gambar**
- Upload semua file di folder `images/` ke folder `public/images/soal/` di frontend
- Atau ke `storage/app/public/soal/` di Laravel

### **3. Test Display**
Test tampilan soal di berbagai kondisi:
- ✅ Soal text only
- ✅ Soal dengan gambar
- ✅ Responsive (mobile, tablet, desktop)
- ✅ Zoom gambar
- ✅ Navigasi antar soal
- ✅ Timer ujian
- ✅ Pilih jawaban
- ✅ Review jawaban

---

## 🖼️ Format Gambar

Semua gambar dalam format **PNG/SVG** dengan ukuran optimized:
- Width: 400-600px
- Height: 350-450px
- File size: < 50KB per gambar

---

## 📝 Kunci Jawaban

| No | Mata Pelajaran | Kunci | No | Mata Pelajaran | Kunci |
|----|----------------|-------|----|----------------|-------|
| 1  | Matematika     | C     | 11 | Bahasa Inggris | C     |
| 2  | Matematika     | B     | 12 | Matematika     | C     |
| 3  | Bahasa Indonesia | A   | 13 | PKN            | C     |
| 4  | Bahasa Indonesia | A   | 14 | Matematika     | A     |
| 5  | IPA - Biologi  | A     | 15 | IPA - Kimia    | A     |
| 6  | IPA - Fisika   | A     | 16 | IPA - Biologi  | C     |
| 7  | IPA - Fisika   | A     | 17 | Matematika     | A     |
| 8  | IPS - Sejarah  | A     | 18 | Bahasa Indonesia | A   |
| 9  | IPS - Geografi | A     | 19 | IPS - Ekonomi  | A     |
| 10 | Bahasa Inggris | B     | 20 | Matematika     | B     |

---

## 🧪 Skenario Beta Test

### **Test Case 1: Tampilan Soal**
- [ ] Soal terbaca dengan jelas
- [ ] Font size pas di mobile
- [ ] Gambar tidak pecah
- [ ] Opsi jawaban terpisah jelas

### **Test Case 2: Interaksi**
- [ ] Bisa pilih jawaban
- [ ] Bisa ganti jawaban
- [ ] Navigasi prev/next lancar
- [ ] Bisa zoom gambar
- [ ] Bisa tandai soal (flag/bookmark)

### **Test Case 3: Performance**
- [ ] Loading cepat
- [ ] Gambar load dengan baik
- [ ] Tidak lag saat scroll
- [ ] Timer akurat

### **Test Case 4: Responsiveness**
- [ ] Mobile (< 768px)
- [ ] Tablet (768-1024px)
- [ ] Desktop (> 1024px)

---

## 💡 Rekomendasi Fitur

### **Must Have:**
1. ✅ Tampilan nomor soal (1/20)
2. ✅ Progress bar
3. ✅ Timer countdown
4. ✅ Pilih jawaban (radio button)
5. ✅ Navigasi (Previous, Next)
6. ✅ Review semua jawaban
7. ✅ Submit konfirmasi

### **Nice to Have:**
1. ⭐ Zoom gambar (modal)
2. ⭐ Bookmark soal
3. ⭐ Kalkulator (untuk soal matematika)
4. ⭐ Flag/tandai soal ragu-ragu
5. ⭐ Dark mode
6. ⭐ Text size adjustment
7. ⭐ Pause/resume

---

## 📱 Mockup Tampilan Ujian

```
┌─────────────────────────────────────────┐
│  📚 Ujian Matematika            ⏰ 45:23 │
├─────────────────────────────────────────┤
│  Soal 5 dari 20        [████░░░░░░] 25% │
├─────────────────────────────────────────┤
│                                         │
│  [GAMBAR SOAL FOTOSINTESIS]            │
│                                         │
│  Proses fotosintesis pada tumbuhan     │
│  menghasilkan...                       │
│                                         │
│  ○ A. Oksigen dan Glukosa              │
│  ○ B. Karbon dioksida                  │
│  ○ C. Air                               │
│  ○ D. Nitrogen                          │
│  ○ E. Klorofil                          │
│                                         │
├─────────────────────────────────────────┤
│  [< Sebelumnya]  [Tandai]  [Berikutnya >]│
└─────────────────────────────────────────┘
```

---

## 🔧 Teknologi Rekomendasi

### **Frontend:**
- React.js untuk interaktif UI
- Tailwind CSS untuk styling
- React Router untuk navigasi
- Axios untuk fetch soal dari API

### **Backend:**
- Laravel API untuk serve soal
- MySQL untuk database
- Storage untuk gambar

---

## 📞 Feedback & Bug Report

Setelah beta test, catat:
1. **Bug yang ditemukan**
2. **User experience issues**
3. **Performance issues**
4. **Saran improvement**
5. **Fitur request**

---

## ✅ Checklist Sebelum Launch

- [ ] Semua soal ter-import
- [ ] Semua gambar ter-upload
- [ ] Kunci jawaban sudah benar
- [ ] Timer berfungsi
- [ ] Submit ujian works
- [ ] Hasil ujian tersimpan
- [ ] Responsive di semua device
- [ ] Loading time < 3 detik

---

**© 2024 SMK Cerdas Satu Bangsa**
**Good luck dengan beta test!** 🚀
