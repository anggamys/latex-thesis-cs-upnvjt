# Figures — Gambar / Images

Simpan gambar, diagram, dan aset visual skripsi di folder ini.

Store figures, diagrams, and visual assets for your thesis in this folder.

## Format yang didukung / Supported formats

| Format | Keterangan | Keterangan (EN) |
|--------|-----------|------------------|
| PDF    | Vektor, kualitas terbaik | Vector, best quality |
| PNG    | Umum, untuk screenshot/diagram | Common, for screenshots/diagrams |
| JPG/JPEG | Foto dengan ukuran kecil | Photos with small file size |
| EPS    | Legacy vector, perlu konversi | Legacy vector, requires conversion |

## Aturan penamaan / Naming rules

Gunakan nama file deskriptif tanpa spasi. Gunakan underscore (`_`) sebagai pemisah kata.

Use descriptive file names without spaces. Use underscore (`_`) as word separator.

```text
alur_penelitian.pdf     ✓
diagram_arsitektur.png  ✓
Figure 1.jpg            ✗ (mengandung spasi / contains spaces)
```

## Cara pakai / Usage

```latex
\includegraphics[width=0.85\linewidth]{nama_file.pdf}
```

Path relatif terhadap folder `figures/` sudah otomatis karena `\graphicspath{{figures/}}` di `main.tex`.
