# Makefile untuk Template Skripsi/Thesis Fasilkom UPN "Veteran" Jawa Timur
# Compile: make          → pdflatex + bibtex (full)
#          make once     → sekali pdflatex
#          make clean    → hapus artifact
#          make distclean→ hapus artifact + PDF
#          make rebuild  → clean + full compile

MAIN = main
VIEWER = xdg-open

# ── Engine detection: pilih pdflatex (default) atau lualatex ──
ENGINE ?= pdflatex
LATEX = $(ENGINE) -interaction=nonstopmode -file-line-error
BIBTEX = bibtex

# ── Full compilation (default) ──────────────────────────────────
.PHONY: all
all:
	@echo "=== Compilasi ke-1: $(ENGINE) ==="
	$(LATEX) $(MAIN).tex
	@echo "=== Compilasi ke-2: $(BIBTEX) ==="
	$(BIBTEX) $(MAIN)
	@echo "=== Compilasi ke-3: $(ENGINE) ==="
	$(LATEX) $(MAIN).tex
	@echo "=== Compilasi ke-4: $(ENGINE) (final) ==="
	$(LATEX) $(MAIN).tex
	@echo "=== Selesai: $(MAIN).pdf telah dihasilkan ==="

# ── Single pass ─────────────────────────────────────────────────
.PHONY: once
once:
	$(LATEX) $(MAIN).tex

# ── Fast (quiet) ─────────────────────────────────────────────────
.PHONY: fast
fast:
	@$(LATEX) -quiet $(MAIN).tex
	@$(BIBTEX) $(MAIN)
	@$(LATEX) -quiet $(MAIN).tex
	@$(LATEX) -quiet $(MAIN).tex

# ── Buka PDF ────────────────────────────────────────────────────
.PHONY: view
view:
	$(VIEWER) $(MAIN).pdf

# ── Bersihkan artifact (pertahankan PDF) ─────────────────────────
.PHONY: clean
clean:
	@rm -f \
	  $(MAIN).aux \
	  $(MAIN).log \
	  $(MAIN).toc \
	  $(MAIN).lof \
	  $(MAIN).lot \
	  $(MAIN).loa \
	  $(MAIN).out \
	  $(MAIN).bbl \
	  $(MAIN).blg \
	  $(MAIN).brf \
	  $(MAIN).bcf \
	  $(MAIN).run.xml \
	  $(MAIN).synctex.gz \
	  $(MAIN).fls \
	  $(MAIN).fdb_latexmk \
	  $(MAIN).lol \
	  $(MAIN).ist \
	  $(MAIN).glg \
	  $(MAIN).glo \
	  $(MAIN).gls \
	  $(MAIN).glsdefs \
	  $(MAIN).acn \
	  $(MAIN).acr \
	  $(MAIN).alg \
	  $(MAIN).gl
	@echo "✓ Artifact LaTeX dibersihkan (PDF tidak dihapus)"

# ── Bersihkan semua termasuk PDF ─────────────────────────────────
.PHONY: distclean
distclean: clean
	@rm -f $(MAIN).pdf
	@echo "✓ Semua file termasuk $(MAIN).pdf telah dihapus"

# ── Compile ulang dari bersih ───────────────────────────────────
.PHONY: rebuild
rebuild: clean all
