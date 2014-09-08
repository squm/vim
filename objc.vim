setlocal foldtext=FoldtextObjcEllipsis()

function! FoldtextObjc() " {{{
	let line = getline(v:foldstart)
	let countline  = v:foldend + 1 - v:foldstart
	let countspace = indent(v:foldstart)

	if countspace > 1
		let countspace = countspace - v:foldlevel + 1
	endif

	let space = repeat(' ', countspace)

	let width = 80 - len("123 lines")

	let diff = eval(width - countspace)
	let foldtext = printf("%s%-" . diff . "s%3d lines", space, line, countline)

	return foldtext
endfunction " }}}

function! FoldtextObjcEllipsis() " {{{
	let line = getline(v:foldstart)
	let countline  = v:foldend + 1 - v:foldstart
	let countspace = indent(v:foldstart)

	if countspace > 1
		let countspace = countspace - v:foldlevel + 1
	endif

	let space = repeat(' ', countspace)

	let width = 80 - len("123 lines")

	if (len(line) > width)
		let ellipsis = "..."
		let line = line[:width - 1 - len(ellipsis)]
		let line = line . ellipsis
	endif

	let diff = eval(width - countspace)
	let foldtext = printf("%s%-" . diff . "s%3d lines", space, line, countline)

	return foldtext
endfunction " }}}
