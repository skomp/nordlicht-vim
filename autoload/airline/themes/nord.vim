" Copyright (C) 2016-present Arctic Ice Studio <development@arcticicestudio.com>
" Copyright (C) 2016-present Sven Greb <development@svengreb.de>

" Project: Nord Vim
" Original Repository: https://github.com/arcticicestudio/nord-vim
" License: MIT

let s:nordlicht_vim_version="0.13.0"
let g:airline#themes#nordlicht#palette = {}

let s:nordlicht0_gui = "#2E3440"
let s:nordlicht1_gui = "#3B4252"
let s:nordlicht2_gui = "#434C5E"
let s:nordlicht3_gui = "#4C566A"
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

let s:nordlicht0_term = "NONE"
let s:nordlicht1_term = "0"
let s:nordlicht2_term = "NONE"
let s:nordlicht4_term = "NONE"
let s:nordlicht11_term = "1"
let s:nordlicht14_term = "2"
let s:nordlicht13_term = "3"
let s:nordlicht9_term = "4"
let s:nordlicht15_term = "5"
let s:nordlicht8_term = "6"
let s:nordlicht5_term = "7"
let s:nordlicht3_term = "8"
let s:nordlicht12_term = "11"
let s:nordlicht10_term = "12"
let s:nordlicht7_term = "14"
let s:nordlicht6_term = "15"

let s:NMain = [s:nordlicht1_gui, s:nordlicht8_gui, s:nordlicht1_term, s:nordlicht8_term]
let s:NRight = [s:nordlicht1_gui, s:nordlicht9_gui, s:nordlicht1_term, s:nordlicht9_term]
let s:NMiddle = [s:nordlicht5_gui, s:nordlicht3_gui, s:nordlicht5_term, s:nordlicht3_term]
let s:NWarn = [s:nordlicht1_gui, s:nordlicht13_gui, s:nordlicht3_term, s:nordlicht13_term]
let s:NError = [s:nordlicht0_gui, s:nordlicht11_gui, s:nordlicht1_term, s:nordlicht11_term]
let g:airline#themes#nordlicht#palette.normal = airline#themes#generate_color_map(s:NMain, s:NRight, s:NMiddle)
let g:airline#themes#nordlicht#palette.normal.airline_warning = s:NWarn
let g:airline#themes#nordlicht#palette.normal.airline_error = s:NError

let s:IMain = [s:nordlicht1_gui, s:nordlicht14_gui, s:nordlicht1_term, s:nordlicht6_term]
let s:IRight = [s:nordlicht1_gui, s:nordlicht9_gui, s:nordlicht1_term, s:nordlicht9_term]
let s:IMiddle = [s:nordlicht5_gui, s:nordlicht3_gui, s:nordlicht5_term, s:nordlicht3_term]
let s:IWarn = [s:nordlicht1_gui, s:nordlicht13_gui, s:nordlicht3_term, s:nordlicht13_term]
let s:IError = [s:nordlicht0_gui, s:nordlicht11_gui, s:nordlicht1_term, s:nordlicht11_term]
let g:airline#themes#nordlicht#palette.insert = airline#themes#generate_color_map(s:IMain, s:IRight, s:IMiddle)
let g:airline#themes#nordlicht#palette.insert.airline_warning = s:IWarn
let g:airline#themes#nordlicht#palette.insert.airline_error = s:IError

let s:RMain = [s:nordlicht1_gui, s:nordlicht14_gui, s:nordlicht1_term, s:nordlicht14_term]
let s:RRight = [s:nordlicht1_gui, s:nordlicht9_gui, s:nordlicht1_term, s:nordlicht9_term]
let s:RMiddle = [s:nordlicht5_gui, s:nordlicht3_gui, s:nordlicht5_term, s:nordlicht3_term]
let s:RWarn = [s:nordlicht1_gui, s:nordlicht13_gui, s:nordlicht3_term, s:nordlicht13_term]
let s:RError = [s:nordlicht0_gui, s:nordlicht11_gui, s:nordlicht1_term, s:nordlicht11_term]
let g:airline#themes#nordlicht#palette.replace = airline#themes#generate_color_map(s:RMain, s:RRight, s:RMiddle)
let g:airline#themes#nordlicht#palette.replace.airline_warning = s:RWarn
let g:airline#themes#nordlicht#palette.replace.airline_error = s:RError

let s:VMain = [s:nordlicht1_gui, s:nordlicht7_gui, s:nordlicht1_term, s:nordlicht7_term]
let s:VRight = [s:nordlicht1_gui, s:nordlicht9_gui, s:nordlicht1_term, s:nordlicht9_term]
let s:VMiddle = [s:nordlicht5_gui, s:nordlicht3_gui, s:nordlicht5_term, s:nordlicht3_term]
let s:VWarn = [s:nordlicht1_gui, s:nordlicht13_gui, s:nordlicht3_term, s:nordlicht13_term]
let s:VError = [s:nordlicht0_gui, s:nordlicht11_gui, s:nordlicht1_term, s:nordlicht11_term]
let g:airline#themes#nordlicht#palette.visual = airline#themes#generate_color_map(s:VMain, s:VRight, s:VMiddle)
let g:airline#themes#nordlicht#palette.visual.airline_warning = s:VWarn
let g:airline#themes#nordlicht#palette.visual.airline_error = s:VError

let s:IAMain = [s:nordlicht5_gui, s:nordlicht3_gui, s:nordlicht5_term, s:nordlicht3_term]
let s:IARight = [s:nordlicht5_gui, s:nordlicht3_gui, s:nordlicht5_term, s:nordlicht3_term]
if g:nordlicht_uniform_status_lines == 0
  let s:IAMiddle = [s:nordlicht5_gui, s:nordlicht1_gui, s:nordlicht5_term, s:nordlicht1_term]
else
  let s:IAMiddle = [s:nordlicht5_gui, s:nordlicht3_gui, s:nordlicht5_term, s:nordlicht3_term]
endif
let s:IAWarn = [s:nordlicht1_gui, s:nordlicht13_gui, s:nordlicht3_term, s:nordlicht13_term]
let s:IAError = [s:nordlicht0_gui, s:nordlicht11_gui, s:nordlicht1_term, s:nordlicht11_term]
let g:airline#themes#nordlicht#palette.inactive = airline#themes#generate_color_map(s:IAMain, s:IARight, s:IAMiddle)
let g:airline#themes#nordlicht#palette.inactive.airline_warning = s:IAWarn
let g:airline#themes#nordlicht#palette.inactive.airline_error = s:IAError

let g:airline#themes#nordlicht#palette.normal.airline_term = s:NMiddle
let g:airline#themes#nordlicht#palette.insert.airline_term = s:IMiddle
let g:airline#themes#nordlicht#palette.replace.airline_term = s:RMiddle
let g:airline#themes#nordlicht#palette.visual.airline_term = s:VMiddle
let g:airline#themes#nordlicht#palette.inactive.airline_term = s:IAMiddle
