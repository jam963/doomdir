;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
(setq doom-font (font-spec :family "Cascadia Code" :size 14 :weight 'semi-light))
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-gruvbox)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")
;; roam stuff
(setq org-roam-directory (file-truename "~/org-roam"))
(setq find-file-visit-truename t)
(org-roam-db-autosync-mode)
(setq org-roam-dailies-directory "daily/")
(setq org-roam-completion-everywhere t)
(setq org-roam-dailies-capture-templates
      '(("d" "default" entry
         "* %?"
         :target (file+head "%<%Y-%m-%d>.org"
                            "#+title: %<%Y-%m-%d>\n"))))
(setq org-agenda-files '("~/org-roam" "~/org-roam/daily" "~/org"))


(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;; OpenAI API Key
(setq openai-key "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")

;; ChatGPT
(use-package! chatgpt
  :defer t
  :bind ("C-c q" . chatgpt-query))

(setq chatgpt-code-query-map
      '(
        ;; ChatGPT.el defaults, string for each shortcut
        ("bug" . "There is a bug in the following, please help me fix it.")
        ("doc" . "Please write the documentation for the following.")
        ("improve-code" . "Please improve the following.")
        ("understand-code" . "What does the following do?")
        ("refactor" . "Please refactor the following.")
        ("suggest" . "Please make suggestions for the following.")
        ;; your shortcut
        ("improve-cl" . "Please improve the following piece of academic writing. Prioritize clarity and precision, avoiding flowerly language. Your improved text should be similar in style to conference proceedings like ACL, TACL, EMNLP, ICLR, or similar venues. Do not include citations unless they already appear in the original text.")
        ("improve-hum" . "Please improve the following piece of academic writing. Prioritize clarity and precision. Your improved text should be similar in style to humanities journals, like MLA. Do not include additional citations unless they already appear in the original text.")
        ("expand-cl" . "Please elaborate on the following in an original and thought-provoking way. Your response should be similar in style to a conference proceeding such as ACL, TACL, EMNLP, ICLR, or similar venues. Do not include additional citations or references unless they are already present in the following text.")
        ("expand-hum" . "Please elaborate on the following in an original and thought-provoking way. Prioritize clarity and precision. Your improved text should be similar in style to humanities journals like MLA, Comparative Literature, or Diacritics. Do not include additional citations or references unless they already appear in the following text.")
        ("build-org" . "Please create a neat, well-structured and succince emacs org-mode document on the following topic. Add TODOs for headings that you are you least knowledgable about, but do your best to add succint summaries under each subheading.")
        )
      )
;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
;;
;; For company-anaconda
