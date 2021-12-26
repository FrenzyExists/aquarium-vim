" Project: Aquarium Theme
" Name: aquarium-vim
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

" Naming
let colors_name = "aquarium"
let s:aquarium_vim_version="0.3.6"

"+-+-+-+-+-+-+-+-+-+-+-+-+-+
"+----- Color Thingy ------+
"+-+-+-+-+-+-+-+-+-+-+-+-+-+

let s:colors = aquarium#colors#definitions()

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
call s:hi("Bold", "", "", "", "", s:colors.bold, "")
call s:hi("Italic", "", "", "", "", "italic", "")
call s:hi("Underline", "", "", "", "", "underline", "")


"+-+-+-+-+-+-+-+-+-+-+
"+----- Editor ------+
"+-+-+-+-+-+-+-+-+-+-+
call s:hi("Normal", s:colors.gui05, s:colors.normal, "NONE", "NONE", "", "")
call s:hi("Error", s:colors.gui08, s:colors.gui01, "", "", "italic", "")
call s:hi("Search", s:colors.gui0A, s:colors.gui02, "", "", "", "") " Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
call s:hi("MatchParen", s:colors.gui0C, s:colors.gui02, "", "", "", "")
call s:hi("NonText", s:colors.gui05, s:colors.gui02, "", "", "", "")
call s:hi("Special", s:colors.gui0A, "", "", "", "italic", "")
call s:hi("SpecialKey", s:colors.gui02, "", "", "", "", "")
call s:hi("Conceal", "", s:colors.gui03, "", "NONE", "", "") " placeholder characters substituted for concealed text (see 'conceallevel')
call s:hi("IncSearch", s:colors.gui0E, s:colors.gui01, "NONE", "NONE", "", "")

" Comments and Such
call s:hi("Comment", s:colors.gui03, "", "", "", "italic", "")
call s:hi("SpecialComment", s:colors.gui02, "", "", "", "italic", "")

" Pmenu
call s:hi("Pmenu", s:colors.gui05, s:colors.gui01, "", "", "", "")
call s:hi("PmenuSbar",  s:colors.gui05, s:colors.gui01, "", "", "", "")
call s:hi("PmenuSel", s:colors.gui0C, s:colors.gui01, "", "", "", "")
call s:hi("PmenuThumb", s:colors.gui0C, s:colors.gui01, "", "", "", "")

" Columns
call s:hi("SignColumn", s:colors.gui0D, s:colors.sign_col, "NONE", "", "", "")
call s:hi("ColorColumn", "", s:colors.gui01, "NONE", "", "", "")
call s:hi("CursorColumn", s:colors.gui0C, s:colors.gui00, "NONE", "", "", "")

" Folding
call s:hi("FoldColumn", s:colors.gui06, s:colors.gui01, "NONE", "", "", "")
call s:hi("Folded", s:colors.gui02, s:colors.folded, "NONE", "", "", "")

" Cursor
call s:hi("Cursor", s:colors.cursor_bg, s:colors.gui06, "NONE", "NONE", "", "") " Regular Cursor thing
call s:hi("CursorIM", s:colors.gui02, s:colors.gui06, "", "NONE", "", "") " like Cursor, but used when in IME mode
call s:hi("iCursor", s:colors.cursor_bg, s:colors.gui06, "", "NONE", "", "")

" Line Stuff
call s:hi("LineNr", s:colors.gui03, s:colors.gui00, "", "", s:colors.bold, "") " The Number Columns
call s:hi("CursorLine", "", s:colors.line, "NONE", "", "NONE", "") " Changes the color focused line where the cursor is
call s:hi("CursorLineNr", s:colors.linenr_fg, s:colors.linenr_bg, "NONE", "", "NONE", "") " Changes the color focused column number where the cursor is

" Tabs
call s:hi("TabLineFill", s:colors.gui0D, s:colors.gui01, "NONE", "NONE", "NONE", "NONE")
call s:hi("TabLineSel", s:colors.gui03, s:colors.gui0F, "NONE", "NONE", s:colors.bold, "NONE")
call s:hi("TabLine", s:colors.gui05, s:colors.gui00, "NONE", "NONE", "NONE", "NONE")

