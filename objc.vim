setlocal foldtext=FoldtextObjcEllipsis()

function! FoldtextObjc() " {{{
	let countline  = v:foldend + 1 - v:foldstart
	let countspace = indent(v:foldstart)
	let space = repeat(' ', countspace)

	let line = getline(v:foldstart)
	let line = space . line

	let width = 80 - len(" 123 lines")

	let foldtext = printf("%-" . width . "s %3d lines", line, countline)

	return foldtext
endfunction " }}}

function! FoldtextObjcEllipsis() " {{{
	let countline  = v:foldend + 1 - v:foldstart
	let countspace = indent(v:foldstart)
	let space = repeat('_', countspace)

	let line = getline(v:foldstart)
	let line = space . line

	let width = 80 - len("123 lines")

	if (len(line) > width)
		let ellipsis = "..."
		let line = line[:width - 1 - len(ellipsis)]
		let line = line . ellipsis
	endif

	let foldtext = printf("%-" . width . "s%3d lines", line, countline)

	return foldtext
endfunction " }}}
