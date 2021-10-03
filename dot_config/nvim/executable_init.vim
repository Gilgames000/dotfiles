" Vim > VSCode BTW

set nocompatible
filetype off
filetype plugin indent on
set mouse+=nvi

call plug#begin('~/.config/nvim/plugged')

" Motion
Plug 'easymotion/vim-easymotion'
Plug 'goldfeld/vim-seek'
Plug 'bkad/CamelCaseMotion'

" Autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rafamadriz/friendly-snippets'

" Tags
Plug 'preservim/tagbar'

" Format
Plug 'rhysd/vim-clang-format'

" Syntax highlighting
Plug 'mboughaba/i3config.vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Color schemes
Plug 'joshdick/onedark.vim'
Plug 'laggardkernel/vim-one'

" Fonts and icons
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'

" Statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Text objects
Plug 'kana/vim-textobj-user' | Plug 'whatyouhide/vim-textobj-xmlattr'

" UI libs
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'

" Fuzzy finder
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'sudormrfbin/cheatsheet.nvim'
Plug 'AckslD/nvim-neoclip.lua'
Plug 'edolphin-ydf/goimpl.nvim'

" Markdown
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'conornewton/vim-pandoc-markdown-preview'

" Miscellaneous
Plug 'luochen1990/rainbow'
Plug 'jiangmiao/auto-pairs'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-abolish'
Plug 'sjl/gundo.vim'
Plug 'dhruvasagar/vim-table-mode'

" Tmux
Plug 'tmux-plugins/vim-tmux'
Plug 'benmills/vimux'
Plug 'christoomey/vim-tmux-navigator'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

call plug#end()

" Preferences
set autoindent          " Match indents on new lines.
set smartindent         " Intellegently dedent / indent new lines based on rules.
set cursorline          " highlighted cursor row
set expandtab           " insert spaces instead when pressing <tab>
set smarttab            " let's tab key insert 'tab stops', and bksp deletes tabs.
set formatoptions-=cro  " no annoying comment autoformat foo
set noerrorbells        " don't beep, asshole
set visualbell          " don't beep
set number
set relativenumber
set shiftwidth=4        " default to 4 spaces for indentation
set tabstop=4           " use four space chars when pressing <tab>
set wildmenu
set wildmode=longest,full

" Show tabs and spaces
set list
set listchars=tab:▸\ ,trail:~,space:·

" Search
set ignorecase  " case insensitive search
set smartcase   " If there are uppercase letters, become case-sensitive.
set incsearch   " live incremental searching
set showmatch   " live match highlighting
set hlsearch    " highlight matches

" Appearance
" if (has("nvim"))
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" endif

" if (has("termguicolors"))
set termguicolors
" endif

syntax on
set background=dark
let g:one_allow_italics=1
colorscheme one

" Ignore files
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*

" Airline
let g:airline_powerline_fonts=1
let g:airline_theme='one'

" Encoding
set encoding=utf-8

" Leader key
let mapleader=' '

" Better movement between splits
nnoremap <C-left> <C-w>h
nnoremap <C-down> <C-w>j
nnoremap <C-up> <C-w>k
nnoremap <C-right> <C-w>l

" Use ctrl+backspace to delete word
inoremap <C-w> <C-\><C-o>dB
inoremap <C-BS> <C-\><C-o>db

" Allow the cursor to go anywhere in visual block mode.
set virtualedit+=block

" Backups
set nobackup
set nowritebackup
set noswapfile

" Spell checking and automatic wrapping at 50 characters to commit messages
autocmd Filetype gitcommit setlocal spell textwidth=50

" Bacause make doesn't like spaces...
autocmd FileType make setlocal noexpandtab

" Local .vimrc name
let g:localrc_filename=".vimrc.local"

" Python executables
let g:python_host_prog="/usr/bin/python2"
let g:python3_host_prog="/usr/bin/python3"

" Better ESC key
imap jk <esc>
tmap jk <c-\><c-n>
" imap <down><up> <esc>
" tmap <down><up> <c-\><c-n>