"+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
"+-- Lang Specifics aka Fallbacks ---+
"+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
call s:hi("PreProc", s:colors.gui0E, "", "", "", "", "")
call s:hi("Todo", s:colors.gui0E, s:colors.gui01, "", "", s:colors.bold, "") " anything that needs extra attention; mostly the keywords TODO FIXME and XXX
call s:hi("Boolean", s:colors.gui09, "", "", "", "", "") " a boolean constant: TRUE, false
call s:hi("Type", s:colors.gui0A, "", "", "", "italic", "" ) " int, long, char, etc.
call s:hi("Function", s:colors.gui0C, "", "", "", "italic", "") " a floating point constant: 2.3e10
call s:hi("Include", s:colors.gui0D, "", "", "", "", "" ) " preprocessor #include
call s:hi("Statement", s:colors.gui0D, "", "", "", "", "" ) " any statement
call s:hi("Conditional", s:colors.gui0C, "", "", "", "", "") " if, then, else, endif, switch, etc.
call s:hi("Repeat", s:colors.gui0A, "", "", "", "", "") " for, do, while, etc.
call s:hi("Label", s:colors.gui0A,"", "", "", "", "") " case, default, etc.
call s:hi("String", s:colors.gui0B, "", "", "", "", "") " a string constant: 'this is a string'
call s:hi("Character", s:colors.gui0B, "", "", "", "", "") " a character constant: 'c', '\n'
call s:hi("StorageClass", s:colors.gui0A, "", "", "", "", "") " static, register, volatile, etc.
call s:hi("Operator", s:colors.gui08, "", "", "", s:colors.bold, "") " sizeof, '+', '*', etc.
call s:hi("Number", s:colors.gui09, "", "", "", "", "") " a number constant: 234, 0xff
call s:hi("Float", s:colors.gui08, "", "", "", "", "") " a floating point constant: 2.3e10
call s:hi("Structure", s:colors.gui0A, "", "", "", "", "" ) " struct, union, enum, etc.
call s:hi("Typedef", s:colors.gui0A, "", "", "", "", "") " A typedef
call s:hi("Special", s:colors.gui0D, "", "", "", "", "") " any special symbol
call s:hi("SpecialChar", s:colors.gui01, "", "", "", "", "") " special character in a constant
call s:hi("Decorator", s:colors.gui0E, "", "", "", "", "")
call s:hi("Tag", s:colors.gui0A, "", "", "", "", "") " you can use CTRL-] on this
call s:hi("Delimiter", s:colors.gui0D, "", "", "", s:colors.bold, "") " character that needs attention, parenthesis for example
call s:hi("Macro", s:colors.gui0E, "", "", "", "", "") " same as Define
call s:hi("Exception", s:colors.gui0E, "", "", "", "", "") " try, catch, throw
call s:hi("Delimiter", "", "", "", "", "", "") " character that needs attention
call s:hi("Keyword", s:colors.gui08, "", "", "", "italic", "") " any other keyword
call s:hi("Debug", "", "", "", "", "", "") " debugging statements
call s:hi("Underlined", "", "", "", "", "underline", "") " text that stands out, HTML links
call s:hi("Identifier", s:colors.gui08, "", "", "", "", "") " any variable name
call s:hi("Constant", s:colors.gui0E, "", "", "", "italic", "")
call s:hi("WildMenu", s:colors.gui0D, s:colors.gui01, "", "", "", "")
hi! link PreCondit PreProc
hi! link Annotation Decorator
hi! link Variable Identifier


"+-+-+-+-+-+-+-+-+-+-+-+-+
"+--- Window Highlight --+
"+-+-+-+-+-+-+-+-+-+-+-+-+
call s:hi("VertSplit", s:colors.gui01, s:colors.gui00, "", "NONE", s:colors.bold, "")
call s:hi("StatusLine", s:colors.gui00, s:colors.gui03, "", "", "", "") " status line of current window
call s:hi("StatusLineNC", s:colors.gui01, s:colors.gui00, "", "", "underline", "") "status lines of not-current windows Note: if this is equal to 'StatusLine' Vim will use '^^^' in the status line of the current window.
call s:hi("StatusLineTerm", s:colors.gui05, s:colors.gui00, "", "", "", "" ) " status line of current :terminal window
call s:hi("StatusLineTermNC", s:colors.gui06, s:colors.gui00, "", "", "underline", "") " status line of non-current :terminal window


"+-+-+-+-+-+-+-+-+-+-+-+-+
"+--- Ascii Hightlight --+
"+-+-+-+-+-+-+-+-+-+-+-+-+
call s:hi("asciidocAttributeEntry", s:colors.gui0D, "", "", "", "", "")
call s:hi("asciidocAttributeList", s:colors.gui0D, "", "", "", "", "")
call s:hi("asciidocAttributeRef", s:colors.gui0D, "", "", "", "", "")
call s:hi("asciidocHLabel", s:colors.gui0E, "", "", "", "", "" )
call s:hi("asciidocListingBlock", s:colors.gui0A, "", "", "", "", "")
call s:hi("asciidocMacroAttributes", s:colors.gui0C, "", "", "", "", "")
call s:hi("asciidocOneLineTitle", s:colors.gui0C, "", "", "", "", "")
call s:hi("asciidocPassthroughBlock", s:colors.gui0E, "", "", "", "", "")
call s:hi("asciidocQuotedMonospaced", s:colors.gui0C, "", "", "", "", "")
call s:hi("asciidocTriplePlusPassthrough", s:colors.gui0A, "", "", "", "", "")
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
call s:hi("EndOfBuffer", s:colors.buff, "", "", "", "", "")
call s:hi("ErrorMsg", s:colors.gui08, s:colors.gui00, "", "", "italic", "")
call s:hi("ModeMsg", s:colors.gui05, "", "", "", "", "")
call s:hi("MoreMsg", s:colors.gui0C, s:colors.gui02, "", "", "", "")
call s:hi("Question", s:colors.gui05, "", "NONE", "", "", "")


"+-+-+-+-+-+-+-+-+-+-+-+-+
"+--- Cmake Hightlight --+
"+-+-+-+-+-+-+-+-+-+-+-+-+
call s:hi("cmakeGeneratorExpression", s:colors.gui0D, "", "", "", "italic", "")


"+-+-+-+-+-+-+-+-+-+-+-+
"+- Neovim Support -+
"+-+-+-+-+-+-+-+-+-+-+-+
call s:hi("healthError", s:colors.gui08, s:colors.gui01, "", "", "", "")
call s:hi("healthSuccess", s:colors.gui0B, s:colors.gui01, "", "", "", "")
call s:hi("healthWarning", s:colors.gui0A, s:colors.gui01, "", "", "", "")


