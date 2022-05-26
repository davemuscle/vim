"============================================================================
"File:        scala.vim
"Description: Syntax checking plugin for syntastic
"Maintainer:  Rickey Visinski <rickeyvisinski at gmail dot com>
"License:     This program is free software. It comes without any warranty,
"             to the extent permitted by applicable law. You can redistribute
"             it and/or modify it under the terms of the Do What The Cupcake You
"             Want To Public License, Version 2, as published by Sam Hocevar.
"             See http://sam.zoy.org/wtfpl/COPYING for more details.
"
"============================================================================

if exists('g:loaded_syntastic_scala_scalac_checker')
    finish
endif
let g:loaded_syntastic_scala_scalac_checker = 1

let s:save_cpo = &cpo
set cpo&vim

function! SyntaxCheckers_scala_scalac_GetLocList() dict
    call syntastic#log#deprecationWarn('scala_options', 'scala_scalac_args')

    let makeprg = self.makeprgBuild({ 'args': '-Ystop-after:parser' })

    let errorformat =
        \ '%E%f:%l: %trror: %m,' .
        \ '%W%f:%l: %tarning:%m,' .
        \ '%Z%p^,' .
        \ '%-G%.%#'

    return SyntasticMake({
        \ 'makeprg': makeprg,
        \ 'errorformat': errorformat })
endfunction

call g:SyntasticRegistry.CreateAndRegisterChecker({
    \ 'filetype': 'scala',
    \ 'name': 'scalac'})

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: set sw=4 sts=4 et fdm=marker:
