vim-conf
========

My custom VIM configuration mainly for Python+Django development. Supports virtualenvs.

# Installation #

    curl https://raw.github.com/eofs/vim-conf/master/manage.sh -o - | sh

## Updating ##

Run installation command adove or run manage.sh manually

    ~/.vim.eofs/manage.sh

## Configuration ##

You can override default settings by using custom .vimrc.local file (stored in your home folder e.g. */home/eofs/.vimrc.local*)

# Usage #
`<leader>` is set by default to `,` (comma)

## Django and virtualenv ##

By default vim-django scripts searches projects from ~/Projects folder. If that does not exists, you might see an error message when vim is started. You have to change *g:django_projects* value.

Set following line to your .vimrc.local to override path:

     let g:django_projects = "/home/eofs/src"

Vim is set to automatically activate virtualenv when Django project is activated. To use this feature, create your projects with following steps:

 1. Create a Django project (To your folder containing all the projects e.g. `/home/eofs/src/my_project`)
 2. Run: `virtualenv --no-site-packages ~/.virtualenvs/my_project` *[Note that my_project must be exactly the same as your Django project!]*
 3. Run `vim` or `gvim`
 4. Execute `:DjangoProjectActivate my_project`
 5. Now vim autocompletes your python code and you can use `:DjangoManage` to run management commands. Happy coding!

<table>
    <thead>
        <th>Command</th>
        <th>Shortcut</th>
        <th>Usage</th>
    </thead>
    <tbody>
        <tr>
            <td>DjangoAdmin command</td>
            <td><code>&lt;leader&gt;dad</code></td>
            <td>Run a command through django-admin.py</td>
        </tr>
        <tr>
            <td>DjangoManage command</td>
            <td><code>&lt;leader&gt;dm</code></td>
            <td>Run a command through manage.py</td>
        </tr>
        <tr>
            <td>DjangoProjectActivate project_name</td>
            <td><code>&lt;leader&gt;da</code></td>
            <td>Activate Django project and virtualenv</td>
        </tr>
        <tr>
            <td>DjangoCollectStaticLinks</td>
            <td><code>&lt;leader&gt;dc</code></td>
            <td>Collect your static files and copy them by linking</td>
        </tr>
        <tr>
            <td>DjangoSyncDb</td>
            <td><code>&lt;leader&gt;ds</code></td>
            <td>Synchronize your database</td>
        </tr>
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
* [fugivite.vim](https://github.com/tpope/vim-fugitive)
* [ctrlp.vim](https://github.com/kien/ctrlp.vim)
* [vim-colors-solarized](https://github.com/altercation/vim-colors-solarized)
* [vim-session](https://github.com/xolox/vim-session)
* [bufexplorer.zip](http://www.vim.org/scripts/script.php?script_id=42)
* [neocomplcache](https://github.com/Shougo/neocomplcache)
* [neocomplcache-snippets-complete](https://github.com/Shougo/neocomplcache-snippets-complete)
* [Powerline](https://github.com/Lokaltog/vim-powerline)
* [virtualenv.vim](https://github.com/jmcantrell/vim-virtualenv)
* [Vim-Django](http://www.vim.org/scripts/script.php?script_id=4095)
* [Vundle](https://github.com/gmarik/vundle)