"+-+-+-+-+-+-+-+-+-+-+
"+-- Awk Highlight --+
"+-+-+-+-+-+-+-+-+-+-+
call s:hi("awkCharClass", s:colors.gui0A, "", "", "", "italic", "")
call s:hi("awkPatterns", s:colors.gui0C,  "", "", "", "italic", "")
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
call s:hi("SpellBad", s:colors.gui08, s:colors.gui01, "", "", "undercurl", "")
" Word that should start with a capital. This will be combined with the highlighting used otherwise.
call s:hi("SpellCap", s:colors.gui0A, s:colors.gui01, "", "", "undercurl", "")
" Word that is recognized by the spellchecker as one that is used in another region. This will be combined with the highlighting used otherwise.
call s:hi("SpellLocal", s:colors.gui09, s:colors.gui01, "", "", "undercurl", "")
" Word that is recognized by the spellchecker as one that is hardly ever used. spell This will be combined with the highlighting used otherwise.
call s:hi("SpellRare", s:colors.gui0D, s:colors.gui01, "", "", "undercurl", "")


"+-+-+-+-+-+-+-+-+-+-+
"+ Visual Something  +
"+-+-+-+-+-+-+-+-+-+-+
call s:hi("Visual", "", s:colors.gui01, "", "", "", "")
call s:hi("VisualNOS", "", s:colors.gui01, "", "", "", "")

"+-+-+-+-+-+-+-+-+-+-+
"+ Git Highlighting  +
"+-+-+-+-+-+-+-+-+-+-+
call s:hi("gitcommitComment", s:colors.gui02, "", "", "", "", "")
call s:hi("gitcommitUnmerged", s:colors.gui0B, "", "", "", "", "")
call s:hi("gitcommitOnBranch", s:colors.gui0C, "", "", "", "", "")
call s:hi("gitcommitBranch", s:colors.gui0E, "", "", "", "", "")
call s:hi("gitcommitDiscardedType", s:colors.gui08, "", "", "", "", "")
call s:hi("gitcommitSelectedType", s:colors.gui0B, "", "", "", "", "")
call s:hi("gitcommitHeader", s:colors.gui0B, "", "", "", "", "")
call s:hi("gitcommitUntrackedFile", s:colors.gui0C, "", "", "", "", "")
call s:hi("gitcommitDiscardedFile", s:colors.gui08, "", "", "", "", "")
call s:hi("gitcommitSelectedFile", s:colors.gui0B, "", "", "", "", "")
call s:hi("gitcommitUnmergedFile", s:colors.gui0A, "", "", "", "", "")
call s:hi("gitcommitFile", s:colors.gui0E, "", "", "", "", "")
call s:hi("gitcommitSummary", s:colors.gui05, "", "", "", "", "")
call s:hi("gitcommitOverflow", s:colors.gui08, "", "", "", "", "")
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
  call s:hi("CursorLine", "", s:colors.line, "", "", "", "" ) " the screen line that the cursor is in when 'cursorline' is set
endif
call s:hi("Directory", s:colors.gui0D, "", "", "", "", "") " directory names (and other special names in listings)
call s:hi("DiffAdd", s:colors.gui0B, s:colors.gui00, "", "", "", "") " diff mode: Added line
call s:hi("DiffChange", s:colors.gui0C, s:colors.gui00, "", "", "", "") " diff mode: Changed line
call s:hi("DiffDelete", s:colors.gui08, s:colors.gui00, "", "", "", "") " diff mode: Deleted line
call s:hi("DiffText", s:colors.gui0A, s:colors.gui00, "", "", "", "") " diff mode: Changed text within a changed line


"+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
"+ ---+ L A N G U A G E   F O R M A T +--- +
"+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

"+------------------+
"+ C Lang Highlight +
"+------------------+
call s:hi("cIncluded", s:colors.gui0A, "", "", "", "", "")
hi! link cOperator Operator
hi! link cPreCondit PreCondit

"+--------------------+
"+ CS Lang Hightlight +
"+--------------------+
call s:hi("cssAttributeSelector", s:colors.gui0A, "", "", "", "", "")
call s:hi("cssDefinition", s:colors.gui0A, "", "", "", "NONE", "")
call s:hi("cssIdentifier", s:colors.gui0A, "", "", "", "underline", "")
call s:hi("cssStringQ", s:colors.gui0B, "", "", "", "", "")
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
call s:hi("xmlAttrib", s:colors.gui0A, "", "", "", "", "" )
call s:hi("xmlEndTag", s:colors.gui08, "", "", "", "", "" )
call s:hi("xmlTag", s:colors.gui08, "", "", "", "", "" )
call s:hi("xmlTagName", s:colors.gui08, "", "", "", "", "" )

"+-+-+-+-+-+-+-+-+-+-+-+-+
"+-- TeX Lang Highlight -+
"+-+-+-+-+-+-+-+-+-+-+-+-+
call s:hi("texStatement", s:colors.gui0E, "", "", "", "", "" )
call s:hi("texSubscripts", s:colors.gui0A, "", "", "", "", "" )
call s:hi("texSuperscripts", s:colors.gui0A, "", "", "", "", "" )
call s:hi("texTodo", s:colors.gui03, "", "", "", "", "" )
call s:hi("texBeginEnd", s:colors.gui0E, "", "", "", "", "" )
call s:hi("texBeginEndName", s:colors.gui0D, "", "", "", "", "" )
call s:hi("texMathMatcher", s:colors.gui0D, "", "", "", "", "" )
call s:hi("texMathDelim", s:colors.gui0D, "", "", "", "", "" )
call s:hi("texDelimiter", s:colors.gui0A, "", "", "", "", "" )
call s:hi("texSpecialChar", s:colors.gui0A, "", "", "", "", "" )
call s:hi("texCite", s:colors.gui0D, "", "", "", "", "" )
call s:hi("texRefZone", s:colors.gui0D, "", "", "", "", "" )

