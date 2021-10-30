" Aquarium Theme
" Name:       aquarium-vim
" Maintainer: https://github.com/frenzyexists/aquarium-vim/
" License: The MIT License (MIT)

highlight clear

if version > 580
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif

" --| C O N F I G U R A T I O N |--
" Background, stuff
set background=dark

" Naming
let colors_name = "aquarium"
let s:aquarium_vim_version="0.3.2"

" Options
let s:configuration = {}
let s:configuration.style = get(g:, 'aquarium_style', 'dark')

" Trigger bold
if !exists("g:aqua_bold")
  let g:aqua_bold = 1
endif

let s:bold = "bold,"
if g:aqua_bold == 0
  let s:bold = ""
endif

"+-+-+-+-+-+-+-+-+-+-+-+-+-+
"+----- Color Thingy ------+
"+-+-+-+-+-+-+-+-+-+-+-+-+-+

if s:configuration.style ==# 'dark'

    " BASE BG
    let s:gui00     = "#20202A"
    let s:gui01     = "#2C2E3E"
    let s:gui02     = "#A7B7D6"
    let s:gui03     = "#3D4059"

    " BASE FG
    let s:gui04     = "#C6D0E9"
    let s:gui05     = "#63718B"

    let s:gui06     = "#313449"
    let s:gui07     = "#1A1A24"

    " OTHER COLORS
    let s:gui08     = "#EBB9B9"
    let s:gui09     = "#E8CCA7"
    let s:gui0A     = "#E6DFB8"
    let s:gui0B     = "#B1DBA4"
    let s:gui0C     = "#B8DEEB"
    let s:gui0D     = "#CDDBF9"
    let s:gui0E     = "#F6BBE7"
    let s:gui0F     = "#EAC1C1"

    " OTHER
    let s:linenr_bg = s:gui07
    let s:linenr_fg = s:gui02
    let s:cursor_bg = s:gui02

elseif s:configuration.style ==# 'light'

    " BASE BG
    " Old BG -> #E6E6F1 #E1E3F2
    let s:gui00     = "#E6E6F1"
    let s:gui01     = "#D5D4E0"
    let s:gui02     = "#E1E1EC"
    let s:gui03     = "#CCCBD9"
    let s:gui06     = "#9CA6B9"
    let s:gui07     = "#D7D7E2"

    " BASE FG
    let s:gui04     = "#7F8E9D"
    let s:gui05     = "#708190"

    " OTHER COLORS
    let s:gui08     = "#C34864"
    let s:gui09     = "#D66652"
    let s:gui0A     = "#DE956F"
    let s:gui0B     = "#7D9685"
    let s:gui0C     = "#829FB0"
    let s:gui0D     = "#6A8CBC"
    let s:gui0E     = "#8787BF"
    let s:gui0F     = "#E06B6B"

    " OTHER
    let s:linenr_bg = s:gui01
    let s:linenr_fg = "#414560"
    let s:cursor_bg = "#AFB5C6"
endif

" Focused line toggle
if !exists("g:aqua_line")
    let g:aqua_line = 0
endif

let s:line = "NONE"
if g:aqua_line == 1
    let s:line = s:gui07
endif

" Focused line Number toggle
if !exists("g:aqua_linenr")
    let g:aqua_linenr = 0
endif

if g:aqua_linenr == 0
    let s:linenr_bg = ""
endif

" Transparency thingy
if !exists("g:aqua_transparency")
    let g:aqua_transparency = 0
endif

if g:aqua_transparency == 0
    let s:normal = s:gui00
    let s:buff = s:gui00
    let s:fold_col = s:gui00
    let s:sign_col = s:gui00
    let s:folded = s:gui07
elseif g:aqua_transparency == 1
    let s:normal = "NONE"
    let s:buff = "NONE"
    let s:folded = "NONE"
    let s:fold_col = "NONE"
    let s:sign_col = "NONE"
endif


" Function Loader thingy
function! s:hi(group, guifg, guibg, ctermfg, ctermbg, attr, guisp)
  if a:guifg != ""
    exec "hi " . a:group . " guifg=" . a:guifg
  endif
  if a:guibg != ""
    exec "hi " . a:group . " guibg=" . a:guibg
  endif
  if a:ctermfg != ""
    exec "hi " . a:group . " ctermfg=" . a:ctermfg
  endif
  if a:ctermbg != ""
    exec "hi " . a:group . " ctermbg=" . a:ctermbg
  endif
  if a:attr != ""
    exec "hi " . a:group . " gui=" . a:attr . " cterm=" . substitute(a:attr, "undercurl", "underline,", "")
  endif
  if a:guisp != ""
    exec "hi " . a:group . " guisp=" . a:guisp
  endif
endfunction


"+-+-+-+-+-+-+-+-+-+-+
"+--- Attributes ----+
"+-+-+-+-+-+-+-+-+-+-+
call s:hi("Bold", "", "", "", "", s:bold, "")
call s:hi("Italic", "", "", "", "", "italic", "")
call s:hi("Underline", "", "", "", "", "underline", "")


"+-+-+-+-+-+-+-+-+-+-+
"+----- Editor ------+
"+-+-+-+-+-+-+-+-+-+-+
call s:hi("Normal", s:gui05, s:normal, "NONE", "NONE", "", "")
call s:hi("Error", s:gui08, s:gui01, "", "", "italic", "")
call s:hi("Search", s:gui0A, s:gui02, "", "", "", "") " Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
call s:hi("MatchParen", s:gui0C, s:gui02, "", "", "", "")
call s:hi("NonText", s:gui05, s:gui02, "", "", "", "")
call s:hi("Special", s:gui0A, "", "", "", "italic", "")
call s:hi("SpecialKey", s:gui02, "", "", "", "", "")
call s:hi("Conceal", "", s:gui03, "", "NONE", "", "") " placeholder characters substituted for concealed text (see 'conceallevel')
call s:hi("IncSearch", s:gui0E, s:gui01, "NONE", "NONE", "", "")

