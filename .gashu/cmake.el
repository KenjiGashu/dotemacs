(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs
               `(cmake-mode . ("cmake-language-server"))))
