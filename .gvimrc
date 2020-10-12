"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" _gvimrc
"
" Callum France
"
" Rename file to '.gvimrc' in non-Windows OS
" (Instead of '_gvimrc')
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("gui_running")
	"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	" => Window Options
	"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	set guioptions-=T
	set guioptions-=m
	set guioptions-=r
	set guioptions-=l
	set guioptions+=a
	set guioptions+=A
	set guioptions+=c
		" T - (hide) toolbar
		" m - (hide) menubar
		" r - (hide) right hand scrollbar
		" l - (hide) left hand scrollbar
		" a - visual mode highlighted text can be pasted
		" A - like 'a' but for modeless selection
		" c - console dialogs instead of popups
		" e - abb tab pages 

	" automatically resizes splits when resizing window
	autocmd VimResized * wincmd = 

	" fullscreen options
	" set fuoptions=maxvert, maxhorz
		" set lines to max number of lines able to fit on screen
		" set columns to max number of columns able to fit on screen

	"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	" => Font and Cursor
	"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	set guifont=Hack:h10 				" font and font size

	set guicursor+=n-v-c:blinkon0		" cursor doesn't blink

	
	"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	" => Show() function
	"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	" hide gvim ugly UI mode
	let g:show_uglies = 0
	function! Show(show_uglies)
		if a:show_uglies != 0 		" :call Show(1)
			set guioptions+=m
			set guioptions+=T
			set guioptions+=r
			set norelativenumber
			echo a:show_uglies
		else 						" :call Show(0)
			set guioptions-=m
			set guioptions-=T
			set guioptions-=r
			echo a:show_uglies
		endif
	endfunction
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => MacVim settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("gui_macvim")
	winpos 740 0
	" Hack looks gross for some reason
	set guifont=Monaco:h13
	set guicursor+=n-v-c:blinkon0		" cursor doesn't blink
endif
