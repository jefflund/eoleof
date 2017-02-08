function! EOLEOFStatusline(...) abort
    let noeoleof = (a:0 >= 1) ? a:1 : '[NOEOLEOF]'
    let eoleof = (a:0 >= 2) ? a:2 : ''
    if system('tail -n 1 ' . bufname('%') . ' | wc --lines') =~ '0'
        return noeoleof
    endif
    return eoleof
endfunction
