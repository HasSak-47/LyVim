" Vim syntax file
" Language: Niebo

if exists("b:current_syntax")
  finish
endif

syn case match

" --------------------------------------------------
" Comments
" --------------------------------------------------
syn region nieboComment start="/\*" end="\*/" contains=nieboTodo
syn match  nieboComment "//.*$"
syn keyword nieboTodo TODO FIXME XXX NOTE contained

" --------------------------------------------------
" Strings
" --------------------------------------------------
syn region nieboString start=+"+ skip=+\\\\\|\\"+ end=+"+

" --------------------------------------------------
" Numbers
" --------------------------------------------------
syn match nieboFloat   "\<[0-9]\+\.[0-9]*\(f[0-9]\+\)\?\>"
syn match nieboInteger "\<[0-9]\+\([iu][0-9]\+\)\?\>"

" --------------------------------------------------
" Keywords
" --------------------------------------------------
syn keyword nieboKeyword
      \ mod fn inter let const mut
      \ pub module
      \ if else while for in loop match
      \ use import header
      \ methods extend as
      \ break continue return value

syn keyword nieboTypeKeyword
      \ struct union variant type template

syn keyword nieboBoolean true false

" --------------------------------------------------
" Primitive types
" --------------------------------------------------
syn keyword nieboType
      \ bool int uint float string void

syn match nieboType "\<i[0-9]\+\>"
syn match nieboType "\<u[0-9]\+\>"
syn match nieboType "\<float[0-9]\+\>"

" --------------------------------------------------
" Operators
" --------------------------------------------------

" Path separator
syn match nieboOperator "::"

" Arrows
syn match nieboOperator "->\|=>"

" Comparison
syn match nieboOperator "==\|!=\|<=\|>="

" Logical
syn match nieboOperator "&&\|||"

" Increment / decrement
syn match nieboOperator "++\|--"

" Compound assignment
syn match nieboOperator "[+\-*/%&|~]="

" Single-character operators
syn match nieboOperator "[=+\-*/%&|~<>!?]"

" --------------------------------------------------
" Delimiters
" --------------------------------------------------
syn match nieboDelimiter "[{}()\[\],;:]"

" --------------------------------------------------
" Intrinsics
" --------------------------------------------------
syn match nieboIntrinsic "@[A-Za-z_][A-Za-z0-9_]*"

" --------------------------------------------------
" Function definitions
" --------------------------------------------------
syn match nieboFunction "\<fn\s\+\zs[A-Za-z_][A-Za-z0-9_]*"
syn match nieboReturnType "[*&]\?\s*\<[A-Za-z_][A-Za-z0-9_:<>]*\>" contained

" --------------------------------------------------
" Type declarations
" --------------------------------------------------
syn match nieboStruct "\<struct\s\+\zs[A-Za-z_][A-Za-z0-9_]*"
syn match nieboStruct "\<union\s\+\zs[A-Za-z_][A-Za-z0-9_]*"
syn match nieboStruct "\<variant\s\+\zs[A-Za-z_][A-Za-z0-9_]*"
syn match nieboTypeDef "\<type\s\+\zs[A-Za-z_][A-Za-z0-9_]*"
syn match nieboTrait "\<inter\s\+\zs[A-Za-z_][A-Za-z0-9_]*"
syn match nieboModule "\<mod\s\+\zs[A-Za-z_][A-Za-z0-9_]*"

" --------------------------------------------------
" Paths
" --------------------------------------------------
syn match nieboPath "\<[A-Za-z_][A-Za-z0-9_]*\(::[A-Za-z_][A-Za-z0-9_<>:,]*\)\+"

" --------------------------------------------------
" Imports
" --------------------------------------------------
syn match nieboImport "\<\(import\|header\)\s\+\zs.\{-}\ze;"

" --------------------------------------------------
" Generic identifiers
" --------------------------------------------------
syn match nieboIdentifier "\<[A-Za-z_][A-Za-z0-9_]*\>"

" --------------------------------------------------
" Highlight groups
" --------------------------------------------------
hi def link nieboComment      Comment
hi def link nieboTodo         Todo

hi def link nieboString       String

hi def link nieboInteger      Number
hi def link nieboFloat        Float

hi def link nieboKeyword      Keyword
hi def link nieboTypeKeyword  Keyword
hi def link nieboBoolean      Boolean
hi def link nieboType         Type
hi def link nieboReturnType   Type

hi def link nieboOperator     Operator
hi def link nieboDelimiter    Delimiter

hi def link nieboFunction     Function
hi def link nieboStruct       Structure
hi def link nieboTypeDef      Typedef
hi def link nieboTrait        Type
hi def link nieboModule       Include

hi def link nieboIntrinsic    Special
hi def link nieboImport       Include
hi def link nieboPath         Identifier
hi def link nieboIdentifier   Identifier

let b:current_syntax = "niebo"
