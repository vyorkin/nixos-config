(require 'init-general)
(require 'init-navigation)

(use-package ssh-config-mode
  :mode (("/\\.ssh/config\\'" . ssh-config-mode)
         ("/sshd?_config\\'" . ssh-config-mode)
         ("/known_hosts\\'" . ssh-known-hosts-mode)
         ("/authorized_keys2?\\'" . ssh-authorized-keys-mode))
  :hook
  (ssh-config-mode . turn-on-font-lock))

(use-package tramp
  :ensure nil
  :custom
  ;; faster than scp
  (tramp-default-method "ssh")
  ;; disable autosave for tramp buffers
  (tramp-auto-save-directory "/tmp")
  (tramp-default-proxies-alist nil))

(use-package counsel-tramp
  :requires (init-general init-navigation)
  :after (counsel tramp general)
  :config
  (nmap
    "C-x t" 'counsel-tramp
    "C-x T" 'counsel-tramp-quit))

(use-package docker-tramp
  :after tramp)

(use-package vagrant-tramp
  :after tramp)

(use-package recentf-remove-sudo-tramp-prefix
  :after tramp
  :diminish recentf-remove-sudo-tramp-prefix-mode)

(use-package auto-sudoedit
  :after tramp
  :config
  (auto-sudoedit-mode 1)
  :diminish auto-sudoedit-mode)

(use-package kubernetes-tramp
  :after tramp)

(provide 'init-ssh)
