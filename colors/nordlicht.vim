" Copyright (C) 2016-present Arctic Ice Studio <development@arcticicestudio.com>
" Copyright (C) 2016-present Sven Greb <development@svengreb.de>

" Project: Nord Vim
" Original Repository: https://github.com/arcticicestudio/nord-vim
" License: MIT

if version > 580
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif

let g:colors_name = "nordlicht"
let s:nordlicht_vim_version="0.1.0"
set background=light

let s:nordlicht0_gui = "#2E3440"
let s:nordlicht1_gui = "#3B4252"
let s:nordlicht2_gui = "#434C5E"
let s:nordlicht3_gui = "#4C566A"
let s:nordlicht3_gui_bright = "#616E88"
let s:nordlicht4_gui = "#D8DEE9"
let s:nordlicht5_gui = "#E5E9F0"
let s:nordlicht6_gui = "#ECEFF4"
let s:nordlicht7_gui = "#8FBCBB"
let s:nordlicht8_gui = "#88C0D0"
let s:nordlicht9_gui = "#81A1C1"
let s:nordlicht10_gui = "#5E81AC"
let s:nordlicht11_gui = "#BF616A"
let s:nordlicht12_gui = "#D08770"
let s:nordlicht13_gui = "#EBCB8B"
let s:nordlicht14_gui = "#A3BE8C"
let s:nordlicht15_gui = "#B48EAD"

let s:nordlicht1_term = "0"
let s:nordlicht2_term = "8"
let s:nordlicht3_term = "6"
let s:nordlicht4_term = "7"
let s:nordlicht5_term = "7"
let s:nordlicht6_term = "15"
let s:nordlicht7_term = "14"
let s:nordlicht8_term = "8"
let s:nordlicht9_term = "4"
let s:nordlicht10_term = "12"
let s:nordlicht11_term = "1"
let s:nordlicht12_term = "11"
let s:nordlicht13_term = "3"
let s:nordlicht14_term = "2"
let s:nordlicht15_term = "5"

" 9 10 13

let s:nordlicht3_gui_brightened = [
  \ s:nordlicht3_gui,
  \ "#4e586d",
  \ "#505b70",
  \ "#525d73",
  \ "#556076",
  \ "#576279",
  \ "#59647c",
  \ "#5b677f",
  \ "#5d6982",
  \ "#5f6c85",
  \ "#616e88",
  \ "#63718b",
  \ "#66738e",
  \ "#687591",
  \ "#6a7894",
  \ "#6d7a96",
  \ "#6f7d98",
  \ "#72809a",
  \ "#75829c",
  \ "#78859e",
  \ "#7b88a1",
\ ]

if !exists("g:nordlicht_bold")
  let g:nordlicht_bold = 1
endif

let s:bold = "bold,"
if g:nordlicht_bold == 0
  let s:bold = ""
endif

if !exists("g:nordlicht_italic")
  if has("gui_running") || $TERM_ITALICS == "true"
    let g:nordlicht_italic = 1
  else
    let g:nordlicht_italic = 0
  endif
endif

let s:italic = "italic,"
if g:nordlicht_italic == 0
  let s:italic = ""
endif

let s:underline = "underline,"
if ! get(g:, "nordlicht_underline", 1)
  let s:underline = "NONE,"
endif

let s:italicize_comments = ""
if exists("g:nordlicht_italic_comments")
  if g:nordlicht_italic_comments == 1
    let s:italicize_comments = s:italic
  endif
endif

if !exists('g:nordlicht_uniform_status_lines')
  let g:nordlicht_uniform_status_lines = 0
endif

function! s:logWarning(msg)
  echohl WarningMsg
  echomsg 'nordlicht: warning: ' . a:msg
  echohl None
endfunction

if exists("g:nordlicht_comment_brightness")
  call s:logWarning('Variable g:nordlicht_comment_brightness has been deprecated and will be removed in version 1.0.0!' .
                   \' The comment color brightness has been increased by 10% by default.' .
                   \' Please see https://github.com/arcticicestudio/nordlicht-vim/issues/145 for more details.')
  let g:nordlicht_comment_brightness = 10
endif

if !exists("g:nordlicht_uniform_diff_background")
  let g:nordlicht_uniform_diff_background = 0
endif

if !exists("g:nordlicht_cursor_line_number_background")
  let g:nordlicht_cursor_line_number_background = 0
endif

if !exists("g:nordlicht_bold_vertical_split_line")
  let g:nordlicht_bold_vertical_split_line = 0
endif

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
    exec "hi " . a:group . " gui=" . a:attr . " cterm=" . substitute(a:attr, "undercurl", s:underline, "")
  endif
  if a:guisp != ""
    exec "hi " . a:group . " guisp=" . a:guisp
  endif
endfunction

"+---------------+
"+ UI Components +
"+---------------+
"+--- Attributes ---+
call s:hi("Bold", "", "", "", "", s:bold, "")
call s:hi("Italic", "", "", "", "", s:italic, "")
call s:hi("Underline", "", "", "", "", s:underline, "")

