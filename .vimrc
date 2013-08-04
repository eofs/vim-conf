" Notes {
" vim: set foldmarker={,} foldlevel=0 foldmethod=marker spell:
"
" This is VIM configuration file by eofs
" https://github.com/eofs/vim-conf
" }

" Basics {
    set nocompatible
" }

" Bundles {
    filetype off

    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()

    " Let Vundle manage Vundle
    Bundle 'gmarik/vundle'

    " General bundles {
        Bundle 'scrooloose/nerdtree'
        Bundle 'scrooloose/nerdcommenter'
        Bundle 'scrooloose/syntastic'
        Bundle 'jistr/vim-nerdtree-tabs'
        Bundle 'tpope/vim-fugitive'
        Bundle 'kien/ctrlp.vim'
        Bundle 'altercation/vim-colors-solarized'
        Bundle 'xolox/vim-session'
        Bundle 'xolox/vim-misc'
        Bundle 'bufexplorer.zip'
        Bundle 'honza/vim-snippets'
        Bundle 'Shougo/neocomplcache'
        Bundle 'Shougo/neosnippet'
        Bundle 'Lokaltog/vim-powerline'
        Bundle 'majutsushi/tagbar'
        Bundle 'digitaltoad/vim-jade'
        Bundle 'wavded/vim-stylus'
    " }
    " Python (and Django) {
        Bundle 'jmcantrell/vim-virtualenv'
        Bundle 'vim-django'
        Bundle 'klen/python-mode'
    " }
" }

" General settings {
    filetype plugin indent on
    syntax on               " Enable syntax highlighting
    set mouse=a             " Enable mouse
    set ttymouse=urxvt      " Enable extended mouse coordinates
    set encoding=utf-8
    scriptencoding utf-8    " Use UTF-8 by default
    set shortmess+=filmnrxoOtT  " Avoid "Hit Enter" messages
    set virtualedit=onemore " Let cursor go beyond last character
    set history=1000        " Command history
    set spell               " Enable spellchecking
    set hidden              " Allow buffer switching without saving

    " Directories {
        set backup          " Enable backups
        if has('persistent_undo')
            set undofile
            set undolevels=1000     " Max number of changes
            set undoreload=10000    " Max number of lines to save on buffer reload
        endif
    " }
" }

