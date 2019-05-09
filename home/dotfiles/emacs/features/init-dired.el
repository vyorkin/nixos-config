(require 'init-quelpa)
(require 'init-appearance)
(require 'init-general)

(defconst rc/dired-html-files-extensions
  '("htm" "html" "xhtml" "phtml" "haml"
    "asp" "aspx" "xaml" "php" "jsp")
  "HTML files extensions")
(defconst rc/dired-styles-files-extensions
  '("css" "sass" "scss" "less")
  "Styles files extensions")
(defconst rc/dired-xml-files-extensions
  '("xml" "xsd" "xsl" "xslt" "wsdl")
  "XML files extensions")
(defconst rc/dired-document-files-extensions
  '("doc" "docx" "ppt" "pptx" "xls" "xlsx"
    "csv" "rtf" "djvu" "epub""wps" "pdf" "texi" "tex"
    "odt" "ott" "odp" "otp" "ods" "ots"
    "odg" "otg")
  "Document files extensions")
(defconst rc/dired-text-files-extensions
  '("txt" "md" "org" "ini" "conf" "rc" "vim" "vimrc" "exrc")
  "Text files extensions")
(defconst rc/dired-sh-files-extensions
  '("sh" "bash" "zsh" "fish" "csh" "ksh"
    "awk" "ps1" "psm1" "psd1" "bat" "cmd")
  "Shell files extensions")
(defconst rc/dired-source-files-extensions
  '("py" "c" "cc" "cpp" "cxx" "c++" "h" "hpp" "hxx" "h++"
    "java" "pl" "rb" "el" "pl" "pm" "l" "jl" "f90" "f95"
    "R" "php" "hs" "purs" "coffee" "ts" "js" "json" "m" "mm"
    "ml" "asm" "vb" "ex" "exs" "erl" "go" "clj" "cljs"
    "sql" "yml" "yaml" "toml" "rs" "idr" "cs" "mk" "make" "swift"
    "rake" "lua")
  "Source files extensions")
(defconst rc/dired-compressed-files-extensions
  '("zip" "bz2" "tgz" "txz" "gz" "xz" "z" "Z"
    "war" "ear" "rar" "sar" "xpi" "apk" "tar" "7z"
    "gzip" "001" "ace" "lz"
    "lzma" "bzip2" "cab" "jar" "iso")
  "Compressed files extensions")
(defconst rc/dired-image-files-extensions
  '("bmp" "jpg" "jpeg" "gif" "png" "tiff"
    "ico" "svg" "psd" "pcd" "raw" "exif"
    "BMP" "JPG" "PNG")
  "Image files extensions")
(defconst rc/dired-audio-files-extensions
  '("mp3" "MP3" "ogg" "OGG" "flac" "FLAC" "wav" "WAV")
  "Dired Audio files extensions")
(defconst rc/dired-video-files-extensions
  '("vob" "VOB" "mkv" "MKV" "mpe" "mpg" "MPG"
    "mp4" "MP4" "ts" "TS" "m2ts"
    "M2TS" "avi" "AVI" "mov" "MOV" "wmv"
    "asf" "m2v" "m4v" "mpeg" "MPEG" "tp")
  "Dired Video files extensions")
(defconst rc/dired-misc-files-extensions
  '("DS_Store" "projectile" "cache" "elc" "dat" "meta")
  "Misc files extensions")