"+--- Editor ---+
call s:hi("ColorColumn", "", s:nordlicht5_gui, "NONE", s:nordlicht5_term, "", "")
call s:hi("Cursor", s:nordlicht0_gui, s:nordlicht4_gui, "", "NONE", "", "")
call s:hi("CursorLine", "", s:nordlicht5_gui, "NONE", s:nordlicht5_term, "NONE", "")
call s:hi("Error", s:nordlicht0_gui, s:nordlicht11_gui, "", s:nordlicht11_term, "", "")
call s:hi("iCursor", s:nordlicht0_gui, s:nordlicht4_gui, "", "NONE", "", "")
call s:hi("LineNr", s:nordlicht3_gui, s:nordlicht5_gui, s:nordlicht3_term, s:nordlicht5_term, "", "")
call s:hi("MatchParen", s:nordlicht8_gui, s:nordlicht3_gui, s:nordlicht8_term, s:nordlicht3_term, "", "")
call s:hi("NonText", s:nordlicht2_gui, "", s:nordlicht3_term, "", "", "")
call s:hi("Normal", s:nordlicht4_gui, s:nordlicht0_gui, "NONE", "NONE", "", "")
call s:hi("PMenu", s:nordlicht4_gui, s:nordlicht2_gui, s:nordlicht4_term, s:nordlicht2_term, "NONE", "")
call s:hi("PmenuSbar", s:nordlicht4_gui, s:nordlicht2_gui, s:nordlicht4_term, s:nordlicht2_term, "", "")
call s:hi("PMenuSel", s:nordlicht8_gui, s:nordlicht3_gui, s:nordlicht8_term, s:nordlicht3_term, "", "")
call s:hi("PmenuThumb", s:nordlicht8_gui, s:nordlicht3_gui, "NONE", s:nordlicht3_term, "", "")
call s:hi("SpecialKey", s:nordlicht3_gui, "", s:nordlicht3_term, "", "", "")
call s:hi("SpellBad", s:nordlicht11_gui, s:nordlicht0_gui, s:nordlicht11_term, "NONE", "undercurl", s:nordlicht11_gui)
call s:hi("SpellCap", s:nordlicht13_gui, s:nordlicht0_gui, s:nordlicht13_term, "NONE", "undercurl", s:nordlicht13_gui)
call s:hi("SpellLocal", s:nordlicht5_gui, s:nordlicht0_gui, s:nordlicht5_term, "NONE", "undercurl", s:nordlicht5_gui)
call s:hi("SpellRare", s:nordlicht6_gui, s:nordlicht0_gui, s:nordlicht6_term, "NONE", "undercurl", s:nordlicht6_gui)
call s:hi("Visual", "", s:nordlicht12_gui, "", s:nordlicht12_term, "", "")
call s:hi("VisualNOS", "", s:nordlicht12_gui, "", s:nordlicht12_term, "", "")
"+- Neovim Support -+
call s:hi("healthError", s:nordlicht11_gui, s:nordlicht1_gui, s:nordlicht11_term, s:nordlicht1_term, "", "")
call s:hi("healthSuccess", s:nordlicht14_gui, s:nordlicht1_gui, s:nordlicht14_term, s:nordlicht1_term, "", "")
call s:hi("healthWarning", s:nordlicht13_gui, s:nordlicht1_gui, s:nordlicht13_term, s:nordlicht1_term, "", "")
call s:hi("TermCursorNC", "", s:nordlicht1_gui, "", s:nordlicht1_term, "", "")

"+- Vim 8 Terminal Colors -+
if has('terminal')
  let g:terminal_ansi_colors = [s:nordlicht1_gui, s:nordlicht11_gui, s:nordlicht14_gui, s:nordlicht13_gui, s:nordlicht9_gui, s:nordlicht15_gui, s:nordlicht8_gui, s:nordlicht5_gui, s:nordlicht3_gui, s:nordlicht11_gui, s:nordlicht14_gui, s:nordlicht13_gui, s:nordlicht9_gui, s:nordlicht15_gui, s:nordlicht7_gui, s:nordlicht6_gui]
endif

"+- Neovim Terminal Colors -+
if has('nvim')
  let g:terminal_color_0 = s:nordlicht1_gui
  let g:terminal_color_1 = s:nordlicht11_gui
  let g:terminal_color_2 = s:nordlicht14_gui
  let g:terminal_color_3 = s:nordlicht13_gui
  let g:terminal_color_4 = s:nordlicht9_gui
  let g:terminal_color_5 = s:nordlicht15_gui
  let g:terminal_color_6 = s:nordlicht8_gui
  let g:terminal_color_7 = s:nordlicht5_gui
  let g:terminal_color_8 = s:nordlicht3_gui
  let g:terminal_color_9 = s:nordlicht11_gui
  let g:terminal_color_10 = s:nordlicht14_gui
  let g:terminal_color_11 = s:nordlicht13_gui
  let g:terminal_color_12 = s:nordlicht9_gui
  let g:terminal_color_13 = s:nordlicht15_gui
  let g:terminal_color_14 = s:nordlicht7_gui
  let g:terminal_color_15 = s:nordlicht6_gui