" Comments and Such
call s:hi("Comment", s:gui03, "", "", "", "italic", "")
call s:hi("SpecialComment", s:gui02, "", "", "", "italic", "")

" Pmenu
call s:hi("Pmenu", s:gui05, s:gui01, "", "", "", "")
call s:hi("PmenuSbar",  s:gui05, s:gui01, "", "", "", "")
call s:hi("PmenuSel", s:gui0C, s:gui01, "", "", "", "")
call s:hi("PmenuThumb", s:gui0C, s:gui01, "", "", "", "")

" Columns
call s:hi("SignColumn", s:gui0D, s:sign_col, "NONE", "", "", "")
call s:hi("ColorColumn", "", s:gui01, "NONE", "", "", "")
call s:hi("CursorColumn", s:gui0C, "", "NONE", "", "", "")

" Folding
call s:hi("FoldColumn", s:gui06, s:gui01, "NONE", "", "", "")
call s:hi("Folded", s:gui02, s:folded, "NONE", "", "", "")

" Cursor
call s:hi("Cursor", s:cursor_bg, s:gui06, "NONE", "NONE", "", "") " Regular Cursor thing
call s:hi("CursorIM", s:gui02, s:gui06, "", "NONE", "", "") " like Cursor, but used when in IME mode
call s:hi("iCursor", s:cursor_bg, s:gui06, "", "NONE", "", "")

" Line Stuff 
call s:hi("LineNr", s:gui03, s:gui00, "", "", "bold", "") " The Number Columns
call s:hi("CursorLine", "", s:line, "NONE", "", "NONE", "") " Changes the color focused line where the cursor is
call s:hi("CursorLineNr", s:linenr_fg, s:linenr_bg, "NONE", "", "NONE", "") " Changes the color focused column number where the cursor is

"+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
"+-- Lang Specifics aka Fallbacks ---+
"+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
call s:hi("PreProc", s:gui0E, "", "", "", "", "")
call s:hi("Todo", s:gui0E, s:gui02, "", "", s:bold, "") " anything that needs extra attention; mostly the keywords TODO FIXME and XXX
call s:hi("Boolean", s:gui09, "", "", "", "", "") " a boolean constant: TRUE, false
call s:hi("Type", s:gui0A, "", "", "", "italic", "" ) " int, long, char, etc.
call s:hi("Function", s:gui0C, "", "", "", "italic", "") " a floating point constant: 2.3e10
call s:hi("Include", s:gui0D, "", "", "", "", "" ) " preprocessor #include
call s:hi("Statement", s:gui0D, "", "", "", "", "" ) " any statement
call s:hi("Conditional", s:gui0C, "", "", "", "", "") " if, then, else, endif, switch, etc.
call s:hi("Repeat", s:gui0A, "", "", "", "", "") " for, do, while, etc.
call s:hi("Label", s:gui0A,"", "", "", "", "") " case, default, etc.
call s:hi("String", s:gui0B, "", "", "", "", "") " a string constant: 'this is a string'
call s:hi("Character", s:gui0B, "", "", "", "", "") " a character constant: 'c', '\n'
call s:hi("StorageClass", s:gui0A, "", "", "", "", "") " static, register, volatile, etc.
call s:hi("Operator", s:gui08, "", "", "", s:bold, "") " sizeof, '+', '*', etc.
call s:hi("Number", s:gui09, "", "", "", "", "") " a number constant: 234, 0xff
call s:hi("Float", s:gui08, "", "", "", "", "") " a floating point constant: 2.3e10
call s:hi("Structure", s:gui0A, "", "", "", "", "" ) " struct, union, enum, etc.
call s:hi("Typedef", s:gui0A, "", "", "", "", "") " A typedef
call s:hi("Special", s:gui0D, "", "", "", "", "") " any special symbol
call s:hi("SpecialChar", s:gui01, "", "", "", "", "") " special character in a constant
call s:hi("Decorator", s:gui0E, "", "", "", "", "")
call s:hi("Tag", s:gui0A, "", "", "", "", "") " you can use CTRL-] on this
call s:hi("Delimiter", s:gui0D, "", "", "", s:bold, "") " character that needs attention, parenthesis for example
call s:hi("Macro", s:gui0E, "", "", "", "", "") " same as Define
call s:hi("Exception", s:gui0E, "", "", "", "", "") " try, catch, throw
call s:hi("Delimiter", "", "", "", "", "", "") " character that needs attention
call s:hi("Keyword", s:gui08, "", "", "", "italic", "") " any other keyword
call s:hi("Debug", "", "", "", "", "", "") " debugging statements
call s:hi("Underlined", "", "", "", "", "underline", "") " text that stands out, HTML links
call s:hi("Identifier", s:gui08, "", "", "", "", "") " any variable name
call s:hi("Constant", s:gui0E, "", "", "", "italic", "")
call s:hi("WildMenu", s:gui0D, s:gui01, "", "", "", "")
hi! link PreCondit PreProc
hi! link Annotation Decorator
hi! link Variable Identifier


"+-+-+-+-+-+-+-+-+-+-+-+-+
"+--- Window Highlight --+
"+-+-+-+-+-+-+-+-+-+-+-+-+
call s:hi("VertSplit", s:gui01, s:gui00, "", "NONE", s:bold, "")
call s:hi("StatusLine", s:gui00, s:gui00, "", "", "", "") " status line of current window
call s:hi("StatusLineNC", s:gui01, s:gui00, "", "", "underline", "") "status lines of not-current windows Note: if this is equal to 'StatusLine' Vim will use '^^^' in the status line of the current window.
call s:hi("StatusLineTerm", s:gui05, s:gui00, "", "", "", "" ) " status line of current :terminal window
call s:hi("StatusLineTermNC", s:gui06, s:gui00, "", "", "underline", "") " status line of non-current :terminal window