"+-------------------+
"+ Go Lang Highlight +
"+-------------------+
call s:hi("goDeclaration", s:colors.gui0E, "", "", "", "", "")
call s:hi("goBuiltins", s:colors.gui0C, "", "", "", "", "")
call s:hi("goFunctionCall", s:colors.gui0D, "", "", "", "", "")
call s:hi("goVarDefs", s:colors.gui08, "", "", "", "", "")
call s:hi("goVarAssign", s:colors.gui08, "", "", "", "", "")
call s:hi("goVar", s:colors.gui0E, "", "", "", "", "")
call s:hi("goConst", s:colors.gui0E, "", "", "", "", "")
call s:hi("goType", s:colors.gui0A, "", "", "", "", "")
call s:hi("goTypeName", s:colors.gui0A, "", "", "", "", "" )
call s:hi("goDeclType", s:colors.gui0C, "", "", "", "", "" )
call s:hi("goTypeDecl", s:colors.gui0E, "", "", "", "", "" )

"+---------------------+
"+ Rust Lang Highlight +
"+---------------------+
call s:hi("rustAttribute", s:colors.gui0D, "", "", "", "", "")
call s:hi("rustEnum", s:colors.gui09, "", "", "", s:colors.bold, "")
call s:hi("rustMacro", s:colors.gui0C, "", "", "", s:colors.bold, "")
call s:hi("rustModPath", s:colors.gui0A, "", "", "", "", "")
call s:hi("rustPanic", s:colors.gui08, "", "", "", s:colors.bold, "")
call s:hi("rustTrait", s:colors.gui0A, "", "", "", "italic", "")
hi! link rustCommentLineDoc Comment
hi! link rustDerive rustAttribute
hi! link rustEnumVariant rustEnum
hi! link rustEscape SpecialChar
hi! link rustQuestionMark Keyword

"+--------------------+
"+ CSS Lang Highlight +
"+--------------------+
call s:hi("cssAttrComma", s:colors.gui0E, "", "", "", "", "" )
call s:hi("cssAttributeSelector", s:colors.gui0B, "", "", "", "", "" )
call s:hi("cssBraces", s:colors.gui0E, "", "", "", "", "" )
call s:hi("cssClassName", s:colors.gui0A, "", "", "", "", "" )
call s:hi("cssClassNameDot", s:colors.gui0A, "", "", "", "", "" )
call s:hi("cssDefinition", s:colors.gui0E, "", "", "", "", "" )
call s:hi("cssFontAttr", s:colors.gui0A, "", "", "", "", "" )
call s:hi("cssFontDescriptor", s:colors.gui0E, "", "", "", "", "" )
call s:hi("cssFunctionName", s:colors.gui0D, "", "", "", "", "" )
call s:hi("cssIdentifier", s:colors.gui0D, "", "", "", "", "" )
call s:hi("cssImportant", s:colors.gui0E, "", "", "", "", "" )
call s:hi("cssInclude", s:colors.gui05, "", "", "", "", "" )
call s:hi("cssIncludeKeyword", s:colors.gui0E, "", "", "", "", "" )
call s:hi("cssMediaType", s:colors.gui0A, "", "", "", "", "" )
call s:hi("cssProp", s:colors.gui05, "", "", "", "", "" )
call s:hi("cssPseudoClassId", s:colors.gui0A, "", "", "", "", "" )
call s:hi("cssSelectorOp", s:colors.gui0E, "", "", "", "", "" )
call s:hi("cssSelectorOp2", s:colors.gui0E, "", "", "", "", "" )
call s:hi("cssTagName", s:colors.gui08, "", "", "", "", "" )

"+----------------------+
"+ Java Lang Hightlight +
"+----------------------+
" > Java motherfucker! Do you speak it?!?!
call s:hi("javaAnnotation", s:colors.gui0C, "", "", "", "italic", "")
call s:hi("javaDocTags", s:colors.gui0A, "", "", "", "italic", "")
call s:hi("javaCommentTitle", s:colors.gui03, "", "", "", "italic", "")
call s:hi("javaParen", s:colors.gui03, "", "", "", "italic", "")
call s:hi("javaParen1", s:colors.gui0B, "", "", "", "", "")
call s:hi("javaParen2", s:colors.gui0B, "", "", "", "", "")
call s:hi("javaParen3", s:colors.gui0B, "", "", "", "", "")
call s:hi("javaParen4", s:colors.gui0B, "", "", "", "", "")
call s:hi("javaParen5", s:colors.gui0B, "", "", "", "", "")
call s:hi("javaVarArg", s:colors.gui0C, "", "", "", "", "")

"+---------------------------+
"+ Vimscript Lang Hightlight +
"+---------------------------+
call s:hi("vimCommentTitle", s:colors.gui0D, "", "", "", "italic", "")
call s:hi("vimBracket", s:colors.gui0E, "", "", "", "", "")
call s:hi("vimMapModKey", s:colors.gui0D, "", "", "", "italic", "")
call s:hi("vimFuncSID", s:colors.gui0D, "", "", "", "italic", "")
call s:hi("vimSetSep", s:colors.gui0C, "", "", "", "", "")
call s:hi("vimSep", s:colors.gui08, "", "", "", "", "")
call s:hi("vimContinue", s:colors.gui0D, "", "", "", "", "")
call s:hi("vimNotation", s:colors.gui0A, "", "", "", "", "")
call s:hi("vimOper", s:colors.gui0E, "", "", "", "", "")

