if exists("b:current_syntax")
  finish
endif

" ---------------------------------------
" Keywords and operations
" ---------------------------------------
syntax keyword gdslKeyword model enum as null
syntax match   gdslOperation /\<\(get\|post\|put\)\>/
syntax match   gdslOperationMark /@[a-zA-Z_]\+/
syntax match   gdslArrow /->/

" ---------------------------------------
" Delimiters and punctuation
" ---------------------------------------
syntax match   gdslBrace /[{}()]/
syntax match   gdslComma /,/
syntax match   gdslColon /:/
syntax match   gdslOptionMark /\\?/
syntax match   gdslArrayMark /\[[0-9]*\]/

" ---------------------------------------
" Strings and escapes
" ---------------------------------------
syntax region  gdslString start=/"/ skip=/\\./ end=/"/ contains=gdslEscape
syntax match   gdslEscape /\\["\\\/bfnrt]/
syntax match   gdslEscape /\\u[0-9A-Fa-f]\{4\}/

" ---------------------------------------
" Types and identifiers
" ---------------------------------------
syntax keyword gdslPrimitive int uint float string bool
syntax keyword gdslRepr datetime
syntax match   gdslComplexType /\<[A-Za-z_][A-Za-z0-9_]*\>/
syntax match   gdslPrec /\<[0-9]\+\>/

" ---------------------------------------
" Comments
" ---------------------------------------
syntax match   gdslComment /#.*$/

" ---------------------------------------
" Highlight links
" ---------------------------------------
highlight def link gdslKeyword Keyword
highlight def link gdslOperation Function
highlight def link gdslOperationMark Function
highlight def link gdslArrow Operator
highlight def link gdslBrace Delimiter
highlight def link gdslComma Delimiter
highlight def link gdslColon Delimiter
highlight def link gdslOptionMark Operator
highlight def link gdslArrayMark Operator
highlight def link gdslString String
highlight def link gdslEscape SpecialChar
highlight def link gdslPrimitive Type
highlight def link gdslRepr Type
highlight def link gdslComplexType Identifier
highlight def link gdslPrec Number
highlight def link gdslComment Comment

let b:current_syntax = "gdsl"