endif

"+--- Gutter ---+
if g:nordlicht_cursor_line_number_background == 0
  call s:hi("CursorLineNr", s:nordlicht4_gui, s:nordlicht0_gui, s:nordlicht5_term, s:nordlicht3_term, "NONE", "")
else
  call s:hi("CursorLineNr", s:nordlicht4_gui, s:nordlicht1_gui, "NONE", s:nordlicht1_term, "NONE", "")
endif
call s:hi("Folded", s:nordlicht3_gui, s:nordlicht1_gui, s:nordlicht3_term, s:nordlicht1_term, s:bold, "")
call s:hi("FoldColumn", s:nordlicht3_gui, s:nordlicht0_gui, s:nordlicht3_term, "NONE", "", "")
call s:hi("SignColumn", s:nordlicht1_gui, s:nordlicht0_gui, s:nordlicht1_term, "NONE", "", "")

"+--- Navigation ---+
call s:hi("Directory", s:nordlicht8_gui, "", s:nordlicht8_term, "NONE", "", "")

"+--- Prompt/Status ---+
call s:hi("EndOfBuffer", s:nordlicht1_gui, "", s:nordlicht1_term, "NONE", "", "")
call s:hi("ErrorMsg", s:nordlicht4_gui, s:nordlicht11_gui, "NONE", s:nordlicht11_term, "", "")
call s:hi("ModeMsg", s:nordlicht4_gui, "", "", "", "", "")
call s:hi("MoreMsg", s:nordlicht4_gui, "", "", "", "", "")
call s:hi("Question", s:nordlicht4_gui, "", "NONE", "", "", "")
if g:nordlicht_uniform_status_lines == 0
  call s:hi("StatusLine", s:nordlicht8_gui, s:nordlicht3_gui, s:nordlicht8_term, s:nordlicht3_term, "NONE", "")
  call s:hi("StatusLineNC", s:nordlicht4_gui, s:nordlicht1_gui, "NONE", s:nordlicht1_term, "NONE", "")
  call s:hi("StatusLineTerm", s:nordlicht8_gui, s:nordlicht3_gui, s:nordlicht8_term, s:nordlicht3_term, "NONE", "")
  call s:hi("StatusLineTermNC", s:nordlicht4_gui, s:nordlicht1_gui, "NONE", s:nordlicht1_term, "NONE", "")
else
  call s:hi("StatusLine", s:nordlicht8_gui, s:nordlicht3_gui, s:nordlicht8_term, s:nordlicht3_term, "NONE", "")
  call s:hi("StatusLineNC", s:nordlicht4_gui, s:nordlicht3_gui, "NONE", s:nordlicht3_term, "NONE", "")
  call s:hi("StatusLineTerm", s:nordlicht8_gui, s:nordlicht3_gui, s:nordlicht8_term, s:nordlicht3_term, "NONE", "")
  call s:hi("StatusLineTermNC", s:nordlicht4_gui, s:nordlicht3_gui, "NONE", s:nordlicht3_term, "NONE", "")
endif
call s:hi("WarningMsg", s:nordlicht0_gui, s:nordlicht13_gui, s:nordlicht1_term, s:nordlicht13_term, "", "")
call s:hi("WildMenu", s:nordlicht8_gui, s:nordlicht1_gui, s:nordlicht8_term, s:nordlicht1_term, "", "")

"+--- Search ---+
call s:hi("IncSearch", s:nordlicht6_gui, s:nordlicht10_gui, s:nordlicht6_term, s:nordlicht10_term, s:underline, "")
call s:hi("Search", s:nordlicht1_gui, s:nordlicht8_gui, s:nordlicht1_term, s:nordlicht8_term, "NONE", "")

"+--- Tabs ---+
call s:hi("TabLine", s:nordlicht4_gui, s:nordlicht1_gui, "NONE", s:nordlicht1_term, "NONE", "")
call s:hi("TabLineFill", s:nordlicht4_gui, s:nordlicht1_gui, "NONE", s:nordlicht1_term, "NONE", "")
call s:hi("TabLineSel", s:nordlicht8_gui, s:nordlicht3_gui, s:nordlicht8_term, s:nordlicht3_term, "NONE", "")

"+--- Window ---+
call s:hi("Title", s:nordlicht4_gui, "", "NONE", "", "NONE", "")

if g:nordlicht_bold_vertical_split_line == 0
  call s:hi("VertSplit", s:nordlicht5_gui, s:nordlicht5_gui, s:nordlicht5_term, s:nordlicht5_term, "NONE", "")
else
  call s:hi("VertSplit", s:nordlicht2_gui, s:nordlicht1_gui, s:nordlicht3_term, s:nordlicht1_term, "NONE", "")
endif

