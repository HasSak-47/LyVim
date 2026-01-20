if exists("b:current_syntax")
  finish
endif

syntax keyword nbKeyword type fn return let mut trait impl pub
syntax keyword nbInclude use header mod
syntax keyword nbRepeat while for
syntax match nbPrimitive /i[0-9]+/

highlight def link nbInclude Include
highlight def link nbRepeat Repeat
highlight def link nbKeyword keyword
highlight def link nbPrimitive Type

let b:current_syntax = "niebo"

