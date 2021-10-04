" Base 16 Aquarium Light

let s:scheme_slug = substitute("aquarium_light", "-", "_", "g")
let g:airline#themes#base16_{s:scheme_slug}#palette = {}

"--------------------"
" --| GUI COLORS |-- "
"--------------------"
let s:gui00 = '#E6E6F1' " Default Background
let s:gui01 = '#D5D4E0' " Lighter Background (Used for status bars, line number and folding marks)
let s:gui02 = '#3D4059' " Selection Background
let s:gui03 = '#CCCBD9' " Comments, Invisibles, Line Highlighting
let s:gui04 = '#7F8E9D' " Dark Foreground (Used for status bars)
let s:gui05 = '#708190' " Default Foreground, Caret, Delimiters, Operators
let s:gui06 = '#9CA6B9' " Light Foreground (Not often used)
let s:gui07 = '#D9DBE6' " Light Background (Not often used)
let s:gui08 = '#C34864' " Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted (red)
let s:gui09 = '#D66652' " Integers, Boolean, Constants, XML Attributes, Markup Link Url (orange)
let s:gui0A = '#DE956F' " Classes, Markup Bold, Search Text Background (yellow)
let s:gui0B = '#7D9685' " Strings, Inherited Class, Markup Code, Diff Inserted (green)
let s:gui0C = '#829FB0' " Support, Regular Expressions, Escape Characters, Markup Quotes (cyan)
let s:gui0D = '#6A8CBC' " Functions, Methods, Attribute IDs, Headings (blue)
let s:gui0E = '#8787BF' " Keywords, Storage, Selector, Markup Italic, Diff Changed (magenta)
let s:gui0F = '#E06B6B' " Deprecated, Opening/Closing Embedded Language Tags, e.g. `<?php ?>` (pink)

"---------------------"
" --| TERM COLORS |-- "
"---------------------"
let s:cterm00        = "00"
let s:cterm03        = "08"
let s:cterm05        = "07"
let s:cterm07        = "15"
let s:cterm08        = "01"
let s:cterm0A        = "03"
let s:cterm0B        = "02"
let s:cterm0C        = "06"
let s:cterm0D        = "04"
let s:cterm0E        = "05"
if exists("base16colorspace") && base16colorspace == "256"
	let s:cterm01        = "18"
	let s:cterm02        = "19"
	let s:cterm04        = "20"
	let s:cterm06        = "21"
	let s:cterm09        = "16"
	let s:cterm0F        = "17"
else
	let s:cterm01        = "10"
	let s:cterm02        = "11"
	let s:cterm04        = "12"
	let s:cterm06        = "13"
	let s:cterm09        = "09"
	let s:cterm0F        = "14"
endif

"---------------------"
" --| NORMAL MODE |-- "
"---------------------"
let g:airline#themes#base16_{s:scheme_slug}#palette.normal = airline#themes#generate_color_map (
	\ [ s:gui01, s:gui04, s:cterm01, s:cterm04 ],
	\ [ s:gui04, s:gui02, s:cterm04, s:cterm02 ],
	\ [ s:gui04, s:gui01, s:cterm04, s:cterm01 ])
let g:airline#themes#base16_{s:scheme_slug}#palette.normal_modified = {
	\ 'airline_c' : [ s:gui0C, s:gui01, s:cterm07, s:cterm01 ]}

"---------------------"
" --| INSERT MODE |-- "
"---------------------"
let g:airline#themes#base16_{s:scheme_slug}#palette.insert = airline#themes#generate_color_map (
	\ [ s:gui01, s:gui0B, s:cterm01, s:cterm0B ],
	\ [ s:gui04, s:gui02, s:cterm04, s:cterm02 ],
	\ [ s:gui04, s:gui01, s:cterm04, s:cterm01 ])
let g:airline#themes#base16_{s:scheme_slug}#palette.insert_modified = {
	\ 'airline_c' : [ s:gui0C, s:gui01, s:cterm07, s:cterm01 ]}

"-----------------------"
" --| REPLEACE MODE |-- "
"-----------------------"
let g:airline#themes#base16_{s:scheme_slug}#palette.replace = airline#themes#generate_color_map (
	\ [ s:gui01, s:gui0E, s:cterm01, s:cterm0E ],
	\ [ s:gui04, s:gui02, s:cterm04, s:cterm02 ],
	\ [ s:gui04, s:gui01, s:cterm04, s:cterm01 ])
let g:airline#themes#base16_{s:scheme_slug}#palette.replace_modified = {
	\ 'airline_c' : [ s:gui0C, s:gui01, s:cterm07, s:cterm01 ]}

"---------------------"
" --| VISUAL MODE |-- "
"---------------------"
let g:airline#themes#base16_{s:scheme_slug}#palette.visual = airline#themes#generate_color_map (
	\ [ s:gui01, s:gui0D, s:cterm01, s:cterm0D ],
	\ [ s:gui04, s:gui02, s:cterm04, s:cterm02 ],
	\ [ s:gui04, s:gui01, s:cterm04, s:cterm01 ])
let g:airline#themes#base16_{s:scheme_slug}#palette.visual_modified = {
	\ 'airline_c' : [ s:gui0C, s:gui01, s:cterm07, s:cterm01 ]}

"-----------------------"
" --| INACTIVE MODE |-- "
"-----------------------"
let g:airline#themes#base16_{s:scheme_slug}#palette.inactive = airline#themes#generate_color_map (
	\ [ s:gui01, s:gui01, s:cterm01, s:cterm01 ],
	\ [ s:gui04, s:gui01, s:cterm04, s:cterm01 ],
	\ [ s:gui05, s:gui01, s:cterm05, s:cterm01 ])