"+----------------------+
"+ Language Base Groups +
"+----------------------+
call s:hi("Boolean", s:nordlicht9_gui, "", s:nordlicht9_term, "", "", "")
call s:hi("Character", s:nordlicht14_gui, "", s:nordlicht14_term, "", "", "")
call s:hi("Comment", s:nordlicht3_gui_bright, "", s:nordlicht3_term, "", s:italicize_comments, "")
call s:hi("Conditional", s:nordlicht9_gui, "", s:nordlicht9_term, "", "", "")
call s:hi("Constant", s:nordlicht4_gui, "", "NONE", "", "", "")
call s:hi("Define", s:nordlicht9_gui, "", s:nordlicht9_term, "", "", "")
call s:hi("Delimiter", s:nordlicht6_gui, "", s:nordlicht6_term, "", "", "")
call s:hi("Exception", s:nordlicht9_gui, "", s:nordlicht9_term, "", "", "")
call s:hi("Float", s:nordlicht15_gui, "", s:nordlicht15_term, "", "", "")
call s:hi("Function", s:nordlicht8_gui, "", s:nordlicht8_term, "", "", "")
call s:hi("Identifier", s:nordlicht4_gui, "", "NONE", "", "NONE", "")
call s:hi("Include", s:nordlicht9_gui, "", s:nordlicht9_term, "", "", "")
call s:hi("Keyword", s:nordlicht9_gui, "", s:nordlicht9_term, "", "", "")
call s:hi("Label", s:nordlicht9_gui, "", s:nordlicht9_term, "", "", "")
call s:hi("Number", s:nordlicht15_gui, "", s:nordlicht15_term, "", "", "")
call s:hi("Operator", s:nordlicht9_gui, "", s:nordlicht9_term, "", "NONE", "")
call s:hi("PreProc", s:nordlicht9_gui, "", s:nordlicht9_term, "", "NONE", "")
call s:hi("Repeat", s:nordlicht9_gui, "", s:nordlicht9_term, "", "", "")
call s:hi("Special", s:nordlicht4_gui, "", "NONE", "", "", "")
call s:hi("SpecialChar", s:nordlicht13_gui, "", s:nordlicht13_term, "", "", "")
call s:hi("SpecialComment", s:nordlicht8_gui, "", s:nordlicht8_term, "", s:italicize_comments, "")
call s:hi("Statement", s:nordlicht9_gui, "", s:nordlicht9_term, "", "", "")
call s:hi("StorageClass", s:nordlicht9_gui, "", s:nordlicht9_term, "", "", "")
call s:hi("String", s:nordlicht14_gui, "", s:nordlicht14_term, "", "", "")
call s:hi("Structure", s:nordlicht9_gui, "", s:nordlicht9_term, "", "", "")
call s:hi("Tag", s:nordlicht4_gui, "", "", "", "", "")
call s:hi("Todo", s:nordlicht13_gui, "NONE", s:nordlicht13_term, "NONE", "", "")
call s:hi("Type", s:nordlicht9_gui, "", s:nordlicht9_term, "", "NONE", "")
call s:hi("Typedef", s:nordlicht9_gui, "", s:nordlicht9_term, "", "", "")
hi! link Macro Define
hi! link PreCondit PreProc

"+-----------+
"+ Languages +
"+-----------+
call s:hi("asciidocAttributeEntry", s:nordlicht10_gui, "", s:nordlicht10_term, "", "", "")
call s:hi("asciidocAttributeList", s:nordlicht10_gui, "", s:nordlicht10_term, "", "", "")
call s:hi("asciidocAttributeRef", s:nordlicht10_gui, "", s:nordlicht10_term, "", "", "")
call s:hi("asciidocHLabel", s:nordlicht9_gui, "", s:nordlicht9_term, "", "", "")
call s:hi("asciidocListingBlock", s:nordlicht7_gui, "", s:nordlicht7_term, "", "", "")
call s:hi("asciidocMacroAttributes", s:nordlicht8_gui, "", s:nordlicht8_term, "", "", "")
call s:hi("asciidocOneLineTitle", s:nordlicht8_gui, "", s:nordlicht8_term, "", "", "")
call s:hi("asciidocPassthroughBlock", s:nordlicht9_gui, "", s:nordlicht9_term, "", "", "")
call s:hi("asciidocQuotedMonospaced", s:nordlicht7_gui, "", s:nordlicht7_term, "", "", "")
call s:hi("asciidocTriplePlusPassthrough", s:nordlicht7_gui, "", s:nordlicht7_term, "", "", "")
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

call s:hi("awkCharClass", s:nordlicht7_gui, "", s:nordlicht7_term, "", "", "")
call s:hi("awkPatterns", s:nordlicht9_gui, "", s:nordlicht9_term, "", s:bold, "")
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

call s:hi("cIncluded", s:nordlicht7_gui, "", s:nordlicht7_term, "", "", "")
hi! link cOperator Operator
hi! link cPreCondit PreCondit

call s:hi("cmakeGeneratorExpression", s:nordlicht10_gui, "", s:nordlicht10_term, "", "", "")

hi! link csPreCondit PreCondit
hi! link csType Type
hi! link csXmlTag SpecialComment