" CoC
set hidden          " If hidden is not set, TextEdit might fail
set updatetime=300  " Smaller updatetime for CursorHold & CursorHoldI
set shortmess+=c    " Don't give ins-completion-menu messages
set signcolumn=auto " Always show sign columns

let g:coc_global_extensions=["coc-vimlsp","coc-go","coc-json","coc-flutter","coc-jedi","coc-highlight","coc-snippets","coc-tabnine","coc-explorer"]

" File explorer
nnoremap <leader>n :CocCommand explorer<cr>

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <sid>show_documentation()<cr>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Rename current word
nmap <leader>rn <Plug>(coc-rename)

" Format selected region
nmap <leader>f  :call CocAction('format')<cr>

augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Invoke CodeAction on current line
nmap <leader>ca  <Plug>(coc-codeaction)
" Invoke QuickFix problem on current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Find symbol of current document
nnoremap <silent> <leader>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <leader>i  :<C-u>CocList -I symbols<cr>

"" Telescope settings
nnoremap <C-p> :Telescope find_files<Cr>
nmap ; :Telescope commands<CR>
vmap ; :Telescope commands<CR>

" CamelCaseMotion key
let g:camelcasemotion_key='<leader>'

" Rainbow parenthesis
let g:rainbow_active=1 " set to 0 if you want to enable it later via :RainbowToggle" Shortcuts

" Move lines around conveniently
nnoremap <c-down> :m .+1<CR>==
nnoremap <c-up> :m .-2<CR>==
inoremap <c-down> <Esc>:m .+1<CR>==gi
inoremap <c-up> <Esc>:m .-2<CR>==gi
vnoremap <c-down> :m '>+1<CR>gv=gv
vnoremap <c-up> :m '<-2<CR>gv=gv

" Make Y behave like D and C
nnoremap Y yg$

" Keep the cursor centered when moving to next/prev match and joining lines
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" Paste without copying the substituted text
xnoremap <leader>p "_dP

" Convenient yanking to system clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

" Delete without copying
nnoremap <leader>d "_d
vnoremap <leader>d "_d

" Tmux navigation
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <c-left> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-down> :TmuxNavigateDown<cr>
nnoremap <silent> <c-up> :TmuxNavigateUp<cr>
nnoremap <silent> <c-right> :TmuxNavigateRight<cr>
nnoremap <silent> <c-\> :TmuxNavigatePrevious<cr>

"
" <leader>s        disable search highlight and save
" <leader>Ev       open .vimrc in a vsplit
" <leader>Eh       open .vimrc in a split
" <leader>Et       open .vimrc in a new tab
" <leader>Ec       open .vimrc in the current buffer
"
nnoremap <Leader>s :let @/=''<CR>:nohlsearch<CR>:redraw!<CR>:w<CR>
nnoremap <leader>Ev :vs ~/.config/nvim/init.vim<CR>
nnoremap <leader>Eh :sp ~/.config/nvim/init.vim<CR>
nnoremap <leader>Et :tabe ~/.config/nvim/init.vim<CR>
nnoremap <leader>Ec :e ~/.config/nvim/init.vim<CR>

" i3 config syntax highlighting
aug i3config_ft_detection
    au!
    au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
aug end

" pdf previewer
let g:md_pdf_viewer="mupdf"

" pdf template
let g:md_args="--template eisvogel --listings"

" Table options
au Filetype pandoc
               \ let b:table_mode_corner='+'          |
               \ let g:table_mode_corner_corner='+'   |
               \ let g:table_mode_header_fillchar='='


" Spell checking
set spelllang+=it

" Automatically enable clang-format
autocmd FileType c ClangFormatAutoEnable

" Stop coc temporarily when using easymotion
autocmd User EasyMotionPromptBegin silent! CocDisable
autocmd User EasyMotionPromptEnd silent! CocEnable

" Go
let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }

" Telescope extensions
lua require('telescope').load_extension('fzf')
lua require('telescope').load_extension('neoclip')
lua require('telescope').load_extension('goimpl')

" Tree Sitter config
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    custom_captures = {
      ["foo.bar"] = "Identifier",
    },
    additional_vim_regex_highlighting = false,
  },
}
EOF

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
augroup END