"+----------------------+
"+ JSON Lang Hightlight +
"+----------------------+
call s:hi("jsonCommentError", s:colors.gui0E, "", "", "", "", "")
call s:hi("jsonKeyword", s:colors.gui08, "", "", "", "", "")
call s:hi("jsonBoolean", s:colors.gui09, "", "", "", "", "")
call s:hi("jsonNumber", s:colors.gui09, "", "", "", "", "")
call s:hi("jsonQuote", s:colors.gui0C, "", "", "", "", "")
call s:hi("jsonMissingCommaError", s:colors.gui08, "", "", "", "reverse", "")
call s:hi("jsonNoQuotesError", s:colors.gui0F, "", "", "", "reverse", "")
call s:hi("jsonNumError", s:colors.gui0F, "", "", "", "reverse", "")
call s:hi("jsonString", s:colors.gui0B, "", "", "", "", "")
call s:hi("jsonStringSQError", s:colors.gui08, "", "", "", "reverse", "")
call s:hi("jsonSemicolonError", s:colors.gui08, "", "", "", "reverse", "")

"+-------------------------+
"+ Markdown Lang Highlight +
"+-------------------------+
call s:hi("markdownBlockquote", s:colors.gui0E, "", "", "", "", "" )
call s:hi("markdownBold", s:colors.gui0A, "", "", "", s:colors.bold, "")
call s:hi("markdownCode", s:colors.gui0B, "", "", "", "", "")
call s:hi("markdownCodeBlock", s:colors.gui0B, "", "", "", "", "")
call s:hi("markdownCodeDelimiter", s:colors.gui0B, "", "", "", "", "")
call s:hi("markdownH1", s:colors.gui08, "", "", "", "", "")
call s:hi("markdownH2", s:colors.gui08, "", "", "", "", "" )
call s:hi("markdownH3", s:colors.gui08, "", "", "", "", "" )
call s:hi("markdownH4", s:colors.gui08, "", "", "", "", "" )
call s:hi("markdownH5", s:colors.gui08, "", "", "", "", "" )
call s:hi("markdownH6", s:colors.gui08, "", "", "", "", "" )
call s:hi("markdownHeadingDelimiter", s:colors.gui08, "", "", "", "", "")
call s:hi("markdownHeadingRule", s:colors.gui0C, "", "", "", "", "")
call s:hi("markdownId", s:colors.gui0E, "", "", "", "", "")
call s:hi("markdownIdDeclaration", s:colors.gui0D, "", "", "", "", "")
call s:hi("markdownIdDelimiter", s:colors.gui0E, "", "", "", "", "")
call s:hi("markdownItalic", s:colors.gui0E, "", "", "", "italic", "")
call s:hi("markdownLinkDelimiter", s:colors.gui0E, "", "", "", "", "")
call s:hi("markdownLinkText", s:colors.gui0D, "", "", "", "", "")
call s:hi("markdownListMarker", s:colors.gui08, "", "", "", "", "")
call s:hi("markdownOrderedListMarker", s:colors.gui08, "", "", "", "", "")
call s:hi("markdownRule", s:colors.gui0D, "", "", "", "", "")
call s:hi("markdownUrl", s:colors.gui0C, "", "", "", "undercurl", "")

"+------------------------+
"+ Haskel Lang Hightlight +
"+------------------------+
call s:hi("haskellType", s:colors.gui0A, "", "", "", "", "")
call s:hi("haskellOperators", s:colors.gui0C, "", "", "", "", "")
call s:hi("haskellNumber", s:colors.gui09, "", "", "", "", "")
call s:hi("haskellPragma", s:colors.gui0E, "", "", "", "", "")

"+----------------------------+
"+ JavaScript Lang Hightlight +
"+----------------------------+
call s:hi("javaScriptBraces", s:colors.gui0C, "", "", "", "", "")
call s:hi("javaScriptFunction", s:colors.gui0A, "", "", "", "", "")
call s:hi("javaScriptIdentifier", s:colors.gui0A, "", "", "", "", "")
call s:hi("javaScriptNull", s:colors.gui08, "", "", "", "", "")
call s:hi("javaScriptNumber", s:colors.gui09, "", "", "", "", "")
call s:hi("javaScriptRequire", s:colors.gui0C, "", "", "", "", "")
call s:hi("javaScriptReserved", s:colors.gui0E, "", "", "", "", "" )
" https:colors.//github.com/pangloss/vim-javascript
call s:hi("jsArrowFunction", s:colors.gui0E, "", "", "", "", "" )
call s:hi("jsClassKeyword", s:colors.gui0E, "", "", "", "", "" )
call s:hi("jsClassMethodType", s:colors.gui0E, "", "", "", "", "" )
call s:hi("jsDocParam", s:colors.gui0D, "", "", "", "", "" )
call s:hi("jsDocTags", s:colors.gui0E, "", "", "", "", "" )
call s:hi("jsExport", s:colors.gui0E, "", "", "", "", "" )
call s:hi("jsExportDefault", s:colors.gui0E, "", "", "", "", "" )
call s:hi("jsExtendsKeyword", s:colors.gui0E, "", "", "", "", "" )
call s:hi("jsFrom", s:colors.gui0E, "", "", "", "", "" )
call s:hi("jsFuncCall", s:colors.gui0D, "", "", "", "", "" )
call s:hi("jsFunction", s:colors.gui0E, "", "", "", "", "" )
call s:hi("jsGenerator", s:colors.gui0A, "", "", "", "", "" )
call s:hi("jsGlobalObjects", s:colors.gui0A, "", "", "", "", "" )
call s:hi("jsImport", s:colors.gui0E, "", "", "", "", "" )
call s:hi("jsModuleAs", s:colors.gui0E, "", "", "", "", "" )
call s:hi("jsModuleWords", s:colors.gui0E, "", "", "", "", "" )
call s:hi("jsModules", s:colors.gui0E, "", "", "", "", "" )
call s:hi("jsNull", s:colors.gui0A, "", "", "", "", "" )
call s:hi("jsOperator", s:colors.gui0E, "", "", "", "", "" )
call s:hi("jsStorageClass", s:colors.gui0E, "", "", "", "", "" )
call s:hi("jsSuper", s:colors.gui08, "", "", "", "", "" )
call s:hi("jsTemplateBraces", s:colors.gui08, "", "", "", "", "" )
call s:hi("jsTemplateVar", s:colors.gui0B, "", "", "", "", "" )
call s:hi("jsThis", s:colors.gui08, "", "", "", "", "" )
call s:hi("jsUndefined", s:colors.gui0A, "", "", "", "", "" )