call s:hi("cssAttributeSelector", s:nordlicht7_gui, "", s:nordlicht7_term, "", "", "")
call s:hi("cssDefinition", s:nordlicht7_gui, "", s:nordlicht7_term, "", "NONE", "")
call s:hi("cssIdentifier", s:nordlicht7_gui, "", s:nordlicht7_term, "", s:underline, "")
call s:hi("cssStringQ", s:nordlicht7_gui, "", s:nordlicht7_term, "", "", "")
hi! link cssAttr Keyword
hi! link cssBraces Delimiter
hi! link cssClassName cssDefinition
hi! link cssColor Number
hi! link cssProp cssDefinition
hi! link cssPseudoClass cssDefinition
hi! link cssPseudoClassId cssPseudoClass
hi! link cssVendor Keyword

call s:hi("dosiniHeader", s:nordlicht8_gui, "", s:nordlicht8_term, "", "", "")
hi! link dosiniLabel Type

call s:hi("dtBooleanKey", s:nordlicht7_gui, "", s:nordlicht7_term, "", "", "")
call s:hi("dtExecKey", s:nordlicht7_gui, "", s:nordlicht7_term, "", "", "")
call s:hi("dtLocaleKey", s:nordlicht7_gui, "", s:nordlicht7_term, "", "", "")
call s:hi("dtNumericKey", s:nordlicht7_gui, "", s:nordlicht7_term, "", "", "")
call s:hi("dtTypeKey", s:nordlicht7_gui, "", s:nordlicht7_term, "", "", "")
hi! link dtDelim Delimiter
hi! link dtLocaleValue Keyword
hi! link dtTypeValue Keyword

if g:nordlicht_uniform_diff_background == 0
  call s:hi("DiffAdd", s:nordlicht14_gui, s:nordlicht0_gui, s:nordlicht14_term, "NONE", "inverse", "")
  call s:hi("DiffChange", s:nordlicht13_gui, s:nordlicht0_gui, s:nordlicht13_term, "NONE", "inverse", "")
  call s:hi("DiffDelete", s:nordlicht11_gui, s:nordlicht0_gui, s:nordlicht11_term, "NONE", "inverse", "")
  call s:hi("DiffText", s:nordlicht9_gui, s:nordlicht0_gui, s:nordlicht9_term, "NONE", "inverse", "")
else
  call s:hi("DiffAdd", s:nordlicht14_gui, s:nordlicht1_gui, s:nordlicht14_term, s:nordlicht1_term, "", "")
  call s:hi("DiffChange", s:nordlicht13_gui, s:nordlicht1_gui, s:nordlicht13_term, s:nordlicht1_term, "", "")
  call s:hi("DiffDelete", s:nordlicht11_gui, s:nordlicht1_gui, s:nordlicht11_term, s:nordlicht1_term, "", "")
  call s:hi("DiffText", s:nordlicht9_gui, s:nordlicht1_gui, s:nordlicht9_term, s:nordlicht1_term, "", "")
endif
" Legacy groups for official git.vim and diff.vim syntax
hi! link diffAdded DiffAdd
hi! link diffChanged DiffChange
hi! link diffRemoved DiffDelete

call s:hi("gitconfigVariable", s:nordlicht7_gui, "", s:nordlicht7_term, "", "", "")

call s:hi("goBuiltins", s:nordlicht7_gui, "", s:nordlicht7_term, "", "", "")
hi! link goConstants Keyword

call s:hi("helpBar", s:nordlicht3_gui, "", s:nordlicht3_term, "", "", "")
call s:hi("helpHyperTextJump", s:nordlicht8_gui, "", s:nordlicht8_term, "", s:underline, "")

call s:hi("htmlArg", s:nordlicht7_gui, "", s:nordlicht7_term, "", "", "")
call s:hi("htmlLink", s:nordlicht4_gui, "", "", "", "NONE", "NONE")
hi! link htmlBold Bold
hi! link htmlEndTag htmlTag
hi! link htmlItalic Italic
hi! link htmlH1 markdownH1
hi! link htmlH2 markdownH1
hi! link htmlH3 markdownH1
hi! link htmlH4 markdownH1
hi! link htmlH5 markdownH1
hi! link htmlH6 markdownH1
hi! link htmlSpecialChar SpecialChar
hi! link htmlTag Keyword
hi! link htmlTagN htmlTag

call s:hi("javaDocTags", s:nordlicht7_gui, "", s:nordlicht7_term, "", "", "")
hi! link javaCommentTitle Comment
hi! link javaScriptBraces Delimiter
hi! link javaScriptIdentifier Keyword
hi! link javaScriptNumber Number

call s:hi("jsonKeyword", s:nordlicht7_gui, "", s:nordlicht7_term, "", "", "")

call s:hi("lessClass", s:nordlicht7_gui, "", s:nordlicht7_term, "", "", "")
hi! link lessAmpersand Keyword
hi! link lessCssAttribute Delimiter
hi! link lessFunction Function
hi! link cssSelectorOp Keyword

