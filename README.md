
<p align="center">
    <a href="https://github.com/FrenzyExists" target="_blank">
        <img src="screenshots/banner.png" alt="Aquarium Banner" width="630"/>
    </a>
</p>
<p align="center">
    <a href="https://github.com/FrenzyExists/aquarium-vim/stargazers"><img src="https://img.shields.io/github/stars/FrenzyExists/aquarium-vim?colorA=20202a&colorB=cddbf9&style=for-the-badge&logo=starship style=flat-square"></a>
    <a href="https://github.com/FrenzyExists/aquarium-vim/releases/latest"><img src="https://img.shields.io/github/release/FrenzyExists/aquarium-vim.svg?&style=for-the-badge&label=Release&logo=github&logoColor=eceff4&colorA=20202a&colorB=f6bbe7"/></a> 
    <a href="https://github.com/FrenzyExists/aquarium-vim/issues"><img src="https://img.shields.io/github/issues/FrenzyExists/aquarium-vim?colorA=20202a&colorB=e6dfb8&style=for-the-badge&logo=bugatti"></a>
    <a href="https://github.com/FrenzyExists/aquarium-vim/network/members"><img src="https://img.shields.io/github/forks/FrenzyExists/aquarium-vim?colorA=20202a&colorB=ebb9b9&style=for-the-badge&logo=github"></a>
</p>

<br/>

<p align="center">A colorful, dark cozy <a href="https://github.com/neovim/neovim">Neovim</a> colorscheme.</p>

Currently aquarium is at a very early stage, there's a large need for ports. At the time of this writting, you can visit [my dotfiles](https://github.com/FrenzyExists/dotfiles) for terminal configurations as well as my [tmux](https://github.com/FrenzyExists/dotfiles/blob/master/config/.tmux.conf) config, which is partly ripped from [Hi I'm Bored](https://github.com/shaunsingh).

## Getting Started
Aquarium currently has a vimscript version only, expect a lua version soon!

### Quick Start

* vim-plug
```vim
Plug 'frenzyexists/aquarium-vim', { 'branch': 'vimscript_version' }

" Future plans for lua version are around, somewhere, i hope
```

* packer
```lua
use {
    'frenzyexists/aquarium-vim',
    branch = 'vimscript_version'
}
```
## Features and Stuff
The vimscript version currently have some support for a few plugins, bellow a list of supported plugins:
- [pandoc](https://github.com/jgm/pandoc)
- [Nvim-Treesitter](https://github.com/tree-sitter/tree-sitter)
- [jedi](https://github.com/davidhalter/jedi)
- [Vim Clap](https://github.com/liuchengxu/vim-clap/tree/master/test)
- [fujitive.vim](https://github.com/tpope/vim-fugitive)
- [lualine](https://github.com/hoob3rt/lualine.nvim)
- [vim-airline]()

To Enable `aquarium` theme for `Lualine`, specify the theme in your lua config:

```lua
require('lualine').setup {
  options = {
    theme = 'aquarium'
    -- ... your lualine config
  }
}
```
### Variables n Stuff
```lua
g.aqua_bold = 1 -- Bold stuff
```

### Modes
Aquarium now has Light Mode!

```lua
-- To enable Lightmode change the style variable:
local g = vim.g

-- options: "light", "dark"
g.aquarium_style = "light"

```

### Airline
```lua
-- Airline has two themes :D
local g = vim.g

-- options:
--   base16_aquarium_light
--   base16_aquarium_dark
g.airline_theme = "base16_aquarium_light"
```

### Screenshots

### Theme on PikaVim

#### Aquarium-Dark
![](screenshots/pika_vim-dark.png)

#### Terminal View
![](screenshots/preview-dark.png)

#### Aquarium-Light
![](screenshots/pika_vim-light.png)

#### Terminal View
![](screenshots/preview-light.png)

### Pallete
<p align="center">
    <img src="screenshots/palette.png" alt="Aquarium Palette"/>
</p>

## Contributing
Aquarium is open-source, and will always be forever and ever.

There's a lot of ways to contribute, creating ports in particular. For example, you could submit a [pull request](https://github.com/frenzyexists/aquarium-vim/pulls) a [suggestion/enchantment](https://github.com/frenzyexists/aquarium-vim/issues) for this color theme.

Other ways you can contribute is by adding a config of your favorite program using aquarium colors over [here](https://github.com/FrenzyExists/dotfiles).

### To-do list
- [x] Add Scheme switch script
- [ ] Glorify theme
- [ ] Add Mish Theme
- [ ] Profit (hehe)

<p align="center">
    <a href="https://github.com/frenzyexists/aquarium-vim/blob/main/LICENSE">
        <img src="https://img.shields.io/badge/license-MIT-orange.svg?colorA=20202A&colorB=b8dceb&style=for-the-badge&logo=mitsubishi">
    </a>
</p>

