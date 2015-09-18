let s:save_cpo = &cpo
set cpo&vim

let s:source = {
\ 'name'        : 'i18n',
\ 'rank'        : 200,
\ 'kind'        : 'manual',
\ 'is_volatile' : 1,
\ 'disabled'    : !g:i18n_complete_enable_neocomplete,
\ 'filetypes' : { 'ruby' : 1, 'eruby' : 1},
\ }

function! s:source.get_complete_posision(context)
  return strrindx(a:context.input[ : col('.')- ], '.')
endfunction

function! s:source.gather_candidates(context)
  return [
        \ {
        \  "word" : "word example",
        \  "abbr" : "abbr example",
        \  "menu" : "[i18n translate]"
        \ }
        \ ]
  " return i18n_complete#translate#candidates()
endfunction

function! neocomplete#sources#i18n#define()
    return s:source
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
