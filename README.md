eoleof
======
Vim plugin for managing newlines at the end of a file.

Statusline
----------
Add `%{EOLEOFStatusline()}` to `statusline` to get an indicator of whether
there is no newline at the end of the current file. The function
`EOLEOFStatusline` also takes two optional arguments to customize the output to
`statusline`. The first argument (which defaults to `[NOEOLEOF]`) gives the
output when the trailing newline is missing. The second argument (which
defaults to the empty string) gives the output when the final newline is
present.

Preserve missing newline at end of file
---------------------------------------
Currently this plugin doesn't offer anything to help you here (but it
eventually will). However, you can easily fix this by adding the following to
your vimrc:

    set noeol
    set nofixeol

These options will prevent vim from adding the trailing newline on saving.
Normally you want this newline though, so you can also opt to only put it in
certain filetypes. For example, if I only wanted this behavior in html files, I
would add the following to `ftplugin/html.vim`

    setlocal noeol
    setnofixeol