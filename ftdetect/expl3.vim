function! s:DetectExpl3()
	exec cursor(1, 0)
	if search('\\ProvidesExpl\(Class\|Package\|File\)', 'cn', 100)
		set filetype=expl3
	endif
endfunction
autocmd BufNewFile,BufRead *.sty,*.cls,*.clo,*.dtx,*.ltx call s:DetectExpl3()