"+-+-+-+-+-+-+-+-+-+-+-+-+
"+--- Ascii Hightlight --+
"+-+-+-+-+-+-+-+-+-+-+-+-+
call s:hi("asciidocAttributeEntry", s:gui0D, "", "", "", "", "")
call s:hi("asciidocAttributeList", s:gui0D, "", "", "", "", "")
call s:hi("asciidocAttributeRef", s:gui0D, "", "", "", "", "")
call s:hi("asciidocHLabel", s:gui0E, "", "", "", "", "" )
call s:hi("asciidocListingBlock", s:gui0A, "", "", "", "", "")
call s:hi("asciidocMacroAttributes", s:gui0C, "", "", "", "", "")
call s:hi("asciidocOneLineTitle", s:gui0C, "", "", "", "", "")
call s:hi("asciidocPassthroughBlock", s:gui0E, "", "", "", "", "")
call s:hi("asciidocQuotedMonospaced", s:gui0C, "", "", "", "", "")
call s:hi("asciidocTriplePlusPassthrough", s:gui0A, "", "", "", "", "")
hi! link asciidocAdmonition Keyword
hi! link asciidocAttributeRef markdownH1
hi! link asciidocBackslash Keyword
hi! link asciidocMacro Keyword
hi! link asciidocQuotedBold Bold
hi! link asciidocQuotedEmphasized Italic
hi! link asciidocQuotedMonospaced2 asciidocQuotedMonospaced
hi! link asciidocQuotedUnconstrainedBold asciidocQuotedBold
hi! link asciidocQuotedUnconstrainedEmphasized asciidocQuotedEmphasized
hi! link asciidocURL markdownLinkText


"+-+-+-+-+-+-+-+-+-+-+-+
"+--- Prompt/Status ---+
"+-+-+-+-+-+-+-+-+-+-+-+
call s:hi("EndOfBuffer", s:buff, "", "", "", "", "")
call s:hi("ErrorMsg", s:gui08, s:gui00, "", "", "italic", "")
call s:hi("ModeMsg", s:gui05, "", "", "", "", "")
call s:hi("MoreMsg", s:gui0C, s:gui02, "", "", "", "")
call s:hi("Question", s:gui05, "", "NONE", "", "", "")


"+-+-+-+-+-+-+-+-+-+-+-+-+
"+--- Cmake Hightlight --+
"+-+-+-+-+-+-+-+-+-+-+-+-+
call s:hi("cmakeGeneratorExpression", s:gui0D, "", "", "", "italic", "")


"+-+-+-+-+-+-+-+-+-+-+-+
"+- Neovim Support -+
"+-+-+-+-+-+-+-+-+-+-+-+
call s:hi("healthError", s:gui08, s:gui01, "", "", "", "")
call s:hi("healthSuccess", s:gui0B, s:gui01, "", "", "", "")
call s:hi("healthWarning", s:gui0A, s:gui01, "", "", "", "")


"+-+-+-+-+-+-+-+-+-+-+
"+-- Awk Highlight --+
"+-+-+-+-+-+-+-+-+-+-+
call s:hi("awkCharClass", s:gui0A, "", "", "", "italic", "")
call s:hi("awkPatterns", s:gui0C,  "", "", "", "italic", "")
hi! link awkArrayElement Identifier
hi! link awkBoolLogic Keyword
hi! link awkBrktRegExp SpecialChar
hi! link awkComma Delimiter
hi! link awkExpression Keyword
hi! link awkFieldVars Identifier
hi! link awkLineSkip Keyword
hi! link awkOperator Operator
hi! link awkRegExp SpecialChar
hi! link awkSearch Keyword
hi! link awkSemicolon Delimiter
hi! link awkSpecialCharacter SpecialChar
hi! link awkSpecialPrintf SpecialChar
hi! link awkVariables Identifier


"+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
"+-- Spell Check Highlight --+
"+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
" Word that is not recognized by the spellchecker. This will be combined with the highlighting used otherwise.
call s:hi("SpellBad", s:gui08, s:gui01, "", "", "undercurl", "")
" Word that should start with a capital. This will be combined with the highlighting used otherwise.
call s:hi("SpellCap", s:gui0A, s:gui01, "", "", "undercurl", "")
" Word that is recognized by the spellchecker as one that is used in another region. This will be combined with the highlighting used otherwise.
call s:hi("SpellLocal", s:gui0C, s:gui01, "", "", "undercurl", "")
" Word that is recognized by the spellchecker as one that is hardly ever used. spell This will be combined with the highlighting used otherwise.
call s:hi("SpellRare", s:gui0D, s:gui01, "", "", "undercurl", "")


"+-+-+-+-+-+-+-+-+-+-+
"+ Visual Something  +
"+-+-+-+-+-+-+-+-+-+-+
call s:hi("Visual", "", s:gui01, "", "", "", "")
call s:hi("VisualNOS", "", s:gui01, "", "", "", "")

"+-+-+-+-+-+-+-+-+-+-+
"+ Git Highlighting  +
"+-+-+-+-+-+-+-+-+-+-+
call s:hi("gitcommitComment", s:gui02, "", "", "", "", "")
call s:hi("gitcommitUnmerged", s:gui0B, "", "", "", "", "")
call s:hi("gitcommitOnBranch", s:gui0C, "", "", "", "", "")
call s:hi("gitcommitBranch", s:gui0E, "", "", "", "", "")
call s:hi("gitcommitDiscardedType", s:gui08, "", "", "", "", "")
call s:hi("gitcommitSelectedType", s:gui0B, "", "", "", "", "")
call s:hi("gitcommitHeader", s:gui0B, "", "", "", "", "")
call s:hi("gitcommitUntrackedFile", s:gui0C, "", "", "", "", "")
call s:hi("gitcommitDiscardedFile", s:gui08, "", "", "", "", "")
call s:hi("gitcommitSelectedFile", s:gui0B, "", "", "", "", "")
call s:hi("gitcommitUnmergedFile", s:gui0A, "", "", "", "", "")
call s:hi("gitcommitFile", s:gui0E, "", "", "", "", "")
call s:hi("gitcommitSummary", s:gui05, "", "", "", "", "")
call s:hi("gitcommitOverflow", s:gui08, "", "", "", "", "")
hi link gitcommitNoBranch gitcommitBranch
hi link gitcommitUntracked gitcommitComment
hi link gitcommitDiscarded gitcommitComment
hi link gitcommitSelected gitcommitComment
hi link gitcommitDiscardedArrow gitcommitDiscardedFile
hi link gitcommitSelectedArrow gitcommitSelectedFile
hi link gitcommitUnmergedArrow gitcommitUnmergedFile