(use-package dired
  :requires (init-general init-bookmarks)
  :after general
  :ensure nil
  :commands (dired)
  :custom
  ;; do not bind C-x C-j since it's used by jabber.el
  (dired-bind-jump nil)
  :init
  ;; prevents dired from creating an annoying popup
  ;; when dired-find-alternate-file is called
  (setq
   ;; if there is a dired buffer displayed in the next window,
   ;; use its current directory
   dired-dwim-target t
   dired-omit-verbose nil
   ;; human readable filesize
   dired-listing-switches "-ahlv"
   ;; recursive copy & delete
   dired-recursive-deletes 'always
   dired-recursive-copies 'always)
  (setq
   dired-garbage-files-regexp
   "\\.\\(?:aux\\|out\\|bak\\|dvi\\|log\\|orig\\|rej\\|toc\\|class\\)\\'")
  ;; enable omit mode
  ;; (setq-default dired-omit-mode t)
  ;; hide autosave files
  (setq-default dired-omit-files "^\\.?#")
  ;; uncomment the line below if you want to hide dot files
  ;; (setq-default dired-omit-files (concat dired-omit-files "\\|^\\.[^\\.]"))
  (setq
   dired-omit-extensions
   '("CVS" "RCS" ".o" "~" ".bin" ".lbin" ".fasl" ".ufsl" ".a" ".ln" ".blg"
     ".bbl" ".elc" ".lof" ".glo" ".idx" ".aux" ".glob" ".vo"
     ".lot" ".fmt" ".tfm" ".class" ".DS_Store"
     ".fas" ".lib" ".x86f" ".sparcf" ".lo" ".la" ".toc" ".aux" ".cp" ".fn"
     ".ky" ".pg" ".tp" ".vr" ".cps" ".fns" ".kys" ".pgs" ".tps" ".vrs"
     ".idx" ".lof" ".lot" ".glo" ".blg" ".bbl" ".cp" ".cps" ".fn" ".fns"
     ".ky" ".kys" ".pg" ".pgs" ".tp" ".tps" ".vr" ".vrs" ".gv" ".gv.pdf"))
  ;; macOS ls command doesn't support "--dired" option
  (when (string= system-type "darwin")
    (setq dired-use-ls-dired nil))
  :config
  (put 'dired-find-alternate-file 'disabled nil)
  (nmap
    :prefix rc/leader
    "j" 'dired-jump)
  (nmap 'dired-mode-map
    "gg" 'evil-goto-first-line
    "G" 'evil-goto-line
    "b" 'bookmark-set)
  :hook
  (dired-mode . dired-hide-details-mode)
  :diminish dired-mode)

(use-package diredfl
  :after dired
  :hook
  (dired-mode . diredfl-mode))

(use-package dired-launch)

(use-package dired+
  :requires init-quelpa
  :after dired
  :quelpa (dired+ :fetcher github :repo "emacsmirror/dired-plus")
  :config
  (setq
   diredp-hide-details-initially-flag nil
   diredp-hide-details-propagate-flag nil))

(use-package dash)
(use-package dired-hacks-utils
  :after dired
  :demand t)

(use-package dired-filter
  :requires init-general
  :after dired
  :hook
  (dired-mode . dired-filter-group-mode)
  :init
  (setq
   dired-filter-keep-expanded-subtrees nil
   dired-filter-group-saved-groups
   '(("default"
      ("video" (extension "mkv" "avi" "mp4" "webm"))
      ("archives" (extension "zip" "rar" "gz" "bz2" "tar"))
      ("pdf" (extension "pdf"))
      ("tex" (extension "tex" "bib"))
      ("js" (extension "js"))
      ("ts" (extension "ts"))
      ("json" (extension "json"))
      ("styles" (extension "css" "scss" "sass" "less"))
      ("html" (extension "html"))
      ("haskell" (extension "hs"))
      ("idris" (extension "idr"))
      ("purescript" (extension "purs"))
      ("c/c++"
       (extension
        "c" "cc" "cpp" "cxx" "c++"
        "h" "hpp" "hxx" "h++"))
      ("oRG" (extension "org"))
      ("lisp" (extension "el"))
      ("word" (extension "docx" "doc"))
      ("excel" (extension "xlsx" "xls"))
      ("text" (extension "txt"))
      ("svg" (extension "svg"))
      ("shell"
       (extension
        "sh" "bash" "zsh" "fish" "csh" "ksh"
        "awk" "ps1" "psm1" "psd1" "bat" "cmd"))
      ("audio"
       (extension
        "mp3" "ogg" "flac" "wav"))
      ("img"
       (extension
        "bmp" "jpg" "jpeg" "gif" "png" "tiff"
        "ico" "svg" "psd" "pcd" "raw" "exif")))))
  (nmap 'dired-mode-map
    "/" 'dired-filter-map
    "C-c C-t" 'dired-filter-group-toggle-header
    "C-c C-g" 'dired-filter-group-mode))

(use-package dired-avfs
  :after (dired dired-hack-utils)
  :config)

(use-package dired-open
  :after (dired dired-hack-utils)
  :config)

(use-package dired-narrow
  :requires init-general
  :after (general dired)
  :config
  (nmap 'dired-mode-map
    "," 'dired-narrow))

;; peep at files in another window from dired buffers
(use-package peep-dired
  :requires init-general
  :after (dired general)
  :preface
  (defconst rc/peep-dired/ignored-extensions
    (append
     rc/dired-document-files-extensions
     rc/dired-compressed-files-extensions
     rc/dired-image-files-extensions
     rc/dired-audio-files-extensions
     rc/dired-video-files-extensions
     rc/dired-misc-files-extensions))
  :hook
  (peep-dired . evil-normalize-keymaps)
  :init
  (setq
   peep-dired-ignored-extensions rc/peep-dired/ignored-extensions
   peep-dired-cleanup-on-disable t
   peep-dired-enable-on-directories t)
  :config
  (nmap 'dired-mode-map
    "C-c C-v" 'peep-dired)
  (general-define-key
   :states '(normal)
   :keymaps 'peep-dired-mode-map
   "j" 'peep-dired-next-file
   "k" 'peep-dired-prev-file))

(provide 'init-dired)
