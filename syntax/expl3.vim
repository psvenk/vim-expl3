" Vim syntax file
" Language:     expl3 (TeX)
" Maintainer:   psvenk
" Last Change:  July 15, 2020
" Version:      116-1
" URL:          https://github.com/psvenk/vim-expl3
" License:      Public Domain (CC0-1.0)

" Tested with version 116 of syntax/tex.vim
runtime! syntax/tex.vim
unlet b:current_syntax

" Match underscore and colon in macro names
syn match texStatement /\\[a-zA-Z@_:]\+/

" Suppress errors arising from underscore placement
hi link texError Default

" Fold TeX groups if syntax folding is enabled; this is useful in expl3
" where scopes are primarily delimited not by \begin{...} and \end{...}
" but by braces
" (this is based on the corresponding code in $VIMRUNTIME/syntax/tex.vim)
syn region texMatcher   matchgroup=Delimiter
	\ start="{" skip="\\\\\|\\[{}]" end="}"
	\ transparent fold
	\ contains=@texMatchGroup,texError
syn region texMatcher   matchgroup=Delimiter
	\ start="\["                    end="]"
	\ transparent fold
	\ contains=@texMatchGroup,texError,@NoSpell
syn region texMatcherNM matchgroup=Delimiter
	\ start="{" skip="\\\\\|\\[{}]" end="}"
	\ transparent fold
	\ contains=@texMatchNMGroup,texError
syn region texMatcherNM matchgroup=Delimiter
	\ start="\["                    end="]"
	\ transparent fold
	\ contains=@texMatchNMGroup,texError,@NoSpell

let b:current_syntax = "expl3"