"+-+-+-+-+-+-+-+-+-+-+-+
"+-- Diff Highlight ---+
"+-+-+-+-+-+-+-+-+-+-+-+
if &diff
  " Don't change the background color in diff mode
  call s:hi("CursorLine", "", "", "", "", "underline", "") " the screen line that the cursor is in when 'cursorline' is set
else
  call s:hi("CursorLine", "", s:line, "", "", "", "" ) " the screen line that the cursor is in when 'cursorline' is set
endif
call s:hi("Directory", s:gui0D, "", "", "", "", "") " directory names (and other special names in listings)
call s:hi("DiffAdd", s:gui0B, s:gui00, "", "", "", "") " diff mode: Added line
call s:hi("DiffChange", s:gui0C, s:gui00, "", "", "", "") " diff mode: Changed line
call s:hi("DiffDelete", s:gui08, s:gui00, "", "", "", "") " diff mode: Deleted line
call s:hi("DiffText", s:gui0A, s:gui00, "", "", "", "") " diff mode: Changed text within a changed line


"+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
"+ ---+ L A N G U A G E   F O R M A T +--- +
"+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

"+------------------+
"+ C Lang Highlight +
"+------------------+
call s:hi("cIncluded", s:gui0A, "", "", "", "", "")
hi! link cOperator Operator
hi! link cPreCondit PreCondit

"+--------------------+
"+ CS Lang Hightlight +
"+--------------------+
call s:hi("cssAttributeSelector", s:gui0A, "", "", "", "", "")
call s:hi("cssDefinition", s:gui0A, "", "", "", "NONE", "")
call s:hi("cssIdentifier", s:gui0A, "", "", "", "underline", "")
call s:hi("cssStringQ", s:gui0B, "", "", "", "", "")
hi! link cssAttr Keyword
hi! link cssBraces Delimiter
hi! link cssClassName cssDefinition
hi! link cssColor Number
hi! link cssProp cssDefinition
hi! link cssPseudoClass cssDefinition
hi! link cssPseudoClassId cssPseudoClass
hi! link cssVendor Keyword
hi! link csPreCondit PreCondit
hi! link csType Type
hi! link csXmlTag SpecialComment

"+-+-+-+-+-+-+-+-+-+-+-+-+
"+-- XML Lang Highlight -+
"+-+-+-+-+-+-+-+-+-+-+-+-+
call s:hi("xmlAttrib", s:gui0A, "", "", "", "", "" )
call s:hi("xmlEndTag", s:gui08, "", "", "", "", "" )
call s:hi("xmlTag", s:gui08, "", "", "", "", "" )
call s:hi("xmlTagName", s:gui08, "", "", "", "", "" )

"+-+-+-+-+-+-+-+-+-+-+-+-+
"+-- TeX Lang Highlight -+
"+-+-+-+-+-+-+-+-+-+-+-+-+
call s:hi("texStatement", s:gui0E, "", "", "", "", "" )
call s:hi("texSubscripts", s:gui0A, "", "", "", "", "" )
call s:hi("texSuperscripts", s:gui0A, "", "", "", "", "" )
call s:hi("texTodo", s:gui03, "", "", "", "", "" )
call s:hi("texBeginEnd", s:gui0E, "", "", "", "", "" )
call s:hi("texBeginEndName", s:gui0D, "", "", "", "", "" )
call s:hi("texMathMatcher", s:gui0D, "", "", "", "", "" )
call s:hi("texMathDelim", s:gui0D, "", "", "", "", "" )
call s:hi("texDelimiter", s:gui0A, "", "", "", "", "" )
call s:hi("texSpecialChar", s:gui0A, "", "", "", "", "" )
call s:hi("texCite", s:gui0D, "", "", "", "", "" )
call s:hi("texRefZone", s:gui0D, "", "", "", "", "" )

"+-------------------+
"+ Go Lang Highlight +
"+-------------------+
call s:hi("goDeclaration", s:gui0E, "", "", "", "", "")
call s:hi("goBuiltins", s:gui0C, "", "", "", "", "")
call s:hi("goFunctionCall", s:gui0D, "", "", "", "", "")
call s:hi("goVarDefs", s:gui08, "", "", "", "", "")
call s:hi("goVarAssign", s:gui08, "", "", "", "", "")
call s:hi("goVar", s:gui0E, "", "", "", "", "")
call s:hi("goConst", s:gui0E, "", "", "", "", "")
call s:hi("goType", s:gui0A, "", "", "", "", "")
call s:hi("goTypeName", s:gui0A, "", "", "", "", "" )
call s:hi("goDeclType", s:gui0C, "", "", "", "", "" )
call s:hi("goTypeDecl", s:gui0E, "", "", "", "", "" )

"+---------------------+
"+ Rust Lang Highlight +
"+---------------------+
call s:hi("rustAttribute", s:gui0D, "", "", "", "", "")
call s:hi("rustEnum", s:gui09, "", "", "", s:bold, "")
call s:hi("rustMacro", s:gui0C, "", "", "", s:bold, "")
call s:hi("rustModPath", s:gui0A, "", "", "", "", "")
call s:hi("rustPanic", s:gui08, "", "", "", s:bold, "")
call s:hi("rustTrait", s:gui0A, "", "", "", "italic", "")
hi! link rustCommentLineDoc Comment
hi! link rustDerive rustAttribute
hi! link rustEnumVariant rustEnum
hi! link rustEscape SpecialChar
hi! link rustQuestionMark Keyword

