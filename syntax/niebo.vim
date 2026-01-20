" Vim syntax file
" Language: Niebo

if exists("b:current_syntax")
  finish
endif

syn keyword nieboKeyword type mod fn trait let const mut pub module for in while if else loop match use header break continue return struct union variant template
syn keyword nieboType bool int uint float string void
syn keyword nieboQualifier global super crate

syn match nieboType "\v<([iu]\d+|float\d+)>"

syn match nieboNumber "\v(\d+\.\d*([f]\d+)?|\d+([iu]\d+)?)"

syn match nieboIdentifier "\v<[A-Za-z_][A-Za-z0-9_]*>"
syn match nieboPath "\v<([A-Za-z_][A-Za-z0-9_]*)(::[A-Za-z_][A-Za-z0-9_]*)+>"
syn match nieboImport "\v<(use|header)\s+([A-Za-z_][A-Za-z0-9_]*)(::[A-Za-z_][A-Za-z0-9_]*)*>"
syn match nieboFunction "\v<(fn)\s+([A-Za-z_][A-Za-z0-9_]*)>" contains=nieboKeyword
syn match nieboTypeDecl "\v<(type|struct|union|variant|trait|mod)\s+([A-Za-z_][A-Za-z0-9_]*)>" contains=nieboKeyword

syn region nieboString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=nieboEscape
syn match nieboEscape "\\\\\|\\\"\|\\n\|\\r\|\\t\|\\0\|\\x[0-9A-Fa-f]{2}\|\\u{[0-9A-Fa-f]+}"

syn region nieboComment start="/\*" end="\*/" contains=nieboTodo
syn match nieboComment "//.*$" contains=nieboTodo
syn keyword nieboTodo TODO FIXME XXX NOTE contained

syn match nieboOperator "\v(\+\+|--|==|!=|<=|>=|\|\||&&|->|=>|::|\.\.\.|\+|-|\*|/|%|=|<|>|!|\?|&|\|)"

hi def link nieboKeyword Keyword
hi def link nieboType Type
hi def link nieboQualifier PreProc
hi def link nieboNumber Number
hi def link nieboIdentifier Identifier
hi def link nieboPath Include
hi def link nieboImport PreProc
hi def link nieboFunction Function
hi def link nieboTypeDecl Type
hi def link nieboString String
hi def link nieboEscape SpecialChar
hi def link nieboComment Comment
hi def link nieboTodo Todo
hi def link nieboOperator Operator

let b:current_syntax = "niebo"