"+----------------------+
"+ Lisp Lang Hightlight +
"+----------------------+
"highlight! link lispAtomMark Purple
"highlight! link lispKey Orange
"highlight! link lispFunc Green

"+----------------------------+
"+ Typescript Lang Hightlight +
"+----------------------------+
call s:hi("typescriptReserved", s:colors.gui0A, "", "", "", "", "")
call s:hi("typeScriptLabel", s:colors.gui0C, "", "", "", "", "" )
call s:hi("typeScriptFuncKeyword", s:colors.gui08, "", "", "", "", "" )
call s:hi("typeScriptIdentifier", s:colors.gui0C, "", "", "", "", "" )
call s:hi("typeScriptDOMObjects", s:colors.gui0B, "", "", "", "", "")
call s:hi("typeScriptAjaxMethods", s:colors.gui0A, "", "", "", "", "")
call s:hi("typeScriptGlobalObject", s:colors.gui0A, "", "", "", "", "")
call s:hi("typeScriptInterpolationDelimiter", s:colors.gui0E, "", "", "", "", "")
call s:hi("typeScriptNull", s:colors.gui0E, "", "", "", "", "")
call s:hi("typeScriptNull", s:colors.gui0E, "", "", "", "", "")
call s:hi("typeScriptParens", s:colors.gui08, "", "", "", "", "")
hi! link typeScriptOpSymbols Boolean
hi! link typeScriptHtmlElemProperties Special
hi! link typeScriptLogicSymbols Boolean
hi! link typeScriptDocSeeTag Comment
hi! link typeScriptDocParam Comment
hi! link typeScriptDocTags vimCommentTitle

"+---------------------+
"+ HTML Lang Highlight +
"+---------------------+
call s:hi("htmlArg", s:colors.gui0A, "", "", "", "", "")
call s:hi("htmlBold", s:colors.gui0A, "", "", "", s:colors.bold, "")
call s:hi("htmlEndTag", s:colors.gui0E, "", "", "", "", "")
call s:hi("htmlH1", s:colors.gui08, "", "", "", "italic", "")
call s:hi("htmlH2", s:colors.gui08, "", "", "", "italic", "")
call s:hi("htmlH3", s:colors.gui08, "", "", "", "italic", "")
call s:hi("htmlH4", s:colors.gui08, "", "", "", "italic", "")
call s:hi("htmlH5", s:colors.gui08, "", "", "", "italic", "")
call s:hi("htmlH6", s:colors.gui08, "", "", "", "italic", "")
call s:hi("htmlItalic", s:colors.gui0E, "", "", "", "italic", "")
call s:hi("htmlLink", s:colors.gui0C, "", "", "", "undercurl", "")
call s:hi("htmlSpecialChar", s:colors.gui0A, "", "", "", "", "")
call s:hi("htmlSpecialTagName", s:colors.gui08, "", "", "", "", "")
call s:hi("htmlTag", s:colors.gui0D, "", "", "", "", "")
call s:hi("htmlTagN", s:colors.gui08, "", "", "", "", "")
call s:hi("htmlTagName", s:colors.gui08, "", "", "", "", "")
call s:hi("htmlTitle", s:colors.gui0D, "", "", "", "", "")

"+----------------------+
"+ PHP Lang Hightlight
"+----------------------+
call s:hi("phpVarSelector", s:colors.gui08, "", "", "", "", "" )
call s:hi("phpOperator", s:colors.gui08, "", "", "", "", "")
call s:hi("phpParent", s:colors.gui0C, "", "", "", "", "")
call s:hi("phpMemberSelector", s:colors.gui0D, "", "", "", "", "")
call s:hi("phpType", s:colors.gui0E, "", "", "", "", "")
call s:hi("phpKeyword", s:colors.gui0E, "", "", "", "", "" )
call s:hi("phpClass", s:colors.gui0A, "", "", "", "", "" )
call s:hi("phpUseClass", s:colors.gui0D, "", "", "", "", "" )
call s:hi("phpUseAlias", s:colors.gui0C, "", "", "", "", "" )
call s:hi("phpInclude", s:colors.gui0E, "", "", "", "", "" )
call s:hi("phpClassExtends", s:colors.gui0B, "", "", "", "", "" )
call s:hi("phpDocTags", s:colors.gui05, "", "", "", "", "" )
call s:hi("phpFunction", s:colors.gui0D, "", "", "", "", "" )
call s:hi("phpFunctions", s:colors.gui0C, "", "", "", "", "" )
call s:hi("phpMethodsVar", s:colors.gui0A, "", "", "", "", "" )
call s:hi("phpMagicConstants", s:colors.gui0A, "", "", "", "", "" )
call s:hi("phpSuperglobals", s:colors.gui08, "", "", "", "", "" )
call s:hi("phpConstants", s:colors.gui0A, "", "", "", "", "" )