"+--------------------+
"+ CSS Lang Highlight +
"+--------------------+
call s:hi("cssAttrComma", s:gui0E, "", "", "", "", "" )
call s:hi("cssAttributeSelector", s:gui0B, "", "", "", "", "" )
call s:hi("cssBraces", s:gui0E, "", "", "", "", "" )
call s:hi("cssClassName", s:gui0A, "", "", "", "", "" )
call s:hi("cssClassNameDot", s:gui0A, "", "", "", "", "" )
call s:hi("cssDefinition", s:gui0E, "", "", "", "", "" )
call s:hi("cssFontAttr", s:gui0A, "", "", "", "", "" )
call s:hi("cssFontDescriptor", s:gui0E, "", "", "", "", "" )
call s:hi("cssFunctionName", s:gui0D, "", "", "", "", "" )
call s:hi("cssIdentifier", s:gui0D, "", "", "", "", "" )
call s:hi("cssImportant", s:gui0E, "", "", "", "", "" )
call s:hi("cssInclude", s:gui05, "", "", "", "", "" )
call s:hi("cssIncludeKeyword", s:gui0E, "", "", "", "", "" )
call s:hi("cssMediaType", s:gui0A, "", "", "", "", "" )
call s:hi("cssProp", s:gui05, "", "", "", "", "" )
call s:hi("cssPseudoClassId", s:gui0A, "", "", "", "", "" )
call s:hi("cssSelectorOp", s:gui0E, "", "", "", "", "" )
call s:hi("cssSelectorOp2", s:gui0E, "", "", "", "", "" )
call s:hi("cssTagName", s:gui08, "", "", "", "", "" )

"+----------------------+
"+ Java Lang Hightlight +
"+----------------------+
" > Java motherfucker! Do you speak it?!?!
call s:hi("javaAnnotation", s:gui0C, "", "", "", "italic", "")
call s:hi("javaDocTags", s:gui0A, "", "", "", "italic", "")
call s:hi("javaCommentTitle", s:gui03, "", "", "", "italic", "")
call s:hi("javaParen", s:gui03, "", "", "", "italic", "")
call s:hi("javaParen1", s:gui0B, "", "", "", "", "")
call s:hi("javaParen2", s:gui0B, "", "", "", "", "")
call s:hi("javaParen3", s:gui0B, "", "", "", "", "")
call s:hi("javaParen4", s:gui0B, "", "", "", "", "")
call s:hi("javaParen5", s:gui0B, "", "", "", "", "")
call s:hi("javaVarArg", s:gui0C, "", "", "", "", "")

"+---------------------------+
"+ Vimscript Lang Hightlight +
"+---------------------------+
call s:hi("vimCommentTitle", s:gui0D, "", "", "", "italic", "")
call s:hi("vimBracket", s:gui0E, "", "", "", "", "")
call s:hi("vimMapModKey", s:gui0D, "", "", "", "italic", "")
call s:hi("vimFuncSID", s:gui0D, "", "", "", "italic", "")
call s:hi("vimSetSep", s:gui0C, "", "", "", "", "")
call s:hi("vimSep", s:gui08, "", "", "", "", "")
call s:hi("vimContinue", s:gui0D, "", "", "", "", "")
call s:hi("vimNotation", s:gui0A, "", "", "", "", "")
call s:hi("vimOper", s:gui0E, "", "", "", "", "")

"+----------------------+
"+ JSON Lang Hightlight +
"+----------------------+
call s:hi("jsonCommentError", s:gui0E, "", "", "", "", "")
call s:hi("jsonKeyword", s:gui08, "", "", "", "", "")
call s:hi("jsonBoolean", s:gui09, "", "", "", "", "")
call s:hi("jsonNumber", s:gui09, "", "", "", "", "")
call s:hi("jsonQuote", s:gui0C, "", "", "", "", "")
call s:hi("jsonMissingCommaError", s:gui08, "", "", "", "reverse", "")
call s:hi("jsonNoQuotesError", s:gui0F, "", "", "", "reverse", "")
call s:hi("jsonNumError", s:gui0F, "", "", "", "reverse", "")
call s:hi("jsonString", s:gui0B, "", "", "", "", "")
call s:hi("jsonStringSQError", s:gui08, "", "", "", "reverse", "")
call s:hi("jsonSemicolonError", s:gui08, "", "", "", "reverse", "")

"+-------------------------+
"+ Markdown Lang Highlight +
"+-------------------------+
call s:hi("markdownBlockquote", s:gui0E, "", "", "", "", "" )
call s:hi("markdownBold", s:gui0A, "", "", "", s:bold, "")
call s:hi("markdownCode", s:gui0B, "", "", "", "", "")
call s:hi("markdownCodeBlock", s:gui0B, "", "", "", "", "")
call s:hi("markdownCodeDelimiter", s:gui0B, "", "", "", "", "")
call s:hi("markdownH1", s:gui08, "", "", "", "", "")
call s:hi("markdownH2", s:gui08, "", "", "", "", "" )
call s:hi("markdownH3", s:gui08, "", "", "", "", "" )
call s:hi("markdownH4", s:gui08, "", "", "", "", "" )
call s:hi("markdownH5", s:gui08, "", "", "", "", "" )
call s:hi("markdownH6", s:gui08, "", "", "", "", "" )
call s:hi("markdownHeadingDelimiter", s:gui08, "", "", "", "", "")
call s:hi("markdownHeadingRule", s:gui0C, "", "", "", "", "")
call s:hi("markdownId", s:gui0E, "", "", "", "", "")
call s:hi("markdownIdDeclaration", s:gui0D, "", "", "", "", "")
call s:hi("markdownIdDelimiter", s:gui0E, "", "", "", "", "")
call s:hi("markdownItalic", s:gui0E, "", "", "", "italic", "")
call s:hi("markdownLinkDelimiter", s:gui0E, "", "", "", "", "")
call s:hi("markdownLinkText", s:gui0D, "", "", "", "", "")
call s:hi("markdownListMarker", s:gui08, "", "", "", "", "")
call s:hi("markdownOrderedListMarker", s:gui08, "", "", "", "", "")
call s:hi("markdownRule", s:gui0D, "", "", "", "", "")
call s:hi("markdownUrl", s:gui0C, "", "", "", "undercurl", "")

