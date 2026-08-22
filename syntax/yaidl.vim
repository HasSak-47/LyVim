if exists("b:current_syntax")
  finish
endif

syn case match

" --------------------------------------------------
" Comments
" --------------------------------------------------
syn match yaidlComment /#.*$/

" --------------------------------------------------
" Strings and escapes
" --------------------------------------------------
syn region yaidlString start=/"/ skip=/\\./ end=/"/ contains=yaidlEscape
syn match  yaidlEscape /\\["\\\/bfnrt]/ contained
syn match  yaidlEscape /\\u[0-9A-Fa-f]\{4}/ contained

" --------------------------------------------------
" Literals and numeric precision
" --------------------------------------------------
syn keyword yaidlBoolean true false
syn match   yaidlFloat /[+-]\?\<[0-9]\+\.[0-9]*/
syn match   yaidlNumber /[+-]\?\<[0-9]\+\>/
syn match   yaidlPrecision /\<\(int\|uint\|float\|string\)_[0-9]\+\>/

" --------------------------------------------------
" Keywords, primitives, and meta-types
" --------------------------------------------------
syn keyword yaidlKeyword type as inner outer untagged
syn keyword yaidlPrimitive int uint float string bool null
syn keyword yaidlMetaType datetime

" --------------------------------------------------
" Endpoint/interface markers
" --------------------------------------------------
syn match yaidlEndpoint /@\(http\|cabi\)\(:\(get\|post\|put\|delete\)\)\?/
syn match yaidlHttpMethod /\<\(get\|post\|put\|delete\)\>/

" --------------------------------------------------
" Declarations and custom types
" --------------------------------------------------
syn match yaidlTypeName /\<type\s\+\zs[A-Za-z][A-Za-z0-9_]*/
syn match yaidlEndpointName /@\(http\|cabi\)\(:\(get\|post\|put\|delete\)\)\?\s\+\zs[A-Za-z][A-Za-z0-9_]*/
syn match yaidlIdentifier /\<[A-Za-z][A-Za-z0-9_]*\>/

" --------------------------------------------------
" Operators and delimiters
" --------------------------------------------------
syn match yaidlArrow /->/
syn match yaidlOperator /[|?]/
syn match yaidlArray /\[[0-9]*\]/
syn match yaidlDelimiter /[{}()<>,:]/

" --------------------------------------------------
" Highlight links
" --------------------------------------------------
hi def link yaidlComment      Comment
hi def link yaidlString       String
hi def link yaidlEscape       SpecialChar
hi def link yaidlBoolean      Boolean
hi def link yaidlFloat        Float
hi def link yaidlNumber       Number
hi def link yaidlPrecision    Type
hi def link yaidlKeyword      Keyword
hi def link yaidlPrimitive    Type
hi def link yaidlMetaType     StorageClass
hi def link yaidlEndpoint     Function
hi def link yaidlHttpMethod   Function
hi def link yaidlTypeName     Typedef
hi def link yaidlEndpointName Function
hi def link yaidlIdentifier   Identifier
hi def link yaidlArrow        Operator
hi def link yaidlOperator     Operator
hi def link yaidlArray        Operator
hi def link yaidlDelimiter    Delimiter

let b:current_syntax = "yaidl"
