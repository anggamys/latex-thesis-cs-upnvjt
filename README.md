# Template LaTeX Skripsi/Thesis Fasilkom UPN "Veteran" Jawa Timur

[![CI](https://github.com/anggamys/latex-thesis-cs-upnvjt/actions/workflows/ci.yml/badge.svg)](https://github.com/anggamys/latex-thesis-cs-upnvjt/actions/workflows/ci.yml)

Template LaTeX untuk skripsi (undergraduate thesis) dan tesis (thesis) di **Program Studi Informatika, Fakultas Ilmu Komputer, Universitas Pembangunan Nasional "Veteran" Jawa Timur**.

Fokus utama: **mode bahasa yang mudah diganti**. Ubah satu variabel, semua label dan konten otomatis berganti antara Indonesia dan English.

---

## Daftar Isi / Table of Contents

- [Fitur Utama / Main Features](#fitur-utama--main-features)
- [Persyaratan Sistem / System Requirements](#persyaratan-sistem--system-requirements)
- [Memulai dengan Cepat / Quick Start](#memulai-dengan-cepat--quick-start)
- [Cara Mengganti Bahasa / Changing Language](#cara-mengganti-bahasa--changing-language)
- [Cara Mengganti Tipe Dokumen / Changing Document Type](#cara-mengganti-tipe-dokumen--changing-document-type)
- [Metadata / Metadata](#metadata--metadata)
- [Cara Menulis Isi Naskah / Writing Content](#cara-menulis-isi-naskah--writing-content)
- [Cara Compile / Compiling](#cara-compile--compiling)
- [Struktur Project / Project Structure](#struktur-project--project-structure)
- [Fitur Template / Template Features](#fitur-template--template-features)
- [Sebelum Submit Final / Before Final Submission](#sebelum-submit-final--before-final-submission)
- [Pemecahan Masalah / Troubleshooting](#pemecahan-masalah--troubleshooting)
- [Cara Berkontribusi / Contributing](#cara-berkontribusi--contributing)
- [Lisensi / License](#lisensi--license)
- [Disclaimer](#disclaimer)

---

## Fitur Utama / Main Features

| Fitur                    | Keterangan                                                                   |
| ------------------------ | ---------------------------------------------------------------------------- |
| **Dual Language**        | Ganti bahasa hanya dengan ubah 1 variabel (`indonesian` ↔ `english`)         |
| **Dual Document Type**   | Pilih `skripsi` (Undergraduate Thesis) atau `tesis` (Thesis)                 |
| **Folder-based Content** | Tulis konten natural di folder bahasa masing-masing, tanpa `\Lang{...}{...}` |
| **Centralized Config**   | Metadata, label, dan pengaturan di satu tempat (`config/`)                   |
| **Auto Labels**          | BAB/CHAPTER, Daftar Isi/TOC, dll. berubah otomatis sesuai bahasa             |
| **Appendix Page**        | Halaman khusus DAFTAR LAMPIRAN/LIST OF APPENDICES                            |
| **CI Ready**             | GitHub Actions build otomatis setiap push                                    |
| **Build with make**      | `make` → latexmk handle semua pass + bibtex                                  |

---

## Persyaratan Sistem / System Requirements

**Linux (Ubuntu/Debian):**

```bash
sudo apt-get install -y texlive-latex-base texlive-latex-recommended texlive-latex-extra \
  texlive-fonts-recommended texlive-fonts-extra texlive-bibtex-extra texlive-science \
  texlive-lang-other texlive-plain-generic latexmk
```

**macOS (MacTeX):** Install [MacTeX](https://tug.org/mactex/) (sudah termasuk `latexmk`).

**Windows (MiKTeX):** Install [MiKTeX](https://miktex.org/) dengan package `latexmk`.

> Template otomatis mendeteksi engine dan font yang tersedia:
>
> - **pdfLaTeX**: `newtxtext` → fallback `times.sty`
> - **LuaLaTeX/XeLaTeX**: Times New Roman → TeX Gyre Termes → Liberation Serif

---

## Memulai dengan Cepat / Quick Start

```bash
# 1. Clone repositori
git clone https://github.com/kyrozepto/latex-thesis-cs-upnvjt.git
cd latex-thesis-cs-upnvjt

# 2. Edit metadata (judul, nama, dll.)
#    Buka config/thesis-config.tex dan sesuaikan

# 3. Compile
make

# 4. Buka hasil
#    open dist/main.pdf
```

---

## Cara Mengganti Bahasa / Changing Language

Buka `config/thesis-config.tex`, ubah:

```latex
\newcommand{\ThesisLanguage}{english}   % indonesian atau english
```

Template otomatis mengambil konten dari folder bahasa yang sesuai dan mengubah semua label (`BAB` → `CHAPTER`, `DAFTAR ISI` → `TABLE OF CONTENTS`, dll.).

---

## Cara Mengganti Tipe Dokumen / Changing Document Type

Di file yang sama (`config/thesis-config.tex`):

```latex
\newcommand{\ThesisDocumentType}{skripsi}   % skripsi atau tesis
```

| Nilai     | Indonesia | English              |
| --------- | --------- | -------------------- |
| `skripsi` | Skripsi   | Undergraduate Thesis |
| `tesis`   | Tesis     | Thesis               |

---

## Metadata / Metadata

Semua data di `config/thesis-config.tex`:

```latex
\newcommand{\ThesisTitleID}{Judul Skripsi Bahasa Indonesia}
\newcommand{\ThesisTitleEN}{English Thesis Title}
\newcommand{\StudentName}{Nama Lengkap Mahasiswa}
\newcommand{\StudentID}{Nomor Pokok Mahasiswa}
\newcommand{\AdvisorOne}{Nama Dosen Pembimbing I, Gelar}
\newcommand{\AdvisorTwo}{Nama Dosen Pembimbing II, Gelar}
\newcommand{\ExaminerOne}{Nama Ketua Penguji, Gelar}
\newcommand{\ExaminerTwo}{Nama Anggota Penguji, Gelar}
\newcommand{\DefenseDateID}{Tanggal Bulan Tahun}
\newcommand{\DefenseDateEN}{Month Day, Year}
\newcommand{\SubmissionYear}{2026}
\newcommand{\KeywordsID}{kata kunci pertama, kata kunci kedua}
\newcommand{\KeywordsEN}{first keyword, second keyword}
```

> **Catatan:** Nama dekan dan koordinator prodi juga ada di file yang sama. Verifikasi dengan pedoman resmi fakultas sebelum pengumpulan.

---

## Cara Menulis Isi Naskah / Writing Content

**Tidak perlu** `\Lang{...}{...}`. Tulis natural di folder bahasa yang dipilih:

```text
content/<language>/     → abstrak, kata pengantar, singkatan
chapters/<language>/    → Bab I sampai Bab V
appendices/<language>/  → lampiran
```

Contoh isi bab Bahasa Indonesia:

```latex
\section{Latar Belakang}
Tuliskan latar belakang penelitian di sini.
```

Contoh isi bab English:

```latex
\section{Background}
Write the research background here.
```

---

## Cara Compile / Compiling

**Dengan `make` (direkomendasikan):** latexmk otomatis menjalankan pdflatex + bibtex + pdflatex + pdflatex sesuai kebutuhan.

```bash
make                  # kompilasi penuh, hasil di dist/main.pdf
make ENGINE=lualatex  # kompilasi dengan LuaLaTeX
make once             # kompilasi cepat (tanpa bersih)
make view             # buka PDF viewer
make validate         # linting LaTeX dengan chktex
make clean            # hapus build/ (artifact sementara)
make distclean        # hapus build/ dan dist/
make rebuild          # distclean + kompilasi ulang
```

Hasil kompilasi: **`dist/main.pdf`**. File sementara di **`build/`** (keduanya diabaikan git).

**Manual tanpa `make`:**

```bash
pdflatex -interaction=nonstopmode main.tex
bibtex main
pdflatex -interaction=nonstopmode main.tex
pdflatex -interaction=nonstopmode main.tex
```

---

## Struktur Project / Project Structure

```text
.
├── main.tex                  # File utama (entry point)
├── template.cls              # Class LaTeX (layout, margin, font)
├── Makefile                  # Build system
├── README.md                 # Dokumentasi
├── LICENSE                   # Lisensi MIT
├── CHANGELOG.md              # Riwayat perubahan
├── .github/workflows/ci.yml  # GitHub Actions CI
├── config/
│   ├── thesis-config.tex     # Metadata & pilihan bahasa/tipe
│   └── thesis-language.tex   # Kamus label bilingual
├── content/
│   ├── indonesian/           # Abstrak, kata pengantar (ID)
│   └── english/              # Abstract, acknowledgements (EN)
├── chapters/
│   ├── indonesian/           # Bab I-V (ID)
│   └── english/              # Chapter I-V (EN)
├── appendices/
│   ├── indonesian/           # Lampiran (ID)
│   └── english/              # Appendix (EN)
├── figures/
│   ├── logo_upn.png          # Logo universitas
│   └── example-figure.pdf    # Contoh gambar
├── references/
│   ├── example.bib           # Contoh referensi BibTeX
│   └── example.csv           # Contoh tabel CSV
├── build/                    # Artifact sementara (gitignore)
└── dist/                     # Hasil PDF final (gitignore)
```

> **Catatan:** Folder `build/` dan `dist/` muncul setelah kompilasi pertama.

---

## Fitur Template / Template Features

### Gambar / Figures

```latex
\begin{figure}[H]
\centering
\includegraphics[width=0.85\linewidth]{example-figure.pdf}
\caption{Judul gambar}
\label{fig:example-figure}
\end{figure}
```

Rujuk dengan `Gambar~\ref{fig:example-figure}` (ID) atau `Figure~\ref{fig:example-figure}` (EN).

### Notasi Matematika / Math Equations

```latex
\begin{equation}
\mathbf{a}^{[l]} = \sigma\left(\mathbf{W}^{[l]}\mathbf{a}^{[l-1]} + \mathbf{b}^{[l]}\right)
\end{equation}
```

Nomor persamaan otomatis: `(2.1)`, `(2.2)`, dst.

### Kode Program / Algorithms

Template memakai `algorithm2e` untuk menampilkan algoritma:

```latex
\begin{algorithm}[H]
\caption{Judul algoritma}
\KwInput{Data masukan}
\KwOutput{Hasil}
Langkah pemrosesan\;
\KwReturn{Hasil akhir}
\end{algorithm}
```

Caption masuk ke **DAFTAR KODE** / **LIST OF CODE**.

### Kode Program / Source Code Listing

> ⚠️ **Catatan / Note:** Fitur ini masih dalam pengembangan.
> Rencana: Environment `codelisting` untuk menampilkan kode program
> dalam tabel 2 kolom (kolom 1 = nomor baris, kolom 2 = kode)
> dengan font Courier 9pt single spacing. Lihat `CHANGELOG.md` → Known Issues.

Sementara gunakan `lstlisting` biasa:

```latex
\begin{lstlisting}[caption=Judul kode,label=lst:contoh]
def main():
    print("Hello")
\end{lstlisting}
```

### Referensi / References

Tambah entri di `references/example.bib`, lalu sitasi:

```latex
... \cite{exampleReference}
```

Ubah daftar file BibTeX di akhir `main.tex` jika menambah file baru.

### Tabel dari CSV / CSV Tables

Template mendukung tabel dari file CSV dengan `csvsimple`:

```latex
\begin{table}[H]
\centering
\caption{Judul tabel}
\label{tab:csv-example}
\csvautotabular{references/example.csv}
\end{table}
```

### Placeholder Teks / Blindtext

Gunakan saat masih mengembangkan struktur dokumen:

```latex
\blindtext        % satu paragraf
\blindtext[3]     % tiga paragraf
```

> Ganti semua `\blindtext` dengan konten asli sebelum pengumpulan final.

### Lampiran / Appendices

Untuk menambah lampiran tanpa memenuhi daftar isi:

```latex
\AppendixSection{Lampiran A. Judul Lampiran}
\AppendixSubsection{A.1 Judul Subbagian}
```

Detail lampiran muncul di halaman **DAFTAR LAMPIRAN** / **LIST OF APPENDICES**, bukan di daftar isi.

---

## Sebelum Submit Final / Before Final Submission

- [ ] Ganti semua metadata placeholder di `config/thesis-config.tex`
- [ ] Hapus semua `\TemplateTip{...}` dan `\TemplateTodo{...}`
- [ ] Ganti semua `\blindtext` dengan konten asli
- [ ] Verifikasi nama dekan dan koordinator prodi
- [ ] Compile ulang sampai tabel dan daftar pustaka stabil
- [ ] Cek hasil PDF — tidak ada "undefined references" atau "??"

---

## Pemecahan Masalah / Troubleshooting

| Masalah                      | Penyebab                             | Solusi                                                                                             |
| ---------------------------- | ------------------------------------ | -------------------------------------------------------------------------------------------------- |
| `File 'xxx.sty' not found`   | Package LaTeX kurang                 | Install package yang sesuai (lihat [Persyaratan Sistem](#persyaratan-sistem--system-requirements)) |
| `Undefined reference` / `??` | Kompilasi ulang kurang               | Jalankan `make rebuild`                                                                            |
| `Citation undefined`         | bibtex belum jalan                   | Pastikan `make` (bukan `make once`)                                                                |
| Font tidak sesuai            | Engine tidak punya font yang diminta | Template sudah fallback otomatis, pastikan TeX Live lengkap                                        |
| `make: command not found`    | `make` tidak terinstall              | Install `build-essential` (Linux) atau Xcode CLI (macOS)                                           |

---

## Cara Berkontribusi / Contributing

Kontribusi sangat terbuka! Silakan:

1. **Fork** repositori ini
2. Buat branch fitur: `git checkout -b fitur-saya`
3. Commit perubahan: `git commit -m "feat: menambahkan fitur ..."`
4. Push: `git push origin fitur-saya`
5. Buat **Pull Request**

Pastikan template tetap bisa compile di mode `indonesian` dan `english` sebelum PR.

---

## Lisensi / License

Template ini dilisensikan di bawah **MIT License** — lihat file [LICENSE](LICENSE) untuk detail.

---

## Disclaimer

Template ini adalah bantuan teknis. Format resmi dapat berubah sewaktu-waktu. Selalu cocokkan hasil akhir dengan pedoman terbaru dari program studi, fakultas, dan dosen pembimbing.