"+------------------------+
"+ Haskel Lang Hightlight +
"+------------------------+
call s:hi("haskellType", s:gui0A, "", "", "", "", "")
call s:hi("haskellOperators", s:gui0C, "", "", "", "", "")
call s:hi("haskellNumber", s:gui09, "", "", "", "", "")
call s:hi("haskellPragma", s:gui0E, "", "", "", "", "")

"+----------------------------+
"+ JavaScript Lang Hightlight +
"+----------------------------+
call s:hi("javaScriptBraces", s:gui0C, "", "", "", "", "")
call s:hi("javaScriptFunction", s:gui0A, "", "", "", "", "")
call s:hi("javaScriptIdentifier", s:gui0A, "", "", "", "", "")
call s:hi("javaScriptNull", s:gui08, "", "", "", "", "")
call s:hi("javaScriptNumber", s:gui09, "", "", "", "", "")
call s:hi("javaScriptRequire", s:gui0C, "", "", "", "", "")
call s:hi("javaScriptReserved", s:gui0E, "", "", "", "", "" )
" https://github.com/pangloss/vim-javascript
call s:hi("jsArrowFunction", s:gui0E, "", "", "", "", "" )
call s:hi("jsClassKeyword", s:gui0E, "", "", "", "", "" )
call s:hi("jsClassMethodType", s:gui0E, "", "", "", "", "" )
call s:hi("jsDocParam", s:gui0D, "", "", "", "", "" )
call s:hi("jsDocTags", s:gui0E, "", "", "", "", "" )
call s:hi("jsExport", s:gui0E, "", "", "", "", "" )
call s:hi("jsExportDefault", s:gui0E, "", "", "", "", "" )
call s:hi("jsExtendsKeyword", s:gui0E, "", "", "", "", "" )
call s:hi("jsFrom", s:gui0E, "", "", "", "", "" )
call s:hi("jsFuncCall", s:gui0D, "", "", "", "", "" )
call s:hi("jsFunction", s:gui0E, "", "", "", "", "" )
call s:hi("jsGenerator", s:gui0A, "", "", "", "", "" )
call s:hi("jsGlobalObjects", s:gui0A, "", "", "", "", "" )
call s:hi("jsImport", s:gui0E, "", "", "", "", "" )
call s:hi("jsModuleAs", s:gui0E, "", "", "", "", "" )
call s:hi("jsModuleWords", s:gui0E, "", "", "", "", "" )
call s:hi("jsModules", s:gui0E, "", "", "", "", "" )
call s:hi("jsNull", s:gui0A, "", "", "", "", "" )
call s:hi("jsOperator", s:gui0E, "", "", "", "", "" )
call s:hi("jsStorageClass", s:gui0E, "", "", "", "", "" )
call s:hi("jsSuper", s:gui08, "", "", "", "", "" )
call s:hi("jsTemplateBraces", s:gui08, "", "", "", "", "" )
call s:hi("jsTemplateVar", s:gui0B, "", "", "", "", "" )
call s:hi("jsThis", s:gui08, "", "", "", "", "" )
call s:hi("jsUndefined", s:gui0A, "", "", "", "", "" )

"+----------------------+
"+ Lisp Lang Hightlight +
"+----------------------+
"highlight! link lispAtomMark Purple
"highlight! link lispKey Orange
"highlight! link lispFunc Green

"+----------------------------+
"+ Typescript Lang Hightlight +
"+----------------------------+
call s:hi("typescriptReserved", s:gui0A, "", "", "", "", "")
call s:hi("typeScriptLabel", s:gui0C, "", "", "", "", "" )
call s:hi("typeScriptFuncKeyword", s:gui08, "", "", "", "", "" )
call s:hi("typeScriptIdentifier", s:gui0C, "", "", "", "", "" )
call s:hi("typeScriptDOMObjects", s:gui0B, "", "", "", "", "")
call s:hi("typeScriptAjaxMethods", s:gui0A, "", "", "", "", "")
call s:hi("typeScriptGlobalObject", s:gui0A, "", "", "", "", "")
call s:hi("typeScriptInterpolationDelimiter", s:gui0E, "", "", "", "", "")
call s:hi("typeScriptNull", s:gui0E, "", "", "", "", "")
call s:hi("typeScriptNull", s:gui0E, "", "", "", "", "")
call s:hi("typeScriptParens", s:gui08, "", "", "", "", "")
hi! link typeScriptOpSymbols Boolean
hi! link typeScriptHtmlElemProperties Special
hi! link typeScriptLogicSymbols Boolean
hi! link typeScriptDocSeeTag Comment
hi! link typeScriptDocParam Comment
hi! link typeScriptDocTags vimCommentTitle

"+---------------------+
"+ HTML Lang Highlight +
"+---------------------+
call s:hi("htmlArg", s:gui0A, "", "", "", "", "")
call s:hi("htmlBold", s:gui0A, "", "", "", s:bold, "")
call s:hi("htmlEndTag", s:gui0E, "", "", "", "", "")
call s:hi("htmlH1", s:gui08, "", "", "", "italic", "")
call s:hi("htmlH2", s:gui08, "", "", "", "italic", "")
call s:hi("htmlH3", s:gui08, "", "", "", "italic", "")
call s:hi("htmlH4", s:gui08, "", "", "", "italic", "")
call s:hi("htmlH5", s:gui08, "", "", "", "italic", "")
call s:hi("htmlH6", s:gui08, "", "", "", "italic", "")
call s:hi("htmlItalic", s:gui0E, "", "", "", "italic", "")
call s:hi("htmlLink", s:gui0C, "", "", "", "undercurl", "")
call s:hi("htmlSpecialChar", s:gui0A, "", "", "", "", "")
call s:hi("htmlSpecialTagName", s:gui08, "", "", "", "", "")
call s:hi("htmlTag", s:gui0D, "", "", "", "", "")
call s:hi("htmlTagN", s:gui08, "", "", "", "", "")
call s:hi("htmlTagName", s:gui08, "", "", "", "", "")
call s:hi("htmlTitle", s:gui0D, "", "", "", "", "")

