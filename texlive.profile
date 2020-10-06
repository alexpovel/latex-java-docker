# -------------------------------------------------------------------------------
# TeX Live profile to configure the installation procedure, enabling headless/
# unattended install.
# For more info, see: https://www.tug.org/texlive/doc/install-tl.html#PROFILES
# -------------------------------------------------------------------------------
# File has to have LF line endings to work with `install-tl` Perl script!
# -------------------------------------------------------------------------------

# We do a manual-ish install, do not use premade scheme:
selected_scheme scheme-custom

# -------------------------------------------------------------------------------
# The below directories are the installation destinations.
# For scripting/convenience, they are set using environment variables in the
# Dockerfile, NOT here.
# -------------------------------------------------------------------------------
# TEXDIR /usr/local/texlive/<version>
# TEXMFSYSCONFIG /usr/local/texlive/<version>/texmf-config
# TEXMFSYSVAR /usr/local/texlive/<version>/texmf-var
#
# TEXMFHOME ~/texmf
# TEXMFLOCAL /usr/local/texlive/texmf-local
#
# TEXMFVAR ~/.texlive<version>/texmf-var
# TEXMFCONFIG ~/.texlive<version>/texmf-config
#
# -------------------------------------------------------------------------------
# Collections of packages; for their contents, see
# http://mirror.ctan.org/systems/texlive/tlnet/tlpkg/texlive.tlpdb
# and search for 'name collection-<name>', e.g. 'name collection-basic'.
# At the time of writing, the following encompasses all available collections.
# Only the core ones with very few supported languages are enabled. For example,
# just including 'collection-langjapanese' requires 800MB of space.
# -------------------------------------------------------------------------------
collection-basic 1
collection-bibtexextra 1
collection-binextra 1
collection-fontsextra 1
collection-fontsrecommended 1
collection-fontutils 1
collection-formatsextra 1
collection-langenglish 1
collection-langeuropean 1
collection-langgerman 1
collection-latex 1
collection-latexextra 1
collection-latexrecommended 1
collection-luatex 1
collection-mathscience 1
collection-pictures 1
collection-plaingeneric 1
collection-publishers 1
collection-xetex 1
# -------------------------------------------------------------------------------
# Enable the following disabled ones as needed. They are included here so
# everyone can see what is available; as many as possible are disabled, since
# image size matters. The default is aimed at documents in the sciences domain.
# Therefore, everything else is disabled. This includes various languages, so
# activate your missing language here!
# -------------------------------------------------------------------------------
collection-context 0
collection-games 0
collection-humanities 0
collection-langarabic 0
collection-langchinese 0
collection-langcjk 0
collection-langcyrillic 0
collection-langczechslovak 0
collection-langfrench 0
collection-langgreek 0
collection-langitalian 0
collection-langjapanese 0
collection-langkorean 0
collection-langother 0
collection-langpolish 0
collection-langportuguese 0
collection-langspanish 0
collection-metapost 0
collection-music 0
collection-pstricks 0
collection-texworks 0
collection-wintools 0
# -------------------------------------------------------------------------------
# Options for TeXLive installation
# -------------------------------------------------------------------------------
# Create symlinks in standard $PATH directories (TeXLive installs into `TEXDIR`,
# see its path above). Instead of manipulating $PATH, symlinks to `TEXDIR` are
# created, per default into `/usr/local/bin`.
# This setting is required to find tools!
# WARNING: This seems to only have been introduced in TeXLive 2017, see:
# https://web.archive.org/web/20171213102459/http://www.tug.org/texlive/doc/install-tl.html
# (archives from 2016 and earlier do not mention `adjustpath` on that page).
#
# THEREFORE, turn feature off and set path manually (which works for both old and recent
# releases) in the Dockerfile.
instopt_adjustpath 0
# Do not adjust remote CTAN repository; keep the one manually specified.
# Shouldn't matter since the repository is not used after installation/image build.
instopt_adjustrepo 0
# A4 default, not letter format
instopt_letter 0
# No portable installation required
instopt_portable 0
# Required for --shell-escape option, as required by packages, e.g. `svg`
instopt_write18_restricted 1
# -------------------------------------------------------------------------------
# Some more documentation for the following options at:
# https://tug.org/texlive/doc/tlmgr.html
# -------------------------------------------------------------------------------
# Autobackup just fills cache, skip; see
# https://tex.stackexchange.com/a/398831/120853
tlpdbopt_autobackup 0
tlpdbopt_backupdir tlpkg/backups
# Create font format files, otherwise they have to be created on the fly each
# time.
tlpdbopt_create_formats 1
# None of the following is required; especially not documentation and source
# files, which fill multiple GBs
tlpdbopt_desktop_integration 0
tlpdbopt_file_assocs 0
tlpdbopt_generate_updmap 0
tlpdbopt_install_docfiles 0
tlpdbopt_install_srcfiles 0
#
# Execute postinstallation code for packages:
tlpdbopt_post_code 1
# Symlink destinations (binaries, documentation, manuals).
# Since symlinking is done manually in the Dockerfile, these are not needed.
# tlpdbopt_sys_bin /usr/local/bin
# tlpdbopt_sys_info /usr/local/share/info
# tlpdbopt_sys_man /usr/local/share/man