"+--------------------+
" Perl Lang Highlight +
"+--------------------+
call s:hi("perlFiledescRead", s:colors.gui0B, "", "", "", "", "" )
call s:hi("perlFunction", s:colors.gui0E, "", "", "", "", "" )
call s:hi("perlMatchStartEnd", s:colors.gui0D, "", "", "", "", "" )
call s:hi("perlMethod", s:colors.gui0E, "", "", "", "", "" )
call s:hi("perlPOD", s:colors.gui01, "", "", "", "", "" )
call s:hi("perlSharpBang", s:colors.gui05, "", "", "", "", "" )
call s:hi("perlSpecialString", s:colors.gui0B, "", "", "", "", "" )
call s:hi("perlStatementFiledesc", s:colors.gui08, "", "", "", "", "" )
call s:hi("perlStatementFlow", s:colors.gui08, "", "", "", "", "" )
call s:hi("perlStatementInclude", s:colors.gui0E, "", "", "", "", "" )
call s:hi("perlStatementScalar", s:colors.gui0E, "", "", "", "", "" )
call s:hi("perlStatementStorage", s:colors.gui0E, "", "", "", "", "" )
call s:hi("perlSubName", s:colors.gui0A, "", "", "", "", "" )
call s:hi("perlVarPlain", s:colors.gui0D, "", "", "", "", "" )

"+---------------------+
"+ Ruby Lang Highlight +
"+---------------------+
call s:hi("rubyBlockParameter", s:colors.gui08, "", "", "", "", "")
call s:hi("rubyBlockParameterList", s:colors.gui08, "", "", "", "", "")
call s:hi("rubyClass", s:colors.gui0A, "", "", "", "", "")
call s:hi("rubyConstant", s:colors.gui0A, "", "", "", "", "")
call s:hi("rubyControl", s:colors.gui0A, "", "", "", "", "")
call s:hi("rubyEscape", s:colors.gui08, "", "", "", "", "")
call s:hi("rubyFunction", s:colors.gui0D, "", "", "", "", "")
call s:hi("rubyGlobalVariable", s:colors.gui08, "", "", "", "", "")
call s:hi("rubyInclude", s:colors.gui0D, "", "", "", "", "")
call s:hi("rubyIncluderubyGlobalVariable", s:colors.gui08, "", "", "", "", "")
call s:hi("rubyInstanceVariable", s:colors.gui08, "", "", "", "", "")
call s:hi("rubyInterpolation", s:colors.gui0C, "", "", "", "", "")
call s:hi("rubyInterpolationDelimiter", s:colors.gui08, "", "", "", "", "")
call s:hi("rubyInterpolationDelimiter", s:colors.gui08, "", "", "", "", "")
call s:hi("rubyRegexp", s:colors.gui0C, "", "", "", "", "")
call s:hi("rubyRegexpDelimiter", s:colors.gui0C, "", "", "", "", "")
call s:hi("rubyStringDelimiter", s:colors.gui0B, "", "", "", "", "")
call s:hi("rubySymbol", s:colors.gui0C, "", "", "", "", "")


"+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
"+ ---+ P L U G I N   F O R M A T +--- +
"+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

" fugitive.vim
" > tpope/vim-fugitive
call s:hi("gitcommitDiscardedFile", s:colors.gui08, "", "", "", "", "" )
call s:hi("gitcommitUntrackedFile", s:colors.gui0C, "", "", "", "", "" )
call s:hi("gitcommitSelectedFile", s:colors.gui0B, "", "", "", "", "" )
call s:hi("diffAdded", s:colors.gui0B, "", "", "", "", "" )
call s:hi("diffRemoved", s:colors.gui08, "", "", "", "", "" )

" Vim Clap
" > liuchengxu/vim-clap
let s:colors.save_cpo = &cpoptions
set cpoptions&vim
let s:colors.palette = {}
let s:colors.palette.display = { 'ctermbg': '0', 'guibg': 'gui01' }

" Let ClapInput, ClapSpinner and ClapSearchText use the same background.
let s:colors.bg0 = { 'ctermbg': '60', 'guibg': s:colors.gui00 }
let s:colors.palette.input = s:colors.bg0
let s:colors.palette.indicator = extend({ 'ctermfg': '238', 'guifg': s:colors.gui01 }, s:colors.bg0)
let s:colors.palette.spinner = extend({ 'ctermfg': '11', 'guifg': s:colors.gui0A, 'cterm': s:colors.bold, 'gui': s:colors.bold }, s:colors.bg0)
let s:colors.palette.search_text = extend({ 'ctermfg': '4', 'guifg': s:colors.gui0D, 'cterm': s:colors.bold, 'gui': s:colors.bold }, s:colors.bg0)
let s:colors.palette.preview = { 'ctermbg': '238', 'guibg': s:colors.gui00 }
let s:colors.palette.selected = { 'ctermfg': '81', 'guifg': s:colors.gui0C, 'cterm': 'bold,underline', 'gui': 'bold,underline' }
let s:colors.palette.current_selection = { 'ctermbg': '236', 'guibg': s:colors.gui01, 'cterm': s:colors.bold, 'gui': s:colors.bold }
let s:colors.palette.selected_sign = { 'ctermfg': '196', 'guifg': s:colors.gui0A }
let s:colors.palette.current_selection_sign = s:colors.palette.selected_sign