"+----------------------+
"+ PHP Lang Hightlight
"+----------------------+
call s:hi("phpVarSelector", s:gui08, "", "", "", "", "" )
call s:hi("phpOperator", s:gui08, "", "", "", "", "")
call s:hi("phpParent", s:gui0C, "", "", "", "", "")
call s:hi("phpMemberSelector", s:gui0D, "", "", "", "", "")
call s:hi("phpType", s:gui0E, "", "", "", "", "")
call s:hi("phpKeyword", s:gui0E, "", "", "", "", "" )
call s:hi("phpClass", s:gui0A, "", "", "", "", "" )
call s:hi("phpUseClass", s:gui0D, "", "", "", "", "" )
call s:hi("phpUseAlias", s:gui0C, "", "", "", "", "" )
call s:hi("phpInclude", s:gui0E, "", "", "", "", "" )
call s:hi("phpClassExtends", s:gui0B, "", "", "", "", "" )
call s:hi("phpDocTags", s:gui05, "", "", "", "", "" )
call s:hi("phpFunction", s:gui0D, "", "", "", "", "" )
call s:hi("phpFunctions", s:gui0C, "", "", "", "", "" )
call s:hi("phpMethodsVar", s:gui0A, "", "", "", "", "" )
call s:hi("phpMagicConstants", s:gui0A, "", "", "", "", "" )
call s:hi("phpSuperglobals", s:gui08, "", "", "", "", "" )
call s:hi("phpConstants", s:gui0A, "", "", "", "", "" )

"+--------------------+
" Perl Lang Highlight +
"+--------------------+
call s:hi("perlFiledescRead", s:gui0B, "", "", "", "", "" )
call s:hi("perlFunction", s:gui0E, "", "", "", "", "" )
call s:hi("perlMatchStartEnd", s:gui0D, "", "", "", "", "" )
call s:hi("perlMethod", s:gui0E, "", "", "", "", "" )
call s:hi("perlPOD", s:gui01, "", "", "", "", "" )
call s:hi("perlSharpBang", s:gui05, "", "", "", "", "" )
call s:hi("perlSpecialString", s:gui0B, "", "", "", "", "" )
call s:hi("perlStatementFiledesc", s:gui08, "", "", "", "", "" )
call s:hi("perlStatementFlow", s:gui08, "", "", "", "", "" )
call s:hi("perlStatementInclude", s:gui0E, "", "", "", "", "" )
call s:hi("perlStatementScalar", s:gui0E, "", "", "", "", "" )
call s:hi("perlStatementStorage", s:gui0E, "", "", "", "", "" )
call s:hi("perlSubName", s:gui0A, "", "", "", "", "" )
call s:hi("perlVarPlain", s:gui0D, "", "", "", "", "" )

"+---------------------+
"+ Ruby Lang Highlight +
"+---------------------+
call s:hi("rubyBlockParameter", s:gui08, "", "", "", "", "")
call s:hi("rubyBlockParameterList", s:gui08, "", "", "", "", "")
call s:hi("rubyClass", s:gui0A, "", "", "", "", "")
call s:hi("rubyConstant", s:gui0A, "", "", "", "", "")
call s:hi("rubyControl", s:gui0A, "", "", "", "", "")
call s:hi("rubyEscape", s:gui08, "", "", "", "", "")
call s:hi("rubyFunction", s:gui0D, "", "", "", "", "")
call s:hi("rubyGlobalVariable", s:gui08, "", "", "", "", "")
call s:hi("rubyInclude", s:gui0D, "", "", "", "", "")
call s:hi("rubyIncluderubyGlobalVariable", s:gui08, "", "", "", "", "")
call s:hi("rubyInstanceVariable", s:gui08, "", "", "", "", "")
call s:hi("rubyInterpolation", s:gui0C, "", "", "", "", "")
call s:hi("rubyInterpolationDelimiter", s:gui08, "", "", "", "", "")
call s:hi("rubyInterpolationDelimiter", s:gui08, "", "", "", "", "")
call s:hi("rubyRegexp", s:gui0C, "", "", "", "", "")
call s:hi("rubyRegexpDelimiter", s:gui0C, "", "", "", "", "")
call s:hi("rubyStringDelimiter", s:gui0B, "", "", "", "", "")
call s:hi("rubySymbol", s:gui0C, "", "", "", "", "")


"+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
"+ ---+ P L U G I N   F O R M A T +--- +
"+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

" fugitive.vim
" > tpope/vim-fugitive
call s:hi("gitcommitDiscardedFile", s:gui08, "", "", "", "", "" )
call s:hi("gitcommitUntrackedFile", s:gui0C, "", "", "", "", "" )
call s:hi("gitcommitSelectedFile", s:gui0B, "", "", "", "", "" )
call s:hi("diffAdded", s:gui0B, "", "", "", "", "" )
call s:hi("diffRemoved", s:gui08, "", "", "", "", "" )

" Vim Clap
" > liuchengxu/vim-clap
let s:save_cpo = &cpoptions
set cpoptions&vim
let s:palette = {}
let s:palette.display = { 'ctermbg': '0', 'guibg': 'gui01' }

