(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu4e")
(add-to-list 'load-path "/home/canicus/.emacs.d/site-lisp")

(setq user-mail-address "canicus@canic.us"
	  user-full-name "Kenneth Gardner")

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;; (package-initialize)

(ivy-mode 1)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)
;; (require white-space-mode)

;; GPG
(require 'epa)
(epa-file-enable)
(setq epg-gpg-program "gpg")

(menu-bar-mode -1)
(tool-bar-mode -1)

(use-package nov)

(defun my-nov-font-setup ()
     (face-remap-add-relative 'variable-pitch :family "Liberation Serif" :height 1.75))
(add-hook 'nov-mode-hook 'my-nov-font-setup)
	(setq nov-text-width 60)
;; Navigate nov-mode evilly
;; (add-hook 'local-set-key (kbd "C-M-n") 'nov-next-document)
;; (add-hook 'local-set-key (kbd "C-M-p") 'nov-previous-document)
;; (add-hook 'local-set-key (kbd "C-M-t") 'nov-goto-toc)

;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)

;; Evil things
(setq evil-want-integration t) ;; This is optional since it's already set to t by default.
(setq evil-want-keybinding nil)
(require 'evil)
(when (require 'evil-collection nil t)
  (evil-collection-init))
    (evil-mode 1)

;; Control gui divider
(window-divider-mode 1)
(global-display-line-numbers-mode)
(column-number-mode)

(require 'leerzeichen)
(leerzeichen-mode 1)

;; Turn on visual line mode
(add-hook 'text-mode-hook 'turn-on-visual-line-mode
		  (setq line-move-visual t))

(add-hook 'org-mode-hook (lambda () (evil-org-mode)))

;; Org-Present
(autoload 'org-present "org-present" nil t)
(eval-after-load "org-present"
  '(progn
     (add-hook 'org-present-mode-hook
               (lambda ()
                 (org-present-big)
                 (org-display-inline-images)
                 (org-present-read-only)))
     (add-hook 'org-present-mode-quit-hook
               (lambda ()
                 (org-present-small)
                 (org-remove-inline-images)
                 (org-present-show-cursor)
                 (org-present-read-write)))))


;; EMMS
(require 'emms-setup)
(emms-all)
(emms-default-players)
(setq emms-source-file-default-directory "~/music/")

;; LaTeX
(if window-system (require 'font-latex))
(setq font-lock-maximum-decoration t)
(require 'reftex)
(add-hook 'Latex-mode-hook 'turn-on-reftex) ; For AUCTeX LaTeX mode
(add-hook 'latex-mode-hook 'turn-on-reftex) ; For Emacs latex mode

;; Company
(use-package company
  :ensure t
  :init
  (add-hook 'after-init 'global-company-mode))

;;Flycheck
(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode))

;;Elfeed
(setq elfeed-feeds
      '(("https://blogs.ancientfaith.com/wholecounsel/feed" wholecounsel orthodoxy bible deyoung pseudepigrapha)
	("http://feeds.ancientfaith.com/TheLordOfSpirits" lordofspirits pseudepigrapha orthodoxy bible deyoung podcast)
	("https://blogs.ancientfaith.com/glory2godforallthings/feed/" glory2god orthodoxy freeman blog)
	("https://afkimel.wordpress.com/feed/" orthodoxy apocatastasis kimel blog)
	("https://www.ancientfaith.com/feeds/specials/the_scriptures_fr_stephen_de_young" deyoung orthodoxy bible podcast)
	("http://feeds.ancientfaith.com/GloryToGod" glory2god orthodoxy freeman podcast)
	("http://feeds.ancientfaith.com/VoicesFromSVS" svs orthodoxy podcast)
	("http://feeds.ancientfaith.com/RoadsFromEmmaus" orthodoxy emmaus podcast)
	("http://feeds.ancientfaith.com/TheAreopagusAFR" Orthodoxy Areopagus podcast)
	("https://www.firstthings.com/rss/web-exclusives" Christianity firstthings politics)
	("https://www.firstthings.com/rss/blogs/firstthoughts" Christianity firstthings politics)
	("https://www.firstthings.com/rss/blogs/leithart" Christianity firstthings politics)
	("http://edwardfeser.blogspot.com/feeds/posts/default" feser philosophy rcc blog)
	("https://nakedbiblepodcast.com/feed/podcast" nakedbible bible heiser podcast)
	("http://drmsh.com/feed" heiser bible blog)
	("https://inspiringphilosophy.wordpress.com/feed" apologetics inspiringphilosophy philosophy blog)
	("https://anchor.fm/s/41cbfa98/podcast/rss" Provetext language bible)
	("https://aeon.co/feed.rss" philosophy aion)
	("http://existentialcomics.com/rss.xml" philosophy comics humor)
	("https://egnatiavia.blogspot.com/feeds/posts/default" salter economics philosophy)
	("https://heautonpaideuomenos.blogspot.com/feeds/posts/default" greek paideia blog)
	("https://thepatrologist.com/feed/" greek latin language)
	("https://odianuktosdialogos.podomatic.com/rss2.xml" greek language podcast)
	("https://astronomy.com/rss/news" astronomy science)
	("https://www.space.com/feeds/all" space.com astronomy science)
	("https://fosspost.org/feed" linux foss foss)
	("http://feed.offtopical.net/" linuxgamer linux foss podcast)
	("https://feeds.buzzsprout.com/1263722.rss" dt foss podcast)
	("http://vault.lunduke.com/LundukeShowMP3.xml" lunduke foss linux podcast)
	("https://www.linuxbabe.com/feed" foss linux blog)
	("https://systemcrafters.cc/rss.xml" systemcrafters emacs linux customization)
	("https://lukesmith.xyz/rss.xml" lukesmith linux foss blog)
	("https://notrelated.libsyn.com/rss" lukesmith misc blog)
	("http://feeds2.feedburner.com/MarkGoodacresNTBlog" goodacre nt tc bible blog)
	("https://podacre.blogspot.com/feeds/posts/default"  goodacre nt tc bible blog)
	("https://reforminghell.com/feed/" hell apocatastasis)
	("http://rss.slashdot.org/Slashdot/slashdotMain" slashdot nerd news)
	("http://esr.ibiblio.org/?feed=rss" ers linux foss)
	("https://gitlab.com/dwt1.atom" dt config git)
	("https://github.com/LukeSmithxyz.atom" GITHUB LukeSmithxyz lukesmith config git)
	("https://www.archlinux.org/feeds/news/" foss arch linux)
	("https://www.parabola.nu/feeds/news/" foss arch linux parabola libre)
	("https://www.kernel.org/feeds/all.atom.xml" foss linux kernel)
	("https://neovim.io/news.xml" foss linux vim)
	("http://suckless.org/atom.xml" suckless foss linux)
	("https://blog.torproject.org/rss.xml" tor browser foss privacy)
	("https://www.eff.org/rss/updates.xml" eff privacy internet freedom)
	("https://efforg.libsyn.com/rss" eff privacy internet)
	("https://freedom-to-tinker.com/" foss freedom)
	("https://www.fsf.org/static/fsforg/rss/news.xml" fsf foss freedom)
	("https://www.fsf.org/static/fsforg/rss/blogs.xml" fsf foss freedom)
	("https://taler.net/en/rss.xml" pos foss taler)
	("https://friendi.ca/feed/" foss friendica social)
	("https://ryf.fsf.org/products/rss.xml" dt distrotube podcast foss linux)
	("https://www.pine64.org/feed/" pine64 singleboard)
	("https://bitcoin.org/en/rss/releases.rss" crypto bitcoin)
	("https://beincrypto.com/feed" crypto news)
	("https://coincentral.com/feed/" crypto news)
	("https://blog.trezor.io/feed" trezor crypto news)
	("http://cryptosovereignty.org/feed" crypto philosophy)
	("https://www.schiffradio.com/feed/podcast/" economics)
	("https://www.amodernhomestead.com/feed/" farming homestead food)
	("https://www.theprairiehomestead.com/blog/feed" food homestead)
	("https://fungially.com/feed/rss" mushroom food homestead)
	("https://oldworldgardenfarms.com/feed" garden food)))

(defun elfeed-mark-all-as-read ()
      (interactive)
      (mark-whole-buffer)
      (elfeed-search-untag-all-unread))

(defun elfeed-show-eww-open (&optional use-generic-p)
  "open with eww"
  (interactive "P")
  (let ((browse-url-browser-function #'eww-browse-url))
    (elfeed-show-visit use-generic-p)))

(defun elfeed-search-eww-open (&optional use-generic-p)
  "open with eww"
  (interactive "P")
  (let ((browse-url-browser-function #'eww-browse-url))
    ( elfeed-search-browse-url use-generic-p)))

;; Custom keys
;; Increase/Decrease font size
(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "C-M-p") 'scroll-down-line)
(global-set-key (kbd "C-M-n") 'scroll-up-line)
(global-set-key (kbd "C-M-o") 'ace-window)

(global-set-key (kbd "<f9>") 'nov-mode)
(global-set-key (kbd "<f10>") 'menu-bar-mode)
(global-set-key (kbd "<f12>") 'evil-mode)

(global-set-key (kbd "M-<f9>") 'c-mode)
(global-set-key (kbd "M-<f12>") 'rust-mode)

(global-set-key (kbd "<f5>") 'eww)
(global-set-key (kbd "S-<f5>") 'eww-open-in-new-buffer)
(global-set-key (kbd "<f6>") 'mu4e)
(global-set-key (kbd "<f7>") 'elfeed)
(global-set-key (kbd "M-<f7>") 'elfeed-update)
(global-set-key (kbd "C-<f7>") 'elfeed-show-eww-open)
(global-set-key (kbd "S-<f7>") 'elfeed-mark-all-as-read)
(global-set-key (kbd "<f8>") 'eshell)

(global-set-key (kbd "<XF86AudioMute>") 'emms)
(global-set-key (kbd "<XF86AudioLowerVolume>") 'emms-shuffle)
(global-set-key (kbd "<XF86AudioRaiseVolume>") 'emms-browser)
(global-set-key (kbd "<XF86MonBrightnessDown>") 'emms-play-directory-tree)
(global-set-key (kbd "<XF86MonBrightnessUp>") 'emms-previous)
(global-set-key (kbd "<XF86Display>") 'emms-next)
(global-set-key (kbd "<XF86WLAN>") 'emms-pause)

(global-set-key (kbd "<XF86Tools>") 'list-packages)
(global-set-key (kbd "<XF86Search>") '(lambda () (interactive) (find-file "~/.emacs")))
(global-set-key (kbd "<XF86LaunchA>") 'dired)

;;(global-set-key (kbd "C-x C-b") 'bufler)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes '(tsdh-dark))
 '(global-display-line-numbers-mode t)
 '(ledger-reports
   '(("b" "ledger ")
     ("bal" "%(binary) -f %(ledger-file) bal")
     ("reg" "%(binary) -f %(ledger-file) reg")
     ("payee" "%(binary) -f %(ledger-file) reg @%(payee)")
     ("account" "%(binary) -f %(ledger-file) reg %(account)")))
 '(package-selected-packages
   '(counsel-tramp counsel-web counsel peertube ledger-mode dmenu dklrt company-ledger org-tree-slide-pauses org-tree-slide window-jump vterm use-package try tramp ssh solidity-flycheck rustic rust-playground projectile pdf-view-restore passmm pass pamparam ox-reveal orgit org-re-reveal-ref org-journal-list org-journal org-evil org-bullets nov notmuch-maildir nasm-mode mutt-mode mu4e-views mu4e-query-fragments mu4e-overview mu4e-maildirs-extension mu4e-jump-to-list mu4e-conversation mpdel markdown-toc markdown-preview-mode markdown-preview-eww markdown-mode+ magithub magit-todos magit-gh-pulls magit-find-file magit-filenotify magit-diff-flycheck lsp-mode list-packages-ext lispyville linguistic leerzeichen latex-extra info-colors i3wm gscholar-bibtex greek-polytonic gopher go gnugo format-sql flymake-aspell flylisp flycheck-rust flycheck-perl6 flycheck-ledger flycheck-irony flycheck-grammalecte flycheck-aspell figlet ffmpeg-player feed-discovery fast-scroll exwm-firefox-evil evil-visual-replace evil-visual-mark-mode evil-vimish-fold evil-tex evil-org evil-mu4e evil-mark-replace evil-magit evil-lisp-state evil-ledger evil-leader evil-indent-textobject evil-indent-plus evil-ediff evil-commentary evil-collection evil-cleverparens evil-better-visual-line evil-args eshell-git-prompt eshell-fixed-prompt esh-autosuggest epresent empos emms-state emms-player-simple-mpv emms-mode-line-cycle emms-mark-ext emamux emacsql-mysql elpher elisp-lint elfeed-org edwina ediprolog e2wm-term dracula-theme define-word define-it company-shell company-lua company-dict company-c-headers company-bibtex company-auctex coin-ticker chess cargo calibredb bufler bluetooth bibtex-utils bibretrieve bibliothek basic-mode alarm-clock afternoon-theme academic-phrases ac-ispell abyss-theme))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Source Code Pro" :foundry "ADBO" :slant normal :weight normal :height 158 :width normal)))))

;; ledger

(autoload 'ledger-mode "ledger-mode" "A major mode for Ledger" t)
(add-to-list 'load-path
	(expand-file-name "/path/to/ledger/source/lisp/"))
(add-to-list 'auto-mode-alist '("\\.ledger$" . ledger-mode))

;; Mu4e
(require 'mu4e)
;; (require 'evil-mu4e)
(setq mu4e-get-mail-command "getmail"
    mu4e-maildir "~/mail/"
    mu4e-index-cleanup nil   ;; don't do a full cleanup check
    mu4e-index-lazy-check t ;; don't consider up-to-date dirs
    mu4e-change-filenames-when-moving t
    mu4e-update-interval (* 10 60)
    mu4e-context-policy "always-ask"
    mu4e-compose-context-policy "always-ask"
    message-send-mail-function 'smtpmail-send-it
    mu4e-compose-format-flowed t
    user-full-name "Kenneth Gardner")

;; for encrypting mml-secure-message-encrypt-pgpmime
(add-hook 'message-send-hook 'mml-secure-message-sign-pgpmime)

(setq mu4e-contexts
	  (list
		(make-mu4e-context
		  :name "canicus-canic.us"
		  :match-func 
		   (lambda (msg)
			 (when msg
			   (string-prefix-p "canicus-canic.us" (mu4e-message-field msg :maildir))))
	:vars	  '((user-mail-address . "canicus@canic.us")
			  (mu4e-sent-folder . "/canicus-canic.us/sent")
			  (mu4e-drafts-folder . "/canicus-canic.us/drafts")
			  (mu4e-trash-folder . "/canicus-canic.us/trash")
			  (mu4e-refile-folder . "/canicus-canic.us/archive")
			  (mu4e-attachment-dir . "~/downloads")
			  (smtpmail-smtp-server . "canic.us")
			  (smtpmail-smtp-user . "canicus")
			  (smtpmail-smtp-service . 465)
			  (smtpmail-stream-type . ssl)
			  (mml-secure-openpgp-signers "853EE2ED068A28B72FD377C46F6F27E95DA4BA0F")
			  ))


		(make-mu4e-context
		  :name "protonmail"
		  :match-func 
		   (lambda (msg)
			 (when msg
			   (string-prefix-p "canicus-protonmail" (mu4e-message-field msg :maildir))))
	:vars	  '((user-mail-address . "canicus@protonmail.com")
			  (mu4e-sent-folder . "/canicus-protonmail/sent")
			  (mu4e-drafts-folder . "/canicus-protonmail/drafts")
			  (mu4e-trash-folder . "/canicus-protonmail/trash")
			  (mu4e-refile-folder . "/canicus-protonmail/archive")
			  (mu4e-attachment-dir . "~/downloads")
			  (smtpmail-smtp-server . "localhost")
			  (smtpmail-smtp-user . "canicus@protonmail.com")
			  (smtpmail-smtp-service . 1025)
			  (smtpmail-stream-type . plain)
			  (mml-secure-openpgp-signers "70C043624DBE36E2B58F2013184146DC5D7B1BBC")
			  ))

		(make-mu4e-context
		  :name "yahoo"
		  :match-func 
		   (lambda (msg)
			 (when msg
			   (string-prefix-p "canicus-yahoo" (mu4e-message-field msg :maildir))))
	:vars	  '((user-mail-address . "canicus@yahoo.com")
			  (mu4e-sent-folder . "/canicus-yahoo/sent")
			  (mu4e-drafts-folder . "/canicus-yahoo/drafts")
			  (mu4e-trash-folder . "/canicus-yahoo/trash")
			  (mu4e-refile-folder . "/canicus-yahoo/archive")
			  (mu4e-attachment-dir . "~/downloads")
			  (smtpmail-smtp-server . "smtp.mail.yahoo.com")
			  (smtpmail-smtp-user . "canicus@yahoo.com")
			  (smtpmail-smtp-service . 995)
			  (smtpmail-stream-type . ssl)
			  (mml-secure-openpgp-signers "70C043624DBE36E2B58F2013184146DC5D7B1BBC")
			  ))



		(make-mu4e-context
		  :name "kainekh-canic.us"
		  :match-func 
		   (lambda (msg)
			 (when msg
			   (string-prefix-p "kainekh-canic.us" (mu4e-message-field msg :maildir))))
	:vars	  '((user-mail-address . "kainekh@canic.us")
			  (mu4e-sent-folder . "/kainekh-canic.us/sent")
			  (mu4e-drafts-folder . "/kainekh-canic.us/drafts")
			  (mu4e-trash-folder . "/kainekh-canic.us/trash")
			  (mu4e-refile-folder . "/kainekh-canic.us/archive")
			  (mu4e-attachment-dir . "~/downloads")
			  (smtpmail-smtp-server . "canic.us")
			  (smtpmail-smtp-user . "canicus")
			  (smtpmail-smtp-service . 465)
			  (smtpmail-stream-type . ssl)
			  ))))