hi! link lispAtomBarSymbol SpecialChar
hi! link lispAtomList SpecialChar
hi! link lispAtomMark Keyword
hi! link lispBarSymbol SpecialChar
hi! link lispFunc Function

hi! link luaFunc Function

call s:hi("markdownBlockquote", s:nordlicht7_gui, "", s:nordlicht7_term, "", "", "")
call s:hi("markdownCode", s:nordlicht7_gui, "", s:nordlicht7_term, "", "", "")
call s:hi("markdownCodeDelimiter", s:nordlicht7_gui, "", s:nordlicht7_term, "", "", "")
call s:hi("markdownFootnote", s:nordlicht7_gui, "", s:nordlicht7_term, "", "", "")
call s:hi("markdownId", s:nordlicht7_gui, "", s:nordlicht7_term, "", "", "")
call s:hi("markdownIdDeclaration", s:nordlicht7_gui, "", s:nordlicht7_term, "", "", "")
call s:hi("markdownH1", s:nordlicht8_gui, "", s:nordlicht8_term, "", "", "")
call s:hi("markdownLinkText", s:nordlicht8_gui, "", s:nordlicht8_term, "", "", "")
call s:hi("markdownUrl", s:nordlicht4_gui, "", "NONE", "", "NONE", "")
hi! link markdownBold Bold
hi! link markdownBoldDelimiter Keyword
hi! link markdownFootnoteDefinition markdownFootnote
hi! link markdownH2 markdownH1
hi! link markdownH3 markdownH1
hi! link markdownH4 markdownH1
hi! link markdownH5 markdownH1
hi! link markdownH6 markdownH1
hi! link markdownIdDelimiter Keyword
hi! link markdownItalic Italic
hi! link markdownItalicDelimiter Keyword
hi! link markdownLinkDelimiter Keyword
hi! link markdownLinkTextDelimiter Keyword
hi! link markdownListMarker Keyword
hi! link markdownRule Keyword
hi! link markdownHeadingDelimiter Keyword

call s:hi("perlPackageDecl", s:nordlicht7_gui, "", s:nordlicht7_term, "", "", "")

call s:hi("phpClasses", s:nordlicht7_gui, "", s:nordlicht7_term, "", "", "")
call s:hi("phpDocTags", s:nordlicht7_gui, "", s:nordlicht7_term, "", "", "")
hi! link phpDocCustomTags phpDocTags
hi! link phpMemberSelector Keyword

call s:hi("podCmdText", s:nordlicht7_gui, "", s:nordlicht7_term, "", "", "")
call s:hi("podVerbatimLine", s:nordlicht4_gui, "", "NONE", "", "", "")
hi! link podFormat Keyword

hi! link pythonBuiltin Type
hi! link pythonEscape SpecialChar

call s:hi("rubyConstant", s:nordlicht7_gui, "", s:nordlicht7_term, "", "", "")
call s:hi("rubySymbol", s:nordlicht6_gui, "", s:nordlicht6_term, "", s:bold, "")
hi! link rubyAttribute Identifier
hi! link rubyBlockParameterList Operator
hi! link rubyInterpolationDelimiter Keyword
hi! link rubyKeywordAsMethod Function
hi! link rubyLocalVariableOrMethod Function
hi! link rubyPseudoVariable Keyword
hi! link rubyRegexp SpecialChar

call s:hi("rustAttribute", s:nordlicht10_gui, "", s:nordlicht10_term, "", "", "")
call s:hi("rustEnum", s:nordlicht7_gui, "", s:nordlicht7_term, "", s:bold, "")
call s:hi("rustMacro", s:nordlicht8_gui, "", s:nordlicht8_term, "", s:bold, "")
call s:hi("rustModPath", s:nordlicht7_gui, "", s:nordlicht7_term, "", "", "")
call s:hi("rustPanic", s:nordlicht9_gui, "", s:nordlicht9_term, "", s:bold, "")
call s:hi("rustTrait", s:nordlicht7_gui, "", s:nordlicht7_term, "", s:italic, "")
hi! link rustCommentLineDoc Comment
hi! link rustDerive rustAttribute
hi! link rustEnumVariant rustEnum
hi! link rustEscape SpecialChar
hi! link rustQuestionMark Keyword

call s:hi("sassClass", s:nordlicht7_gui, "", s:nordlicht7_term, "", "", "")
call s:hi("sassId", s:nordlicht7_gui, "", s:nordlicht7_term, "", s:underline, "")
hi! link sassAmpersand Keyword
hi! link sassClassChar Delimiter
hi! link sassControl Keyword
hi! link sassControlLine Keyword
hi! link sassExtend Keyword
hi! link sassFor Keyword
hi! link sassFunctionDecl Keyword
hi! link sassFunctionName Function
hi! link sassidChar sassId
hi! link sassInclude SpecialChar
hi! link sassMixinName Function
hi! link sassMixing SpecialChar
hi! link sassReturn Keyword

hi! link shCmdParenRegion Delimiter
hi! link shCmdSubRegion Delimiter
hi! link shDerefSimple Identifier
hi! link shDerefVar Identifier

