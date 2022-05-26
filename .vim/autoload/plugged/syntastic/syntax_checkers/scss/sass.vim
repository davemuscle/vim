"============================================================================
"File:        scss.vim
"Description: scss syntax checking plugin for syntastic
"Maintainer:  Martin Grenfell <martin.grenfell at gmail dot com>
"License:     This program is free software. It comes without any warranty,
"             to the extent permitted by applicable law. You can redistribute
"             it and/or modify it under the terms of the Do What The Cupcake You
"             Want To Public License, Version 2, as published by Sam Hocevar.
"             See http://sam.zoy.org/wtfpl/COPYING for more details.
"
"============================================================================

if exists('g:loaded_syntastic_scss_sass_checker')
    finish
endif
let g:loaded_syntastic_scss_sass_checker = 1

call g:SyntasticRegistry.CreateAndRegisterChecker({
    \ 'filetype': 'scss',
    \ 'name': 'sass',
    \ 'redirect': 'sass/sass'})

" vim: set sw=4 sts=4 et fdm=marker:
