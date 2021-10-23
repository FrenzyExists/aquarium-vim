local colors = {
    green           = '#B1DBA4',
    pink            = '#F6BBE7',
    blue            = '#B8DCEB',
    lightblue       = '#CDDBF9',
    red             = '#EBB9B9',
    lightred        = '#EAC1C1',
    yellow          = '#E6DFB8',
    lightyellow     = '#C8CCA7',
    black           = '#1A1A24',
    black1          = '#20202A',
    black2          = '#2C2E3E',
    black3          = '#313449',
    black4          = '#3d4059',
    grey            = '#63718b',
    grey1           = '#a7b7d6',
    grey2           = '#cddbf9'
}
return {
    normal = {
        a = {bg = colors.red, fg = colors.black4, gui = 'bold'},
        b = {bg = colors.black2, fg = colors.grey2},
        c = {bg = colors.black4, fg = colors.grey2}
    },
    insert = {
        a = {bg = colors.green, fg = colors.black4, gui = 'bold'},
        b = {bg = colors.blue, fg = colors.black4},
        c = {bg = colors.black4, fg = colors.grey2}
    },
    visual = {
        a = {bg = colors.black3, fg = colors.grey2, gui = 'bold'},
        b = {bg = colors.grey, fg = colors.black4},
        c = {bg = colors.black4, fg = colors.grey2}
    },
    replace = {
        a = {bg = colors.pink, fg = colors.black4, gui = 'bold'},
        b = {bg = colors.black3, fg = colors.grey2},
        c = {bg = colors.black4, fg = colors.grey2}
    },
    command = {
        a = {bg = colors.pink, fg = colors.black4, gui = 'bold'},
        b = {bg = colors.lightblue, fg = colors.black4},
        c = {bg = colors.black4, fg = colors.grey2}
    },
    inactive = {
        a = {bg = colors.black4, fg = colors.grey2, gui = 'bold'},
        b = {bg = colors.black4, fg = colors.grey2},
        c = {bg = colors.black4, fg = colors.grey2}
    }
}
