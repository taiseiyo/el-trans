(defun el-trans-main()
  (write-region (region-beginning) (region-end) temp_file)
  (setq trans_text (shell-command-to-string command))
  (setq trans_text (concat "\n" trans_text))
  (goto-char (region-end))
  (insert trans_text)
  (delete-file temp_file)
  )
  
(defun el-trans-en2jp()
  "Change the selection range from English to Japanese"
  (interactive)
  (setq temp_file (make-temp-file "temp")
	command (concat "python3 " (getenv "HOME") "/bin/el-trans " temp_file " -at JA"))
  (el-trans-main)
  )

(defun el-trans-jp2en()
  "Change the selection range from Japanese to English"
  (interactive)
  (setq temp_file (make-temp-file "temp")
	command (concat "python3 " (getenv "HOME") "/bin/el-trans " temp_file " -at EN-US"))
	
  (el-trans-main)
  )

(provide 'el-trans)


;; when use clip board 
;; (copy-region-as-kill (region-beginning) (region-end))
;; (setq yanked (car kill-ring))
  
