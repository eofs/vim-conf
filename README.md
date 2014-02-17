vim-conf
========

My custom VIM configuration mainly for Python development. Supports virtualenvs.

# Installation #

    curl https://raw.github.com/eofs/vim-conf/master/manage.sh -o - | sh

## Updating ##

Run installation command adove or run manage.sh manually

    ~/.vim.eofs/manage.sh

## Configuration ##

You can override default settings by using custom .vimrc.local file (stored in your home folder e.g. */home/eofs/.vimrc.local*)

# Usage #
`<leader>` is set to `,` (comma) by default.

<table>
    <thead>
        <th>Command</th>
        <th>Shortcut</th>
        <th>Usage</th>
    </thead>
    <tbody>
        <tr>
            <td>VirtualEnvList</td>
            <td><code>&lt;leader&gt;vl</code></td>
            <td>List available virtualenvs</td>
        </tr>
        <tr>
            <td>VirtualEnvActivate name</td>
            <td><code>&lt;leader&gt;va</code></td>
            <td>Activate a virtualenv</td>
        </tr>
        <tr>
            <td>VirtualEnvDeactivate</td>
            <td><code>&lt;leader&gt;vd</code></td>
            <td>Deactivate current virtualenv</td>
        </tr>
    </tbody>
</table>

# Plugins #
* [NERD Tree](https://github.com/scrooloose/nerdtree)
* [NERD Tree Tabs](https://github.com/jistr/vim-nerdtree-tabs)
* [NERDCommenter](https://github.com/scrooloose/nerdcommenter)
* [Syntastic](https://github.com/scrooloose/syntastic)
* [fugivite.vim](https://github.com/tpope/vim-fugitive)
* [ctrlp.vim](https://github.com/kien/ctrlp.vim)
* [vim-colors-solarized](https://github.com/altercation/vim-colors-solarized)
* [vim-session](https://github.com/xolox/vim-session)
* [bufexplorer.zip](http://www.vim.org/scripts/script.php?script_id=42)
* [neocomplete](https://github.com/Shougo/neocomplete.vim)
* [neosnippet](https://github.com/Shougo/neosnippet)
* [neosnippet-snippets](https://github.com/Shougo/neosnippet-snippets)
* [Powerline](https://github.com/Lokaltog/vim-powerline)
* [Tagbar](https://github.com/majutsushi/tagbar)
* [virtualenv.vim](https://github.com/jmcantrell/vim-virtualenv)
* [python-mode](https://github.com/klen/python-mode)
* [Vundle](https://github.com/gmarik/vundle)
