# Makefile untuk Template Skripsi/Thesis Fasilkom UPN "Veteran" Jawa Timur
#
# Target:
#   make / make all   -> kompilasi penuh dengan latexmk
#   make once         -> sekali kompilasi (tanpa bersih)
#   make validate     -> periksa source LaTeX dengan chktex
#   make clean        -> hapus artifact build/
#   make distclean    -> hapus build/ dan dist/
#   make rebuild      -> distclean + all
#
# Pemakaian:
#   make                   # pakai pdflatex
#   make ENGINE=lualatex   # pakai lualatex

MAIN     = main
BUILD_DIR  = build
DIST_DIR   = dist
VIEWER     = xdg-open

# Engine: pdflatex (default) atau lualatex
ENGINE ?= pdflatex

# latexmk
#   -pdf / -lualatex  : engine
#   -bibtex           : jalankan bibtex otomatis
#   -outdir=...       : output ke direktori terpisah
#   -cd               : cd ke direktori file dulu
#   -f                : force hingga selesai (nonstop)
#   -g                : selalu compile ulang (paksa semua pass)
LATEXMK_OPTS = -f -bibtex -outdir=$(BUILD_DIR) -cd

ifeq ($(ENGINE),lualatex)
  LATEXMK_OPTS += -lualatex
else
  LATEXMK_OPTS += -pdf
endif

# Build (default)
.PHONY: all
all: dist/$(MAIN).pdf

.PHONY: build
build: dist/$(MAIN).pdf

dist/$(MAIN).pdf: $(MAIN).tex FORCE
	@mkdir -p $(BUILD_DIR) $(DIST_DIR)
	latexmk $(LATEXMK_OPTS) $<
	@cp $(BUILD_DIR)/$(MAIN).pdf $(DIST_DIR)/$(MAIN).pdf
	@echo "--- $(DIST_DIR)/$(MAIN).pdf telah dihasilkan"

FORCE:

# Single pass (tanpa bersih, untuk development cepat)
.PHONY: once
once:
	@mkdir -p $(BUILD_DIR)
	latexmk $(LATEXMK_OPTS) $(MAIN).tex
	@mkdir -p $(DIST_DIR)
	@cp $(BUILD_DIR)/$(MAIN).pdf $(DIST_DIR)/$(MAIN).pdf
	@echo "--- $(DIST_DIR)/$(MAIN).pdf telah dihasilkan"

# Buka PDF
.PHONY: view
view:
	$(VIEWER) $(DIST_DIR)/$(MAIN).pdf

# Validasi LaTeX dengan chktex
.PHONY: validate
validate:
	@if command -v chktex >/dev/null 2>&1; then \
	  find . \( -name '*.tex' -o -name '*.cls' -o -name '*.sty' \) \
	    ! -path './build/*' ! -path './dist/*' \
	    -print0 | xargs -0 chktex -q --inputfiles; \
	else \
	  echo "! chktex tidak tersedia. Install dengan: sudo apt install chktex"; \
	fi

# Bersihkan build
.PHONY: clean
clean:
	@rm -rf $(BUILD_DIR)
	@echo "--- $(BUILD_DIR)/ dihapus"

# Bersihkan semua
.PHONY: distclean
distclean: clean
	@rm -rf $(DIST_DIR)
	@echo "--- $(DIST_DIR)/ dihapus"

# Compile ulang dari bersih
.PHONY: rebuild
rebuild: distclean all
