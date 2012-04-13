; On MacOS use this path
 (if (string-equal "darwin" (symbol-name system-type))
         (setenv "PATH" (concat "/opt/local/bin:/opt/local/sbin:" (getenv "PATH"))))

