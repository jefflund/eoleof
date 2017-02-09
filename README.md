EOLEOF
======
Vim plugin for managing newlines at the end of a file. Normally, you want your
text files to end with a newline. This is because posix defines a line as

A sequence of zero or more non-<newline> characters plus a terminating <newline> character.

Consequently, if your file doesn't end with newline, it ends with something
other than a line! Normally, the only side effect is wonky output from things
like `cat`, but some compilers respect the posix standard and so it is pretty
much always a good idea to end files with a newline. This is why Vim defaults
to this behavior.

However, sometimes this just isn't what you want. For example, if one file
serves as a template which will get embedded into another file, that trailing
newline may be problematic! This plugin will help you keep things straight in
the incredibly rare times when you need the default behavior around end of file
newlines changed.

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
Currently this plugin doesn't offer anything to help you here. However, you can
easily fix this by adding the following to your vimrc:

    set nofixeol

These options will prevent vim from adding the trailing newline on saving if it
is missing.  Normally you want this newline though, so you can also opt to only
put it in certain filetypes. For example, if I only wanted this behavior in
html files, I would add the following to `ftplugin/html.vim`

    setlocal nofixeol

Adding/Removing newline from end of file
---------------------------------
EOLEOF provides three commands to help you manage the newline at the end of
files. `EOLEOFAdd` will add in a trailing newline if it is not present.
`EOLEOFRemove` will remove the newline if it is present. Finally,
`EOLEOFToggle` will toggle the newline. All of these functions will give a
warning indicating that the file changed so that you know what is going on.