hi ClapShadow guibg=#3b3b4d

let g:clap_fuzzy_match_hl_groups = [
  \ ['75', s:colors.gui0A],
\ ]

let g:clap#themes#aquarium#palette = s:colors.palette
let &cpoptions = s:colors.save_cpo
unlet s:colors.save_cpo
let g:clap_theme = 'aquarium'

" vim-plug
" > junegunn/vim-plug
call s:hi("plugDeleted", s:colors.gui08, "", "", "", "italic", "")

" YAML
" > stephpy/vim-yaml
call s:hi("yamlKey", s:colors.gui08, "", "", "", "italic", "")

" JEDI
" > davidhalter/jedi-vim
call s:hi("jediFunction", s:colors.gui0E, s:colors.gui02, "", "", "italic", "")
call s:hi("jediFat", s:colors.gui0C, s:colors.gui02, "", "", "italic", "")

" Pandoc
" > vim-pandoc/vim-pandoc-syntax
call s:hi("pandocDefinitionBlockTerm", s:colors.gui08, "", "", "", "italic", "")
call s:hi("pandocTableDelims", s:colors.gui0E, "", "", "", "", "")
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
call s:hi("GitGutterAdd", s:colors.gui0B, "", "", "", "", "")
call s:hi("GitGutterChange", s:colors.gui0D, "", "", "", "", "")
call s:hi("GitGutterDelete", s:colors.gui08, "", "", "", "", "")
call s:hi("GitGutterChangeDelete", s:colors.gui0E, "", "", "", "", "")
highlight! link GitGutterChangeDelete PurpleSign

" Vim Sneak
" > justinmk/vim-sneak
call s:hi("Sneak", s:colors.gui09, s:colors.gui07, "", "", "", "")
call s:hi("SneakMask", s:colors.gui09, s:colors.gui07, "", "", "", "")
call s:hi("SneakLabel", s:colors.gui07, s:colors.gui07, "", "", "", "")
call s:hi("SneakScope", s:colors.gui0B, s:colors.gui07, "", "", "", "")

if has('nvim')

    " Treesitter
    " > nvim-treesitter/nvim-treesitter
    call s:hi("Constructor", s:colors.gui02, "", "", "", "", "")
    call s:hi("Emphasis", s:colors.gui02, "", "", "", "", "")
    call s:hi("Field", s:colors.gui0E, "", "", "", "", "")
    call s:hi("FunctionBuiltin", s:colors.gui0D, "", "", "", "", "")
    call s:hi("FuncMacro", s:colors.gui0E, "", "", "", "", "")
    call s:hi("Method", s:colors.gui0B, "", "", "", "", "")
    call s:hi("Parameter", s:colors.gui09, "", "", "", "", "")
    call s:hi("TypeBuiltin", s:colors.gui0F, "", "", "", "", "")
    call s:hi("TSTitle", s:colors.gui09, "", "", "", "", "")
    call s:hi("TreeSitterVariable", s:colors.gui0B, "", "", "", "", "")
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
    hi! link TSFloat Float
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
    hi! link TSVariable Variable
    hi! link TSVariableBuiltin TreeSitterVariable

    " NvimTree
    " >  kyazdani42/nvim-tree.lua
    call s:hi("NvimTreeExecFile", s:colors.gui0B, "", "", "", "", "")
    call s:hi("NvimTreeOpenedFile", s:colors.gui0A, "", "", "", s:colors.bold, "")
    call s:hi("NvimTreeSpecialFile", s:colors.gui09, "", "", "", "italic", "")
    call s:hi("NvimTreeMarkdownFile", s:colors.gui09, "", "", "", "", "")
    call s:hi("NvimTreeImageFile", s:colors.gui0E, "", "", "", "", "")
    call s:hi("NvimTreeRootFolder", s:colors.gui0C, "", "", "", "italic", "")
    call s:hi("NvimTreeFolderName", s:colors.gui02, "", "", "", "", "")
    call s:hi("NvimTreeFolderNormal", "", s:colors.gui07, "", "", "", "")

    hi! link LspDiagnosticsError Error
    hi! link LspDiagnosticsWarning healthWarning
    hi! link LspDiagnosticsInformation NvimTreeSpecialFile
    hi! link LspDiagnosticsHint Label

    call s:hi("NvimTreeGitDirty", s:colors.gui08, "", "", "", "underline", "")
    call s:hi("NvimTreeGitStaged", s:colors.gui0B, "", "", "", "", "")
    call s:hi("NvimTreeGitMerge", s:colors.gui0C, "", "", "", "", "")

    hi! link NvimTreeGitRenamed GitGutterChange
    hi! link NvimTreeGitNew GitGutterAdd
    hi! link NvimTreeGitDeleted GitGutterDelete

    call s:hi("NvimTreeWindowPicker", s:colors.gui03, "", "", "", "", "")

end

