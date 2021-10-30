"========================"
"  Aquarium Light | Dark "
"========================"

" Palette
let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

let s:style = get(g:, 'aquarium_style', 'dark')

"--------------------"
" --| GUI COLORS |-- "
"--------------------"
if s:style ==# 'dark'
    let s:gui00 = ['#20202A', 235] " Default Background
    let s:gui01 = ['#2C2E3E', 237] " Lighter Background (Used for status bars, line number and folding marks)
    let s:gui02 = ['#A7B7D6', 252] " Selection Background
    let s:gui03 = ['#3D4059', 238] " Comments, Invisibles, Line Highlighting
    let s:gui04 = ['#C6D0E9', 254] " Dark Foreground (Used for status bars)
    let s:gui05 = ['#63718B', 179] " Default Foreground, Caret, Delimiters, Operators
    let s:gui06 = ['#313449', 107] " Light Foreground (Not often used)
    let s:gui07 = ['#1A1A24', 234] " Light Background (Not often used)
    let s:gui08 = ['#EBB9B9', 217] " Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted (red)
    let s:gui09 = ['#E8CCA7', 222] " Integers, Boolean, Constants, XML Attributes, Markup Link Url (orange)
    let s:gui0A = ['#E6DFB8', 229] " Classes, Markup Bold, Search Text Background (yellow)
    let s:gui0B = ['#B1DBA4', 114] " Strings, Inherited Class, Markup Code, Diff Inserted (green)
    let s:gui0C = ['#B8DCEB', 117] " Support, Regular Expressions, Escape Characters, Markup Quotes (cyan)
    let s:gui0D = ['#A3B8EF', 111] " Functions, Methods, Attribute IDs, Headings (blue)
    let s:gui0E = ['#F6BBE7', 219] " Keywords, Storage, Selector, Markup Italic, Diff Changed (magenta)
    let s:gui0F = ['#EAC1C1', 210] " Deprecated, Opening/Closing Embedded Language Tags, e.g. `<?php ?>` (pink)
elseif s:style ==# 'light'
    let s:gui00 = ['#E6E6F1', 254]
    let s:gui01 = ['#D5D4E0', 253]
    let s:gui02 = ['#E1E1EC', 255]
    let s:gui03 = ['#CCCBD9', 195]
    let s:gui04 = ['#7F8E9D', 246]
    let s:gui05 = ['#708190', 243]
    let s:gui06 = ['#9CA6B9', 248]
    let s:gui07 = ['#D7D7E2', 252]
    let s:gui08 = ['#C34864', 197]
    let s:gui09 = ['#D66652', 202]
    let s:gui0A = ['#DE956F', 172]
    let s:gui0B = ['#7D9685', 65]
    let s:gui0C = ['#829FB0', 67]
    let s:gui0D = ['#6A8CBC', 105]
    let s:gui0E = ['#8787BF', 98]
    let s:gui0F = ['#E06B6B', 100]
endif

"---------------------"
" --| NORMAL MODE |-- "
"---------------------"
let s:p.normal.middle = [ [ s:gui04, s:gui01 ] ]
let s:p.normal.left = [ [ s:gui00, s:gui0D ], [ s:gui04, s:gui06 ] ]
let s:p.normal.right = [ [ s:gui00, s:gui0D ], [ s:gui04, s:gui06 ] ]

"---------------------"
" --| INSERT MODE |-- "
"---------------------"
let s:p.insert.middle = [ [ s:gui04, s:gui01 ] ]
let s:p.insert.left = [ [ s:gui00, s:gui0B ], [ s:gui04, s:gui06 ] ]
let s:p.insert.right = [ [ s:gui00, s:gui0B ], [ s:gui04, s:gui06 ] ]

"---------------------"
" --| VISUAL MODE |-- "
"---------------------"
let s:p.visual.middle = [ [ s:gui04, s:gui01 ] ]
let s:p.visual.left = [ [ s:gui00, s:gui0E ], [ s:gui04, s:gui06 ] ]
let s:p.visual.right = [ [ s:gui00, s:gui0E ], [ s:gui04, s:gui06 ] ]

"----------------------"
" --| REPLACE MODE |-- "
"----------------------"
let s:p.replace.middle = [ [ s:gui04, s:gui01 ] ]
let s:p.replace.left = [ [ s:gui00, s:gui0C ], [ s:gui04, s:gui06 ] ]
let s:p.replace.right = [ [ s:gui00, s:gui0C ], [ s:gui04, s:gui06 ] ]

"-----------------------"
" --| INACTIVE MODE |-- "
"-----------------------"
let s:p.inactive.middle = [ [ s:gui04, s:gui01 ] ]
let s:p.inactive.left = [ [ s:gui04, s:gui06 ], [ s:gui04, s:gui06 ] ]
let s:p.inactive.right = [ [ s:gui04, s:gui06 ], [ s:gui04, s:gui06 ] ]

"----------------------"
" --| TABLINE MODE |-- "
"----------------------"
let s:p.tabline.left = [ [ s:gui04, s:gui06 ] ]
let s:p.tabline.right = [ [ s:gui08, s:gui06 ] ]
let s:p.tabline.tabsel = [ [ s:gui00, s:gui08 ] ]
let s:p.tabline.middle = [ [ s:gui04, s:gui01 ] ]

"--------------------"
" --| ERROR MODE |-- "
"--------------------"
let s:p.normal.error = [ [ s:gui00, s:gui0F ] ]
let s:p.normal.warning = [ [ s:gui00, s:gui0A ] ]

let g:lightline#colorscheme#aquarium#palette = lightline#colorscheme#flatten(s:p)
et g:lightline#colorscheme#aquarium#palette = lightline#colorscheme#flatten(s:p)
