(defun el-trans()
  "Change the selection range from English to Japanese"
  (interactive)
  (setq temp_file (make-temp-file "temp")
	command (concat "el-trans " temp_file))
  (write-region (region-beginning) (region-end) temp_file)
  (setq trans_text (shell-command-to-string command))
  (setq trans_text (concat "\n" trans_text))
  (goto-char (region-end))
  (insert trans_text)
  (delete-file temp_file)
  )

(provide 'el-trans)


;; when use clip board 
;; (copy-region-as-kill (region-beginning) (region-end))
;; (setq yanked (car kill-ring))
  