" UI {
    set tabpagemax=15           " Show only 15 tabs
    set showmode                " Display current mode
    set cursorline              " Highlight current line

    if has('cmdline_info')
        set ruler               " Enable ruler
        " Expand ruler
        set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
        set showcmd             " Show partial commands
    endif

    if has('statusline')
        set laststatus=2
        set statusline=%<%f\        " Filename
        set statusline+=%w%h%m%r    " Options
        set statusline+=%{fugitive#statusline()} " Git Hotness
        set statusline+=\ [%{&ff}/%Y]            " Filetype
        set statusline+=\ [%{getcwd()}]          " Current directory
        set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
    endif

    set backspace=indent,eol,start
    set linespace=0
    set nu                      " Enable line numbers
    set showmatch               " Show matching brackets/parenthesis
    set incsearch               " Find as you type
    set hlsearch                " Highlight search terms
    set winminheight=0          " Window can be 0 line high
    set ignorecase              " Case insensitive search
    set smartcase               " Case sensitive when uc present
    set wildmenu                " Show list instead of just completing
    set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all
    set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap to
    set scrolljump=5            " Lines to scroll when cursor leaves the screen
    set scrolloff=3             " Show least n lines above and below cursor
    set foldenable              " Auto fold code
    set list
    set listchars=tab:,.,trail:.,extends:#,nbsp:.   " Highlight problematic whitespace

    set background=dark
    if filereadable(expand("~/.vim/bundle/vim-colors-solarized/colors/solarized.vim"))
        let g:solarized_termcolors=256
        color solarized
    endif
" }

" Formating {
    set nowrap                  " Wrap long lines
    set autoindent              " Indent at the same level as the previous line
    set shiftwidth=4            " Use indents of 4 spaces
    set expandtab               " Replace tabs with spaces
    set tabstop=4               " Tab width
    set softtabstop=4           " Let backspace delete indent
    set pastetoggle=<F12>       " Pastetoggle (sane indentation on pastes)

    " Remove trailing whitespaces and ^M chars
    autocmd FileType c,cpp,java,php,javascript,python,twig,xml,yml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
    autocmd BufNewFile,BufRead *.html.twig set filetype=html.twig
    autocmd BufNewFile,BufRead *.less set filetype=css
" }

" Key remaps and plugin configurations {
    let mapleader = ','

    " Clear highlighted search
    nmap <silent> <leader>/ :nohlsearch<CR>

    let b:match_ignorecase = 1

    " Move lines up and down
    nnoremap <A-j> :m .+1<CR>==
    nnoremap <A-k> :m .-2<CR>==
    inoremap <A-j> <Esc>:m .+1<CR>==gi
    inoremap <A-k> <Esc>:m .-2<CR>==gi
    vnoremap <A-j> :m '>+1<CR>gv=gv
    vnoremap <A-k> :m '<-2<CR>gv=gv

    " Folding {
        inoremap <F9> <C-O>za
        nnoremap <F9> za
        onoremap <F9> <C-C>za
        vnoremap <F9> zf
    " }

    " NerdTree {
        let g:NERDShutUp=1
        map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
        map <leader>e :NERDTreeFind<CR>
        nmap <leader>nt :NERDTreeFind<CR>

        let NERDTreeShowBookmarks=1
        let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
        let NERDTreeQuitOnOpen=1
        let NERDTreeMouseMode=2     " Single click to open dir, double click to open file
        let NERDTreeShowHidden=1
        let NERDTreeChDirMode=2      " Change working directory automatically
    " }

    " ctrlp {
        let g:ctrlp_map = '<c-p>'
        let g:ctrlp_cmd = 'CtrlP'

        set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
        set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

        let g:ctrlp_working_path_mode = 'ra'
        let g:ctrlp_custom_ignore = {
          \ 'dir':  '\v[\/]\.(git|hg|svn)$',
          \ 'file': '\v\.(exe|so|dll|pyc)$',
          \ }
    " }

    " vim-django {
        let g:django_activate_nerdtree = 1          " Launch NerdTree when project is activated
        let g:django_activate_virtualenv = 1        " Activate virtualenv when project is activated

        nmap <leader>da :DjangoProjectActivate 
        nmap <silent> <leader>dad :DjangoAdmin 
        nmap <silent> <leader>dm :DjangoManage 
        nmap <leader>dc :DjangoCollectStaticLink<CR>
        nmap <leader>ds :DjangoSyncDb<CR>
    " }

    " vim-virtualenv {
        nmap <leader>vl :VirtualEnvList<CR>
        nmap <leader>va :VirtualEnvActivate
        nmap <leader>vd :VirtualEnvDeactivate<CR>
    " }

    " Ctags {
        set tags=./tags;/
    "

    " Tagbar {
        nmap <F8> :TagbarToggle<CR>
    " }

    " Sessions {
        nmap <leader>sl :SessionList<CR>
        nmap <leader>ss :SessionSave<CR>
    " }

    " Buffer explorer {
        nmap <leader>b :BufExplorer<CR>
    " }

    " Fugitive {
        nnoremap <silent> <leader>gs :Gstatus<CR>
        nnoremap <silent> <leader>gd :Gdiff<CR>
        nnoremap <silent> <leader>gc :Gcommit<CR>
        nnoremap <silent> <leader>gb :Gblame<CR>
        nnoremap <silent> <leader>gl :Glog<CR>
        nnoremap <silent> <leader>gp :Git push<CR>
    " }

    " python-mode {
        let g:pymode_lint_checker = 'pyflakes'
        let g:pymode_rope_autoimport_modules = ['os', 'shutil', 'datetime', 'django']
    " }

    " Neocomplcache {
        " Disable AutoComplPop.
        let g:acp_enableAtStartup = 0
        let g:neocomplcache_enable_at_startup = 1
        let g:neocomplcache_enable_smart_case = 1
        let g:neocomplcache_enable_camel_case_completion = 1
        let g:neocomplcache_enable_underbar_completion = 1
        let g:neocomplcache_min_syntax_length = 3
        let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

        inoremap <expr><C-g>     neocomplcache#undo_completion()
        inoremap <expr><C-l>     neocomplcache#complete_common_string()

        " Recommended key-mappings.
        " <CR>: close popup and save indent.
        inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
        " <TAB>: completion.
        inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
        " <C-h>, <BS>: close popup and delete backword char.
        inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
        inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
        inoremap <expr><C-y>  neocomplcache#close_popup()
        inoremap <expr><C-e>  neocomplcache#cancel_popup()

        " Enable omni completion.
        autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
        autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
        autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
        autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
        autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

        " Enable heavy omni completion.
        if !exists('g:neocomplcache_omni_patterns')
          let g:neocomplcache_omni_patterns = {}
        endif
        let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
        "autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
        let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
        let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
        let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'
    " }

    " Neosnippets {
        " Plugin key-mappings.
        imap <C-k>     <Plug>(neosnippet_expand_or_jump)
        smap <C-k>     <Plug>(neosnippet_expand_or_jump)

        " SuperTab like snippets behavior.
        imap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
        smap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

        " For snippet_complete marker.
        if has('conceal')
            set conceallevel=2 concealcursor=i
        endif

        " Tell Neosnippet about these snippets
        let g:neosnippet#snippets_directory='~/.vim/bundle/snipmate-snippets/snippets'
    " }
" }

" Functions {
    function! InitializeDirectories()
        let separator = "."
        let parent = $HOME
        let prefix = '.vim'
        let dir_list = {
                    \ 'backup': 'backupdir',
                    \ 'views': 'viewdir',
                    \ 'swap': 'directory' }

        if has('persistent_undo')
            let dir_list['undo'] = 'undodir'
        endif

        for [dirname, settingname] in items(dir_list)
            let directory = parent . '/' . prefix . separator . dirname . "/"
            if exists("*mkdir")
                if !isdirectory(directory)
                    call mkdir(directory)
                endif
            endif
            if !isdirectory(directory)
                echo "Warning: Unable to create backup directory: " . directory
                echo "Try: mkdir -p " . directory
            else
                let directory = substitute(directory, " ", "\\\\ ", "g")
                exec "set " . settingname . "=" . directory
            endif
        endfor
    endfunction
    call InitializeDirectories()
" }

" Use local vimrc if available {
    if filereadable(expand("~/.vimrc.local"))
        source ~/.vimrc.local
    endif
" }