hi! link sqlKeyword Keyword
hi! link sqlSpecial Keyword

call s:hi("vimAugroup", s:nordlicht7_gui, "", s:nordlicht7_term, "", "", "")
call s:hi("vimMapRhs", s:nordlicht7_gui, "", s:nordlicht7_term, "", "", "")
call s:hi("vimNotation", s:nordlicht7_gui, "", s:nordlicht7_term, "", "", "")
hi! link vimFunc Function
hi! link vimFunction Function
hi! link vimUserFunc Function

call s:hi("xmlAttrib", s:nordlicht7_gui, "", s:nordlicht7_term, "", "", "")
call s:hi("xmlCdataStart", s:nordlicht3_gui_bright, "", s:nordlicht3_term, "", s:bold, "")
call s:hi("xmlNamespace", s:nordlicht7_gui, "", s:nordlicht7_term, "", "", "")
hi! link xmlAttribPunct Delimiter
hi! link xmlCdata Comment
hi! link xmlCdataCdata xmlCdataStart
hi! link xmlCdataEnd xmlCdataStart
hi! link xmlEndTag xmlTagName
hi! link xmlProcessingDelim Keyword
hi! link xmlTagName Keyword

call s:hi("yamlBlockMappingKey", s:nordlicht7_gui, "", s:nordlicht7_term, "", "", "")
hi! link yamlBool Keyword
hi! link yamlDocumentStart Keyword

"+----------------+
"+ Plugin Support +
"+----------------+
"+--- UI ---+
" ALE
" > w0rp/ale
call s:hi("ALEWarningSign", s:nordlicht13_gui, "", s:nordlicht13_term, "", "", "")
call s:hi("ALEErrorSign" , s:nordlicht11_gui, "", s:nordlicht11_term, "", "", "")
call s:hi("ALEWarning" , s:nordlicht13_gui, "", s:nordlicht13_term, "", "undercurl", "")
call s:hi("ALEError" , s:nordlicht11_gui, "", s:nordlicht11_term, "", "undercurl", "")

" Coc
" > neoclide/coc
call s:hi("CocWarningSign", s:nordlicht13_gui, "", s:nordlicht13_term, "", "", "")
call s:hi("CocErrorSign" , s:nordlicht11_gui, "", s:nordlicht11_term, "", "", "")
call s:hi("CocInfoSign" , s:nordlicht8_gui, "", s:nordlicht8_term, "", "", "")
call s:hi("CocHintSign" , s:nordlicht10_gui, "", s:nordlicht10_term, "", "", "")

" Nvim LSP
" > neovim/nvim-lsp
call s:hi("LSPDiagnosticsWarning", s:nordlicht13_gui, "", s:nordlicht13_term, "", "", "")
call s:hi("LSPDiagnosticsError" , s:nordlicht11_gui, "", s:nordlicht11_term, "", "", "")
call s:hi("LSPDiagnosticsInformation" , s:nordlicht8_gui, "", s:nordlicht8_term, "", "", "")
call s:hi("LSPDiagnosticsHint" , s:nordlicht10_gui, "", s:nordlicht10_term, "", "", "")


" GitGutter
" > airblade/vim-gitgutter
call s:hi("GitGutterAdd", s:nordlicht14_gui, "", s:nordlicht14_term, "", "", "")
call s:hi("GitGutterChange", s:nordlicht13_gui, "", s:nordlicht13_term, "", "", "")
call s:hi("GitGutterChangeDelete", s:nordlicht11_gui, "", s:nordlicht11_term, "", "", "")
call s:hi("GitGutterDelete", s:nordlicht11_gui, "", s:nordlicht11_term, "", "", "")

" Signify
" > mhinz/vim-signify
call s:hi("SignifySignAdd", s:nordlicht14_gui, "", s:nordlicht14_term, "", "", "")
call s:hi("SignifySignChange", s:nordlicht13_gui, "", s:nordlicht13_term, "", "", "")
call s:hi("SignifySignChangeDelete", s:nordlicht11_gui, "", s:nordlicht11_term, "", "", "")
call s:hi("SignifySignDelete", s:nordlicht11_gui, "", s:nordlicht11_term, "", "", "")

" fugitive.vim
" > tpope/vim-fugitive
call s:hi("gitcommitDiscardedFile", s:nordlicht11_gui, "", s:nordlicht11_term, "", "", "")
call s:hi("gitcommitUntrackedFile", s:nordlicht11_gui, "", s:nordlicht11_term, "", "", "")
call s:hi("gitcommitSelectedFile", s:nordlicht14_gui, "", s:nordlicht14_term, "", "", "")

" davidhalter/jedi-vim
call s:hi("jediFunction", s:nordlicht4_gui, s:nordlicht3_gui, "", s:nordlicht3_term, "", "")
call s:hi("jediFat", s:nordlicht8_gui, s:nordlicht3_gui, s:nordlicht8_term, s:nordlicht3_term, s:underline.s:bold, "")