" Let ClapInput, ClapSpinner and ClapSearchText use the same background.
let s:bg0 = { 'ctermbg': '60', 'guibg': s:gui00 }
let s:palette.input = s:bg0
let s:palette.indicator = extend({ 'ctermfg': '238', 'guifg': s:gui01 }, s:bg0)
let s:palette.spinner = extend({ 'ctermfg': '11', 'guifg': s:gui0A, 'cterm': s:bold, 'gui': s:bold }, s:bg0)
let s:palette.search_text = extend({ 'ctermfg': '4', 'guifg': s:gui0D, 'cterm': s:bold, 'gui': s:bold }, s:bg0)
let s:palette.preview = { 'ctermbg': '238', 'guibg': s:gui00 }
let s:palette.selected = { 'ctermfg': '81', 'guifg': s:gui0C, 'cterm': 'bold,underline', 'gui': 'bold,underline' }
let s:palette.current_selection = { 'ctermbg': '236', 'guibg': s:gui01, 'cterm': s:bold, 'gui': s:bold }
let s:palette.selected_sign = { 'ctermfg': '196', 'guifg': s:gui0A }
let s:palette.current_selection_sign = s:palette.selected_sign

hi ClapShadow guibg=#3b3b4d

let g:clap_fuzzy_match_hl_groups = [
  \ ['75', s:gui0A],
\ ]

let g:clap#themes#aquarium#palette = s:palette
let &cpoptions = s:save_cpo
unlet s:save_cpo
let g:clap_theme = 'aquarium'

" vim-plug
" > junegunn/vim-plug
call s:hi("plugDeleted", s:gui08, "", "", "", "italic", "")

" YAML
" > stephpy/vim-yaml
call s:hi("yamlKey", s:gui08, "", "", "", "italic", "")

" JEDI
" > davidhalter/jedi-vim
call s:hi("jediFunction", s:gui0E, s:gui02, "", "", "italic", "")
call s:hi("jediFat", s:gui0C, s:gui02, "", "", "italic", "")

" Pandoc
" > vim-pandoc/vim-pandoc-syntax
call s:hi("pandocDefinitionBlockTerm", s:gui08, "", "", "", "italic", "")
call s:hi("pandocTableDelims", s:gui0E, "", "", "", "", "")
hi! link pandocAtxHeader markdownH1
hi! link pandocBlockQuote markdownBlockquote
hi! link pandocCiteAnchor Operator
hi! link pandocCiteKey pandocReferenceLabel
hi! link pandocDefinitionBlockMark Operator
hi! link pandocEmphasis markdownItalic
hi! link pandocFootnoteID pandocReferenceLabel
hi! link pandocFootnoteIDHead markdownLinkDelimiter
hi! link pandocFootnoteIDTail pandocFootnoteIDHead
hi! link pandocGridTableDelims pandocTableDelims
hi! link pandocGridTableHeader pandocTableDelims
hi! link pandocOperator Operator
hi! link pandocPipeTableDelims pandocTableDelims
hi! link pandocReferenceDefinition pandocReferenceLabel
hi! link pandocReferenceLabel markdownLinkText
hi! link pandocReferenceURL markdownUrl
hi! link pandocSimpleTableHeader pandocAtxHeader
hi! link pandocStrong markdownBold
hi! link pandocTableHeaderWord pandocAtxHeader
hi! link pandocUListItemBullet Operator

" GitGutter
" > airblade/vim-gitgutter
call s:hi("GitGutterAdd", s:gui0B, "", "", "", "", "")
call s:hi("GitGutterChange", s:gui0D, "", "", "", "", "")
call s:hi("GitGutterDelete", s:gui08, "", "", "", "", "")
call s:hi("GitGutterChangeDelete", s:gui0E, "", "", "", "", "")
highlight! link GitGutterChangeDelete PurpleSign

if has('nvim')
    call s:hi("Constructor", s:gui02, "", "", "", "", "")
    call s:hi("Emphasis", s:gui02, "", "", "", "", "")
    call s:hi("Field", s:gui0B, "", "", "", "", "")
    call s:hi("FunctionBuiltin", s:gui0D, "", "", "", "", "")
    call s:hi("FuncMacro", s:gui0E, "", "", "", "", "")
    call s:hi("Method", s:gui0B, "", "", "", "", "")
    call s:hi("Parameter", s:gui09, "", "", "", "", "")
    call s:hi("TypeBuiltin", s:gui0F, "", "", "", "", "")
    call s:hi("TreeSitterVariable", s:gui0B, "", "", "", "", "")
    hi! link TSAnnotation PreProc
    hi! link TSAttribute Decorator
    hi! link TSBoolean Boolean
    hi! link TSCharacter Character
    hi! link TSConditional Conditional
    hi! link TSConstant Constant
    hi! link TSConstBuiltin Structure
    hi! link TSConstructor Constructor
    hi! link TSEmphasis Emphasis
    hi! link TSError Error
    hi! link TSException Exception
    hi! link TSField Field
    hi! link TSFunction Function
    hi! link TSFuncBuiltin FunctionBuiltin
    hi! link TSFuncMacro FuncMacro " FuncMacro is mostly used in rust
    hi! link TSKeyword Keyword
    hi! link TSKeywordFunction Function
    hi! link TSKeywordOperator Operator
    hi! link TSLabel Label
    hi! link TSLiteral Constant
    hi! link TSMethod Method
    hi! link TSNamespace Directory
    hi! link TSNumber Number
    hi! link TSOperator Operator
    hi! link TSParameter Parameter
    hi! link TSPunctBracket Delimiter
    hi! link TSPunctDelimiter Delimiter
    hi! link TSPunctSpecial DelimterAlt
    hi! link TSRepeat Repeat
    hi! link TSString String
    hi! link TSStringEscape SpecialKey
    hi! link TSStringRegex String
    hi! link TSStrong Bold
    hi! link TSStructure Structure
    hi! link TSTag Keyword
    hi! link TSTagDelimiter Delimiter
    hi! link TSText String
    hi! link TSType Type
    hi! link TSTypeBuiltin TypeBuiltin
    hi! link TSUnderline Underlined
    hi! link TSURI URL
    hi! link TSVariable TreeSitterVariable
    hi! link TSVariableBuiltin Variable
end
