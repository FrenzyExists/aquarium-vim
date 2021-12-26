function aquarium#colors#definitions()
  let l:style = get(g:, 'aquarium_style', &background)
  let l:result = {}

  if l:style ==# 'dark'
    let l:result =
          \{
          \ 'gui00': "#20202A",
          \ 'gui01': "#2C2E3E",
          \ 'gui02': "#A7B7D6",
          \ 'gui03': "#44495E",
          \ 'gui04': "#C6D0E9",
          \ 'gui05': "#63718B",
          \ 'gui06': "#313449",
          \ 'gui07': "#1A1A24",
          \ 'gui08': "#EBB9B9",
          \ 'gui09': "#E8CCA7",
          \ 'gui0A': "#E6DFB8",
          \ 'gui0B': "#B1DBA4",
          \ 'gui0C': "#B8DEEB",
          \ 'gui0D': "#CDDBF9",
          \ 'gui0E': "#F6BBE7",
          \ 'gui0F': "#EAC1C1",
          \}
    let l:result.linenr_bg = result.gui07
    let l:result.linenr_fg = result.gui02
    let l:result.cursor_bg = result.gui02
  elseif l:style ==# 'light'
    let l:result =
          \{
          \ 'gui00': "#E6E6F1",
          \ 'gui01': "#D5D4E0",
          \ 'gui02': "#7F8E9D",
          \ 'gui03': "#CCCBD9",
          \ 'gui04': "#7F8E9D",
          \ 'gui05': "#708190",
          \ 'gui06': "#9CA6B9",
          \ 'gui07': "#D7D7E2",
          \ 'gui08': "#C34864",
          \ 'gui09': "#D66652",
          \ 'gui0A': "#DE956F",
          \ 'gui0B': "#7D9685",
          \ 'gui0C': "#829FB0",
          \ 'gui0D': "#6A8CBC",
          \ 'gui0E': "#8787BF",
          \ 'gui0F': "#E06B6B",
          \}
    let l:result.linenr_bg = result.gui01
    let l:result.linenr_fg = "#414560"
    let l:result.cursor_bg = "#AFB5C6"
  elseif l:style ==# 'mish'
    let l:result =
          \{
          \ 'gui00': "#292B2F",
          \ 'gui01': "#36393F",
          \ 'gui02': "#97A1AF",
          \ 'gui03': "#4D5664",
          \ 'gui04': "#C8D0DA",
          \ 'gui05': "#DCE4EE",
          \ 'gui06': "#44484F",
          \ 'gui07': "#1F2025",
          \ 'gui08': "#EBB9B9",
          \ 'gui09': "#EBD1B9",
          \ 'gui0A': "#EBE3B9",
          \ 'gui0B': "#C2EBB9",
          \ 'gui0C': "#B9DEEB",
          \ 'gui0D': "#B9CAEB",
          \ 'gui0E': "#D9B9EB",
          \ 'gui0F': "#EBB9D9",
          \}
    let l:result.linenr_bg = result.gui07
    let l:result.linenr_fg = result.gui02
    let l:result.cursor_bg = result.gui02
  endif

  " Trigger bold
  if !exists("g:aqua_bold")
    let g:aqua_bold = 1
  endif

  let l:result.bold = "bold,"
  if g:aqua_bold == 0
    let l:result.bold = ""
  endif

  " Focused line toggle
  if !exists("g:aqua_line")
    let g:aqua_line = 0
  endif

  let l:result.line = "NONE"
  if g:aqua_line == 1
    let l:result.line = l:result.gui07
  endif

  " Focused line Number toggle
  if !exists("g:aqua_linenr")
    let g:aqua_linenr = 0
  endif

  if g:aqua_linenr == 0
    let l:result.linenr_bg = ""
  endif

  " Transparency thingy
  if !exists("g:aqua_transparency")
    let g:aqua_transparency = 0
  endif

  if g:aqua_transparency == 0
    let l:result.normal = l:result.gui00
    let l:result.buff = l:result.gui00
    let l:result.fold_col = l:result.gui00
    let l:result.sign_col = l:result.gui00
    let l:result.folded = l:result.gui07
  elseif g:aqua_transparency == 1
    let l:result.normal = "NONE"
    let l:result.buff = "NONE"
    let l:result.folded = "NONE"
    let l:result.fold_col = "NONE"
    let l:result.sign_col = "NONE"
  endif

  return l:result
endfunction
