function! EOLEOF(...)
    let filename = (a:0 >= 1) ? a:1 : bufname('%')
    return system('tail -n 1 ' . filename . ' | wc --lines') =~ '1'
endfunction

function! EOLEOFStatusline(...) abort
    let noeoleof = (a:0 >= 1) ? a:1 : '[NOEOLEOF]'
    let eoleof = (a:0 >= 2) ? a:2 : ''
    if EOLEOF()
        return eoleof
    endif
    return noeoleof
endfunction

function! s:EOLEOFAdd(...)
    let filename = (a:0 >= 1) ? a:1 : bufname('%')
    if !EOLEOF(filename)
        execute '!echo "" >> ' . filename
    endif
endfunction

command! -nargs=? -complete=buffer EOLEOFAdd :call s:EOLEOFAdd(<args>)

function! s:EOLEOFRemove(...)
    let filename = (a:0 >= 1) ? a:1 : bufname('%')
    if EOLEOF(filename)
        execute '!truncate --size=-1 ' . filename
    endif
endfunction

command! -nargs=? -complete=buffer EOLEOFRemove :call s:EOLEOFRemove(<args>)

function! s:EOLEOFToggle(...)
    let filename = (a:0 >= 1) ? a:1 : bufname('%')
    if EOLEOF(filename)
        execute '!truncate --size=-1 ' . filename
    else
        execute '!echo "" >> ' . filename
    endif
endfunction

command! -nargs=? -complete=buffer EOLEOFToggle :call s:EOLEOFToggle(<args>)