" NERDTree
" > scrooloose/nerdtree
call s:hi("NERDTreeExecFile", s:nordlicht7_gui, "", s:nordlicht7_term, "", "", "")
hi! link NERDTreeDirSlash Keyword
hi! link NERDTreeHelp Comment

" CtrlP
" > ctrlpvim/ctrlp.vim
hi! link CtrlPMatch Keyword
hi! link CtrlPBufferHid Normal

" vim-plug
" > junegunn/vim-plug
call s:hi("plugDeleted", s:nordlicht11_gui, "", "", s:nordlicht11_term, "", "")

" vim-signature
" > kshenoy/vim-signature
call s:hi("SignatureMarkText", s:nordlicht8_gui, "", s:nordlicht8_term, "", "", "")

" vim-startify
" > mhinz/vim-startify
call s:hi("StartifyFile", s:nordlicht6_gui, "", s:nordlicht6_term, "", "", "")
call s:hi("StartifyFooter", s:nordlicht7_gui, "", s:nordlicht7_term, "", "", "")
call s:hi("StartifyHeader", s:nordlicht8_gui, "", s:nordlicht8_term, "", "", "")
call s:hi("StartifyNumber", s:nordlicht7_gui, "", s:nordlicht7_term, "", "", "")
call s:hi("StartifyPath", s:nordlicht8_gui, "", s:nordlicht8_term, "", "", "")
hi! link StartifyBracket Delimiter
hi! link StartifySlash Normal
hi! link StartifySpecial Comment

"+--- Languages ---+
" Haskell
" > neovimhaskell/haskell-vim
call s:hi("haskellPreProc", s:nordlicht10_gui, "", s:nordlicht10_term, "", "", "")
call s:hi("haskellType", s:nordlicht7_gui, "", s:nordlicht7_term, "", "", "")
hi! link haskellPragma haskellPreProc

" JavaScript
" > pangloss/vim-javascript
call s:hi("jsGlobalNodeObjects", s:nordlicht8_gui, "", s:nordlicht8_term, "", s:italic, "")
hi! link jsBrackets Delimiter
hi! link jsFuncCall Function
hi! link jsFuncParens Delimiter
hi! link jsThis Keyword
hi! link jsNoise Delimiter
hi! link jsPrototype Keyword
hi! link jsRegexpString SpecialChar

" Markdown
" > plasticboy/vim-markdown
call s:hi("mkdCode", s:nordlicht7_gui, "", s:nordlicht7_term, "", "", "")
call s:hi("mkdFootnote", s:nordlicht8_gui, "", s:nordlicht8_term, "", "", "")
call s:hi("mkdRule", s:nordlicht10_gui, "", s:nordlicht10_term, "", "", "")
call s:hi("mkdLineBreak", s:nordlicht9_gui, "", s:nordlicht9_term, "", "", "")
hi! link mkdBold Bold
hi! link mkdItalic Italic
hi! link mkdString Keyword
hi! link mkdCodeStart mkdCode
hi! link mkdCodeEnd mkdCode
hi! link mkdBlockquote Comment
hi! link mkdListItem Keyword
hi! link mkdListItemLine Normal
hi! link mkdFootnotes mkdFootnote
hi! link mkdLink markdownLinkText
hi! link mkdURL markdownUrl
hi! link mkdInlineURL mkdURL
hi! link mkdID Identifier
hi! link mkdLinkDef mkdLink
hi! link mkdLinkDefTarget mkdURL
hi! link mkdLinkTitle mkdInlineURL
hi! link mkdDelimiter Keyword

" Vimwiki
" > vimwiki/vimwiki
if !exists("g:vimwiki_hl_headers") || g:vimwiki_hl_headers == 0
  for s:i in range(1,6)
    call s:hi("VimwikiHeader".s:i, s:nordlicht8_gui, "", s:nordlicht8_term, "", s:bold, "")
  endfor
else
  let s:vimwiki_hcolor_guifg = [s:nordlicht7_gui, s:nordlicht8_gui, s:nordlicht9_gui, s:nordlicht10_gui, s:nordlicht14_gui, s:nordlicht15_gui]
  let s:vimwiki_hcolor_ctermfg = [s:nordlicht7_term, s:nordlicht8_term, s:nordlicht9_term, s:nordlicht10_term, s:nordlicht14_term, s:nordlicht15_term]
  for s:i in range(1,6)
    call s:hi("VimwikiHeader".s:i, s:vimwiki_hcolor_guifg[s:i-1] , "", s:vimwiki_hcolor_ctermfg[s:i-1], "", s:bold, "")
  endfor
endif

call s:hi("VimwikiLink", s:nordlicht8_gui, "", s:nordlicht8_term, "", s:underline, "")
hi! link VimwikiHeaderChar markdownHeadingDelimiter
hi! link VimwikiHR Keyword
hi! link VimwikiList markdownListMarker

" YAML
" > stephpy/vim-yaml
call s:hi("yamlKey", s:nordlicht7_gui, "", s:nordlicht7_term, "", "", "")
