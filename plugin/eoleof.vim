function! EOLEOFStatusline() abort
    if system('tail -n 1 ' . bufname('%') . ' | wc --lines') =~ '0'
        return '[NOEOLEOF]'
    endif
    return ''
endfunction
