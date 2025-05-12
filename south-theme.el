;;; south-theme.el --- A bright, summery companion to Nord  -*- lexical-binding: t; -*-

;; Copyright (C) 2024  Sophie Bosio

;; Author: Sophie Bosio <sophie.bosio@outlook.com>
;; URL: https://github.com/SophieBosio/south-theme
;; Package-Version: 0.0.1
;; Package-Requires: ((emacs "26.3") (magit-section "0.1"))
;; Keywords: nord, light, solarized, blue, green

;;; License:

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; I love the Nord theme: https://www.nordtheme.com/
;; It's a dark, muted, and cool theme. I was never able to find a light theme
;; that I felt corresponded to Nord, so I made one: South!
;; Like Nord, it mostly uses greens and blues but with a summery twist.

;;; Code:

(eval-when-compile
  (require 'cl-lib))

(require 'autothemer)

(unless (>= emacs-major-version 26)
  (error "Requires Emacs 26 or later"))

;;;###autoload
(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
                  (file-name-as-directory
                   (file-name-directory load-file-name))))

(autothemer-deftheme south "A bright companion to Nord!"

  ;; TODO: Implement more of the undefined faces - see them with 'autothemer-generate-templates'
  ;; For inspo, see https://github.com/doomemacs/themes/blob/master/doom-themes-base.el

  ;; Define custom colours
  ((((class color) (min-colors #xFFFFFF))) ;; South is only defined for GUI Emacs

    ;; White
    (background         "#fcfcfd")
    (darker-background  "#edf2fd")

    ;; Grey
	(cool-dark-grey     "#9097a6")
    (cool-medium-grey   "#b5bac4")
    (cool-light-grey    "#e4eaf3")
	(warm-grey          "#787571")

	;; Black
	(black              "#181D25")
	(black-faded        "#28313E")

	;; Blue
	(slate-grey         "#374A67")
	(cobalt             "#0850B5")
	(denim              "#1D5AB5")
	(aqua               "#0092af")
    (sky                "#257fc4")
	
	;; Green
	(grass              "#2b9728")
	(lake               "#008165")
	(viridian           "#5B9279")
	(persian            "#499794")

	;; Yellow
	(sunglow            "#efc267")

    ;; Orange
    (orange             "#cc4705")

	;; Red
    (auburn             "#c1293d")

	;; Purple
	(purple             "#615FB9")

    ;; Background colours
    (selection          "#ceeaff")      ; Medium blue
	(ice                "#c2d6f2")      ; Dark blue
    (crystal            "#d9edfc")      ; Light blue
	(celadon            "#bee4cb")      ; Green
    (soft-yellow        "#f9e7c3")      ; Yellow
	(coral              "#f3b1b1")      ; Red
    )

    ;; Set faces
    (
	 ;; |------------- GENERAL -------------|

	 ;; Default text
	 (default             (:background background :foreground black))
	 ;; (bold             ())
     ;; (bold-italic      ())
     ;; (italic           ())

	 ;; Emacs UI
	 (cursor              (:background black))
	 (mode-line           (:background cool-light-grey :foreground black-faded))
     (mode-line-inactive  (:background cool-light-grey :foreground cool-dark-grey))
     (fringe              (:background background))
     (hl-line             (:background darker-background))
     (region              (:background selection))
     (secondary-selection (:background crystal))
     (minibuffer-prompt   (:foreground denim))
     (vertical-border     (:foreground cool-dark-grey))
     (internal-border     (:foreground warm-grey))
     (window-divider      (:foreground warm-grey))
     (link                (:foreground denim :underline (:color denim :style 'line)))
     (shadow              (:foreground cool-dark-grey))
	 
	 ;; System faces
	 (error               (:foreground auburn))
     (success             (:foreground lake))
     (warning             (:foreground sunglow))
     (alert-trivial-face  (:foreground lake                      :weight 'bold))
     (alert-low-face      (:foreground sunglow                   :weight 'bold))
     (alert-moderate-face (:foreground sunglow                   :weight 'bold))
     (alert-high-face     (:foreground auburn                    :weight 'bold))
     (alert-urgent-face   (:foreground auburn :background coral  :weight 'bold))
     ;; (trailing-whitespace ())
     ;; (escape-glyph        ())
     (header-line         (:background cool-light-grey :foreground black-faded))
     (highlight           (:background celadon))
	 (lazy-highlight      (:background ice))
     (match               (:inherit 'highlight))
     ;; (homoglyph           ())
     ;; (nobreak-space       ())
     (tooltip             (:foreground lake :background darker-background :inherit 'fixed-pitch))

	 ;; ;; Line numbers
     (line-number                 (:foreground cool-medium-grey :slant 'italic))
     (line-number-current-line    (:foreground black :slant 'italic))
     (linum                       (:inherit 'line-number))
     (linum-highlight-face        (:inherit 'line-number-current-line))
     (linum-relative-current-face (:inherit 'line-number-current-line))

	 ;; ;; Font lock faces
	 (font-lock-builtin-face              (:foreground lake))
     (font-lock-constant-face             (:foreground lake))
     (font-lock-comment-face              (:foreground cool-dark-grey))
     (font-lock-comment-delimiter-face    (:inherit 'font-lock-comment-face))
     (font-lock-function-name-face        (:foreground cobalt))
	 (font-lock-keyword-face              (:foreground aqua))
	 (font-lock-string-face               (:foreground grass))
     (font-lock-number-face               (:foreground denim))
	 (font-lock-variable-name-face        (:foreground sky))
	 (font-lock-type-face                 (:foreground lake))
     (font-lock-doc-face                  (:inherit    'font-lock-comment-face))
     (font-lock-property-face             (:foreground aqua))
     (font-lock-warning-face              (:foreground auburn))
     ;; (font-lock-negation-char-face        ())
     ;; (font-lock-preprocessor-face         ())
     ;; (font-lock-preprocessor-char-face    ())
     ;; (font-lock-regexp-grouping-backslash ())
     ;; (font-lock-regexp-grouping-construct ())

	 ;; ;; Faces in 'Customize Group' UI
	 ;; (widget-field        ())
     ;; (custom-group-tag    ())
     ;; (custom-variable-tag ())

	 ;; ;; Pop-ups
	 ;; (popup-face                ())
     ;; (popup-menu-mouse-face     ())
     ;; (popup-menu-selection-face ())
     ;; (popup-tip-face            ())

     ;; solaire-mode
     (solaire-default-face  (:background darker-background))

     ;; ;; Messages
     ;; (message-cited-text        ())
     ;; (message-header-cc         ())
     ;; (message-header-name       ())
     ;; (message-header-newsgroups ())
     ;; (message-header-other      ())
     ;; (message-header-subject    ())
     ;; (message-header-to         ())
     ;; (message-header-xheader    ())
     ;; (message-mml               ())
     ;; (message-separator         ())

	 ;; ;; whitespace-mode
	 ;; (whitespace-space            ())
     ;; (whitespace-hspace           ())
     ;; (whitespace-tab              ())
     ;; (whitespace-newline          ())
     ;; (whitespace-trailing         ())
     (whitespace-line             (:foreground auburn :background coral))
     ;; (whitespace-space-before-tab ())
     ;; (whitespace-indentation      ())
     ;; (whitespace-empty            ())
     ;; (whitespace-space-after-tab  ())

     ;; Built-in show-paren-mode
     (show-paren-match            (:foreground cobalt :background crystal :weight 'bold))
     (show-paren-match-expression (:foreground cobalt :background crystal :weight 'bold))
     (show-paren-mismatch         (:foreground auburn :background coral   :weight 'bold))

	 ;; ;; Rainbow delimiters
	 ;; (rainbow-delimiters-depth-1-face   (:background ice))
     ;; (rainbow-delimiters-depth-2-face   ())
     ;; (rainbow-delimiters-depth-3-face   ())
     ;; (rainbow-delimiters-depth-4-face   ())
     ;; (rainbow-delimiters-depth-5-face   ())
     ;; (rainbow-delimiters-depth-6-face   ())
     ;; (rainbow-delimiters-depth-7-face   ())
     ;; (rainbow-delimiters-depth-8-face   ())
     ;; (rainbow-delimiters-depth-9-face   ())
     ;; (rainbow-delimiters-depth-10-face  ())
     ;; (rainbow-delimiters-depth-11-face  ())
     ;; (rainbow-delimiters-depth-12-face  ())
     (rainbow-delimiters-unmatched-face (:background coral))

	 ;; Outline faces
	 ;; Note that the Org mode headings ('org-level-N') faces inherit these
     (outline-1 (:foreground denim        :weight 'bold :extend t))
     (outline-2 (:foreground lake         :weight 'bold :extend t))
	 (outline-3 (:foreground aqua         :weight 'bold :extend t))
     (outline-4 (:foreground grass        :weight 'bold :extend t))
     (outline-5 (:foreground aqua         :weight 'bold :extend t))
     (outline-6 (:foreground auburn       :weight 'bold :extend t))
     (outline-7 (:foreground lake         :weight 'bold :extend t))
     (outline-8 (:foreground purple       :weight 'bold :extend t))


	 ;; |------------- ORG -------------|

	 ;; Org Mode
	 (org-hide                 (:foreground background))
     ;; (org-special-keyword      ())
     (org-drawer               (:foreground cool-dark-grey))
     ;; (org-column               ())
     ;; (org-column-title         ())
     (org-warning              (:foreground sunglow))
     ;; (org-archived             ())
     (org-link                 (:foreground denim :underline (:color denim :style 'line)))
     ;; (org-footnote             ())
     (org-ellipsis             (:foreground cool-dark-grey :underline nil))
     (org-date                 (:foreground cool-dark-grey))
     (org-tag                  (:foreground cool-dark-grey))
     (org-list-dt              (:foreground denim))
     (org-todo                 (:foreground sky :background darker-background :bold 'inherit))
     (org-done                 (:foreground cool-dark-grey  :weight 'bold))
     (org-headline-done        (:foreground cool-dark-grey  :weight 'bold))
     (org-table                (:foreground denim))
     (org-meta-line            (:foreground cool-dark-grey :extend t))
     (org-block                (:foreground black            :background darker-background))
     (org-block-begin-line     (:foreground cool-dark-grey :background darker-background :extend t))
     (org-block-end-line       (:inherit   'org-block-begin-line))
     (org-verbatim             (:foreground lake             :background background))
     ;; (org-formula              ())
     (org-document-title       (:foreground denim :weight 'bold))
     (org-document-info        (:foreground denim :weight 'bold))
     ;; (org-agenda-structure     ())
     ;; (org-agenda-date-today    ())
     ;; (org-scheduled            ())
     ;; (org-scheduled-today      ())
     ;; (org-scheduled-previously ())
     ;; (org-upcoming-deadline    ())
     ;; (org-deadline-announce    ())
     ;; (org-time-grid            ())
     ;; (org-latex-and-related    ())

	 ;; Org Agenda
	 (org-agenda-done               (:inherit    'org-done))
     (org-agenda-dimmed-todo-face   (:foreground cool-dark-grey))
     (org-agenda-date               (:foreground cool-dark-grey   :weight 'ultra-bold))
     (org-agenda-date-today         (:foreground black-faded        :weight 'ultra-bold))
     (org-agenda-date-weekend       (:foreground cool-dark-grey   :weight 'ultra-bold))
     (org-agenda-structure          (:foreground slate-grey         :weight 'ultra-bold))
     (org-agenda-clocking           (:background denim))
     (org-upcoming-deadline         (:foreground denim))
     (org-upcoming-distant-deadline (:foreground denim))
     (org-scheduled                 (:foreground slate-grey))
     (org-scheduled-today           (:foreground aqua))
     (org-scheduled-previously      (:foreground slate-grey))
     (org-time-grid                 (:foreground cool-dark-grey))
     (org-sexp-date                 (:foreground black))

	 
	 ;; |------------- VERSION CONTROL -------------|

	 ;; ;; Magit
     ;; (magit-bisect-bad                  ())
     ;; (magit-bisect-good                 ())
     ;; (magit-bisect-skip                 ())
     (magit-blame-heading               (:foreground cobalt :background crystal))
     ;; (magit-branch-local                ())
     ;; (magit-branch-current              ())
     ;; (magit-branch-remote               ())
     ;; (magit-cherry-equivalent           ())
     ;; (magit-cherry-unmatched            ())
     (magit-diff-file-heading-highlight (:background darker-background))
     (magit-diff-context-highlight      (:background darker-background))
     ;; (magit-diff-added                  ())
     ;; (magit-diff-added-highlight        (:foreground viridian))
     ;; (magit-diff-base                   ())
     ;; (magit-diff-base-highlight         ())
     ;; (magit-diff-context                ())
     ;; (magit-diff-context-highlight      ())
     (magit-diff-hunk-heading           (:background darker-background))
     (magit-diff-hunk-heading-highlight (:background crystal))
     ;; (magit-diff-hunk-heading-selection ())
     ;; (magit-diff-lines-heading          ())
     ;; (magit-diff-removed                ())
     ;; (magit-diff-removed-highlight      ())
     ;; (magit-diffstat-added              ())
     ;; (magit-diffstat-removed            ())
     ;; (magit-dimmed                      ())
     ;; (magit-hash                        ())
     ;; (magit-log-author                  ())
     ;; (magit-log-date                    ())
     ;; (magit-log-graph                   ())
     ;; (magit-process-ng                  ())
     ;; (magit-process-ok                  ())
     ;; (magit-reflog-amend                ())
     ;; (magit-reflog-checkout             ())
     ;; (magit-reflog-cherry-pick          ())
     ;; (magit-reflog-commit               ())
     ;; (magit-reflog-merge                ())
     ;; (magit-reflog-other                ())
     ;; (magit-reflog-rebase               ())
     ;; (magit-reflog-remote               ())
     ;; (magit-reflog-reset                ())
     ;; (magit-refname                     ())
     (magit-section-heading             (:foreground aqua :weight 'bold))
     ;; (magit-section-heading-selection   ())
     (magit-section-highlight           (:background darker-background))
     ;; (magit-sequence-drop               ())
     ;; (magit-sequence-head               ())
     ;; (magit-sequence-part               ())
     ;; (magit-sequence-stop               ())
     ;; (magit-signature-bad               ())
     ;; (magit-signature-error             ())
     ;; (magit-signature-expired           ())
     ;; (magit-signature-good              ())
     ;; (magit-signature-revoked           ())
     ;; (Magit-signature-untrusted         ())
     (magit-tag                         (:foreground lake))

	 ;; ;; Diffs
	 ;; (diff-header            ())
     ;; (diff-file-header       ())
     ;; (diff-hunk-header       ())
     ;; (diff-context           ())
     ;; (diff-added             (:background ))
     ;; (diff-refine-added      ())
     ;; (diff-removed           (:background ))
     ;; (diff-refine-removed    ())
     ;; (diff-indicator-changed (:background ))
     ;; (diff-indicator-added   (:background ))
     ;; (diff-indicator-removed (:background ))

     ;; ;;; git-gutter

     ;; (git-gutter:modified (:background ))
     ;; (git-gutter:added    (:background ))
     ;; (git-gutter:deleted  (:background ))

     ;; ;;; git-gutter+

     ;; (git-gutter+-modified (:background ))
     ;; (git-gutter+-added    (:background ))
     ;; (git-gutter+-deleted  (:background ))

     ;; ;;; git-gutter-fringe

     ;; (git-gutter-fr:modified (:background ))
     ;; (git-gutter-fr:added    (:background ))
     ;; (git-gutter-fr:deleted  (:background ))

     ;; ;;; diff-hl

     (diff-hl-change (:foreground ice     :background ice))
     (diff-hl-insert (:foreground celadon :background celadon))
     (diff-hl-delete (:foreground coral   :background coral))


	 ;; |------------- COMPLETION & SEARCH -------------|

     ;; Minibuffer
     (minibuffer-prompt (:foreground denim))

     ;; Generic completions
     (completions-common-part (:foreground cobalt))

     ;; ISearch
     (isearch (:inherit 'highlight))

	 ;; Vertico
     (vertico-current (:inherit 'region :extend t))

	 ;; Vertico posframe
	 ;; (vertico-posframe          ())
     ;; (vertico-posframe-border   ())
     ;; (vertico-posframe-border-2 ())
     ;; (vertico-posframe-border-3 ())
     ;; (vertico-posframe-border-4 ())

     ;; Consult
     (consult-highlight-mark  (:inherit 'highlight))
     (consult-highlight-match (:inherit 'highlight))

     ;; AG the silver searcher
     (ag-hit-face   (:foreground black))
     (ag-match-face (:inherit    'highlight))

	 ;; Company
     (company-scrollbar-bg                 (:background ice))
     (company-scrollbar-fg                 (:background lake))
     (company-tooltip                      (:background darker-background :foreground lake))
     ;; (company-tooltip-annotation           ())
     ;; (company-tooltip-annotation-selection ())
     (company-tooltip-selection            (:background ice               :foreground lake))
     ;; (company-tooltip-common               ())
     ;; (company-tooltip-common-selection     ())
     ;; (company-preview-common               ())
     (company-preview                      (:background ice               :foreground lake))
     ;; (company-preview-search               ())
     ;; (company-template-field               ())
     ;; (company-echo-common                  ())

     ;; Corfu
     (corfu-current    (:foreground aqua :background crystal))
     (corfu-default    (:foreground aqua :background background))
     (corfu--bar       (:foreground aqua))    ;; Inactive scrollbar area
     (corfu-bar        (:background lake))    ;; Scrollbar
     (corfu-border     (:background cool-medium-grey))
     (corfu-deprecated (:foreground black-faded :background darker-background :strike-through black-faded))

	 ;; Marginalia
     ;; (marginalia-documentation (:foreground ice))

     ;; Orderless
     (orderless-match-face-0 (:inherit   'completions-common-part))
     (orderless-match-face-1 (:foreground denim))
     (orderless-match-face-2 (:foreground lake))
     (orderless-match-face-3 (:foreground aqua))

     ;; Prescient
     (prescient-primary-highlight   (:inherit 'unspecified))
     (prescient-secondary-highlight (:inherit 'unspecified))

     ;; xref
     (xref-match (:inherit 'highlight))


	 ;; |------------- SYNTAX- & SPELL-CHECKING -------------|

	 ;; ;; Flyspell
	 ;; (flyspell-duplicate ())
     ;; (flyspell-incorrect ())

	 ;; ;; Flycheck
	 (flycheck-warning            (:underline (:style 'wave :color sunglow)))
     (flycheck-error              (:underline (:style 'wave :color coral)))
     (flycheck-info               (:underline (:style 'wave :color ice)))
     (flycheck-fringe-warning     (:foreground sunglow))
     (flycheck-fringe-error       (:foreground coral))
     (flycheck-fringe-info        (:foreground ice))
     (flycheck-error-list-warning (:foreground sunglow      :bold t))
     (flycheck-error-list-error   (:foreground coral        :bold t))
     (flycheck-error-list-info    (:foreground ice          :bold t))

	 
	 ;; |------------- TERMINAL -------------|

	 ;; ;; Term
	 ;; (term-color-black      ())
     ;; (term-color-blue       ())
     ;; (term-color-cyan       ())
     ;; (term-color-green      ())
     ;; (term-color-magenta    ())
     ;; (term-color-red        ())
     ;; (term-color-white      ())
     ;; (term-color-yellow     ())
     ;; (term-default-fg-color ())
     ;; (term-default-bg-color ())

	 ;; ;; Eshell
	 ;; (eshell-prompt        ())
     ;; (eshell-ls-archive    ())
     ;; (eshell-ls-backup     ())
     ;; (eshell-ls-clutter    ())
     ;; (eshell-ls-directory  ())
     ;; (eshell-ls-executable ())
     ;; (eshell-ls-missing    ())
     ;; (eshell-ls-product    ())
     ;; (eshell-ls-readonly   ())
     ;; (eshell-ls-special    ())
     ;; (eshell-ls-symlink    ())
     ;; (eshell-ls-unreadable ())

	 
	 ;; |------------- PROGRAMMING++ -------------|

     ;; LSP Mode
     (lsp-face-highlight-textual               (:inherit    'unspecified))
     (lsp-face-highlight-read                  (:inherit    'unspecified))
     (lsp-face-highlight-write                 (:inherit    'highlight))
     (lsp-installation-buffer-face             (:foreground lake))
     (lsp-flycheck-warning-unnecessary-face    (:inherit    'font-lock-comment-face))
     (lsp-flycheck-info-unnecessary-face       (:inherit    'font-lock-comment-face))
     (lsp-modeline-code-actions-preferred-face (:foreground sunglow))

     ;; Symbol overlays
     (symbol-overlay-default-face (:inherit    'unspecified))
     (symbol-overlay-face-1       (:background celadon))
     (symbol-overlay-face-2       (:background soft-yellow))
     (symbol-overlay-face-3       (:background selection))
     (symbol-overlay-face-4       (:background coral))
     (symbol-overlay-face-5       (:background crystal))

     ;; Compilation mode
     (compilation-column-number  (:inherit    'line-number))
     (compilation-line-number    (:inherit    'line-number))
     (compilation-mode-line-exit (:inherit    'compilation-info))
     (compilation-mode-line-fail (:inherit    'error))
     (compilation-error          (:inherit    'error))
     (compilation-info           (:foreground lake))
     (compilation-warning        (:foreground cobalt))

	 ;; ;; LaTeX
	 ;; (font-latex-bold-face         ())
     ;; (font-latex-italic-face       ())
     ;; (font-latex-math-face         ())
     ;; (font-latex-script-char-face  ())
     ;; (font-latex-sectioning-5-face ())
     ;; (font-latex-sedate-face       ())
     ;; (font-latex-string-face       ())
     ;; (font-latex-verbatim-face     ())
     ;; (font-latex-warning-face      ())
     ;; (preview-face                 ())

	 ;; ;; CIDER
	 ;; (cider-debug-code-overlay-face ())
     (cider-deprecated-face             (:foreground black-faded :background cool-light-grey :strike-through cool-medium-grey))
     ;; (cider-enlightened-local-face  ())
     (cider-error-highlight-face        (:foreground auburn :background coral))
     (cider-error-overlay-face          (:inherit    'cider-error-highlight-face))
     (cider-fringe-good-face            (:foreground ice))
     (cider-instrumented-face           (:background crystal :box (:color lake :line-width -1)))
     (cider-result-overlay-face         (:background crystal))
     (cider-test-success-face           (:foreground lake   :background celadon))
     (cider-test-error-face             (:foreground black  :background soft-yellow))
     (cider-test-failure-face           (:foreground auburn :background coral))
     ;; (cider-traced                  ())
     ;; (cider-warning-highlight-face  ())
     (cider-stacktrace-error-class-face (:inherit    'error))
     (cider-repl-stderr-face            (:inherit    'error))
     (cider-stacktrace-ns-face          (:foreground black-faded))

     ;; EROS
     (eros-result-overlay-face (:inherit 'cider-result-overlay-face))

     ;; JS2
     (js2-error (:inherit 'error))

     ;; Shell
     (sh-heredoc     (:foreground lake))
     (sh-quoted-exec (:foreground aqua))

     ;; Markdown
     (markdown-highlighting-face (:inherit 'highlight))

     ;; Multiple cursors
     (mc/cursor-face     (:foreground cobalt :weight 'bold))
     (mc/cursor-bar-face (:foreground cobalt :background crystal :weight 'bold))

     ;; |------------- MISC. BUILT-IN -------------|

     ;; ANSI
     (ansi-color-black          (:foreground black))
     (ansi-color-blue           (:foreground cobalt))
     (ansi-color-cyan           (:foreground aqua))
     (ansi-color-green          (:foreground lake))
     (ansi-color-magenta        (:foreground purple))
     (ansi-color-red            (:foreground sunglow))
     (ansi-color-white          (:foreground cool-medium-grey))
     (ansi-color-yellow         (:foreground orange))
     (ansi-color-bright-black   (:foreground black-faded))
     (ansi-color-bright-blue    (:foreground crystal))
     (ansi-color-bright-cyan    (:foreground selection))
     (ansi-color-bright-green   (:foreground celadon))
     (ansi-color-bright-magenta (:foreground ice))
     (ansi-color-bright-red     (:foreground coral))
     (ansi-color-bright-white   (:foreground background))
     (ansi-color-bright-yellow  (:foreground soft-yellow))
     ;; (ansi-color-bold           ())
     ;; (ansi-color-italic         ())
     ;; (ansi-color-underline      ())
     ;; (ansi-color-inverse        ())
     ;; (ansi-color-faint          ())
     ;; (ansi-color-slow-blink     ())
     ;; (ansi-color-fast-blink     ())

     ;; Calendar
     (diary    (:foreground lake))
     (holiday  (:inherit 'highlight))

     ;; Misc
     (shr-mark  (:inherit 'highlight))
     (homoglyph (:foreground aqua))
))

(provide-theme 'south)

;;; south-theme.el ends here
