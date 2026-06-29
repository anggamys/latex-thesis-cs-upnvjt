# Changelog

Semua perubahan signifikan pada project ini akan dicatat di file ini.

Format berdasarkan [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
dan project ini mengikuti [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [Unreleased]

### Added
- LICENSE (MIT)
- CHANGELOG.md

### Changed
- README restruktur total: bilingual per-section, badge CI, quick start,
  system requirements, troubleshooting, contributing guide

### Known Issues
- **Source code listing**: Belum berhasil membuat environment `codelisting`
  yang menampilkan kode dalam format tabel 2 kolom (kolom 1 = nomor baris,
  kolom 2 = kode) dengan font Courier 9pt single spacing. Saat ini pakai
  `lstlisting` biasa dengan `numbers=left`. Issue: `tcolorbox` + `lstlisting`
  belum menghasilkan efek tabel yang benar. Lihat `main.tex` untuk konfigurasi
  yang sudah dicoba (`\newtcblisting{codelisting}`).

---

## [2.0.0] - 2026-06-29

### Added
- Build system dengan Makefile + latexmk (output `build/` → `dist/`)
- GitHub Actions CI (build otomatis + validate dengan chktex)
- Dukungan tabel CSV (paket `csvsimple`)
- Placeholder teks (paket `blindtext`)
- `.gitignore` untuk LaTeX artifacts, build/, dist/

### Changed
- Logo `logo_upn.png` dipindahkan ke `figures/`
- Font fallback: `newtxtext` → `times.sty` jika `binhex.tex` tidak tersedia
- Font fallback LuaLaTeX: `TeX Gyre Termes` → `Liberation Serif`

### Fixed
- CI: tambah `texlive-science` untuk package `algorithm2e`
- CI: tambah `texlive-plain-generic` untuk dependency `newtxtext`

### Removed
- `template-preview-*.pdf` dari git tracking (masuk `.gitignore`)
- File artifact LaTeX dari root

---

## [1.0.0] - 2026-01-01

### Added
- Template awal LaTeX untuk skripsi/thesis UPN Veteran Jawa Timur
- Dual language support (Indonesia / English) via folder-based content
- Dual document type (skripsi / tesis)
- Centralized metadata di `config/thesis-config.tex`
- Label kamus bilingual di `config/thesis-language.tex`
- 5 bab template (Pendahuluan s.d. Kesimpulan)
- Halaman cover, lembar pengesahan, persetujuan, pernyataan plagiasi
- Halaman abstrak, kata pengantar, daftar singkatan
- Halaman khusus `DAFTAR LAMPIRAN` / `LIST OF APPENDICES`
- Daftar isi, daftar gambar, daftar tabel, daftar kode
- Contoh gambar, notasi matematika, dan algoritma
- Referensi BibTeX
- Template helper (`\TemplateTip`, `\TemplateTodo`)
