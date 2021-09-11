" <Plugins>
call plug#begin('~/.vim/plugged')
Plug 'ap/vim-css-color'
Plug 'elkowar/yuck.vim'
Plug 'adamclerk/vim-razor'
Plug 'tpope/vim-fugitive'
Plug 'vimwiki/vimwiki'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'tpope/vim-obsession'
Plug 'Yggdroot/indentLine'
Plug 'prettier/vim-prettier'
Plug 'neoclide/coc-css'
Plug 'mattn/emmet-vim'
Plug 'glepnir/dashboard-nvim'
Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf.vim' " you need fzf installed
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'dense-analysis/ale'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'akinsho/nvim-bufferline.lua'
Plug 'hoob3rt/lualine.nvim', {'commit': 'dc2c711'}
Plug 'ryanoasis/vim-devicons'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-commentary'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'jiangmiao/auto-pairs'
Plug 'SirVer/ultisnips'
Plug 'alvan/vim-closetag'
Plug 'fatih/vim-go' " CocInstall coc-go
call plug#end()
" </Plugins>

" <Config>
set encoding=UTF-8
set number
set relativenumber
set expandtab
set shiftwidth=0
set tabstop=2
set showtabline=2
set guioptions-=e
set laststatus=2
" set cursorline
set ignorecase
set smartcase
set hidden
set background=dark
set mouse=a
au FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
autocmd VimEnter *.sh set noexpandtab
colorscheme gruvbox
" transparency
autocmd VimEnter * hi Normal guibg=NONE ctermbg=NONE
" </Config>

" <Keybindings>
imap <silent> jj <ESC>
nmap <silent> ss :w<CR>
" nmap <silent> gt  :bn<CR>
" nmap <silent> gr  :bp<CR>
nmap <silent> tt  :Bclose<CR>
nmap <silent> dh  :noh<CR>
nmap <silent> '' ``
nmap <silent> ! :ls<CR>
nmap <silent> <A-k> :wincmd k<CR>
nmap <silent> <A-j> :wincmd j<CR>
nmap <silent> <A-h> :wincmd h<CR>
nmap <silent> <A-l> :wincmd l<CR>
nmap <silent> - <C-e>
nmap <silent> ¿ <C-y>
map  <silent> ñ <Plug>Commentary
nmap <silent> { <C-b>
nmap <silent> } <C-d>
nmap <silent> <C-f> :call CocAction('jumpDefinition', 'drop')<CR>
nmap <silent> <C-p> :call ToggleBlur()<CR>
nmap <silent> <C-x> :bufdo bd \| :Dashboard<CR>
nmap <SPACE> <Nop>
let g:mapleader="\<Space>"
" </Keybindings>

" <Gruvbox>
let g:gruvbox_contrast_dark = 'soft'
" </Gruvbox>

" <CoC>
" ...hmmm idk
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
" </CoC>

" <JavaScript>
"" Install the CoC server with ↓
"" CocInstall coc-tsserver 
" autocmd BufWritePost *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.scss,*.json,*.graphql,*.md,*.vue,*.html PrettierAsync
" </JavaScript>

" <FZF>
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'
" let g:fzf_action = {
"   \ 'ctrl-t': 'tab split',
"   \ 'ctrl-s': 'split',
"   \ 'ctrl-v': 'vsplit' }
" </FZF>


" <Lualine>
lua << EOF
local function getDate()
  return os.date("%I:%M %p")
end
local cooler_gruvbox = require('lualine.themes.gruvbox')
cooler_gruvbox.command.a.bg = '#fb4934'
require('lualine').setup{
  options = {
    icons_enabled = true,
    theme = cooler_gruvbox,
    disabled_filetypes = {'Dashboard'},
    section_separators = '',
    component_separators = ''
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = { getDate },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
EOF
" </Lualine>

" <Nvim-bufferline>
lua << EOF
require("bufferline").setup{
  options = {
    show_buffer_close_icons = false,
    show_close_icon = false,
  }
}
EOF
set sessionoptions+=globals
nmap <silent>gt :BufferLineCycleNext<CR>
nmap <silent>gr :BufferLineCyclePrev<CR>
nmap <silent>gT :BufferLineMoveNext<CR>
nmap <silent>gR :BufferLineMovePrev<CR>
" </Nvim-bufferline>

" <Nvim-tree>
set termguicolors
" highlight NvimTreeFolderIcon guibg=blue
nmap <silent> ff :DashboardFindFile<CR>
nmap <silent> FF :NvimTreeToggle<CR>
nmap <silent> <leader>fn :NvimTreeFindFile<CR>
let g:nvim_tree_side = 'right'
" </Nvim-tree>


" " <Funcs>
let s:blur = 1
function! ToggleBlur()
  if s:blur == 1
    silent colorscheme gruvbox
    let s:blur = 0
  else
    silent hi Normal guibg=NONE ctermbg=NONE
    let s:blur = 1
  endif
endfunction
let loaded_bclose = 1
if !exists('bclose_multiple')
  let bclose_multiple = 1
endif
function! s:Warn(msg)
  echohl ErrorMsg
  echomsg a:msg
  echohl NONE
endfunction
function! s:Bclose(bang, buffer)
  if empty(a:buffer)
    let btarget = bufnr('%')
  elseif a:buffer =~ '^\d\+$'
    let btarget = bufnr(str2nr(a:buffer))
  else
    let btarget = bufnr(a:buffer)
  endif
  if btarget < 0
    call s:Warn('No matching buffer for '.a:buffer)
    return
  endif
  if empty(a:bang) && getbufvar(btarget, '&modified')
    call s:Warn('No write since last change for buffer '.btarget.' (use :Bclose!)')
    return
  endif
  " Numbers of windows that view target buffer which we will delete.
  let wnums = filter(range(1, winnr('$')), 'winbufnr(v:val) == btarget')
  if !g:bclose_multiple && len(wnums) > 1
    call s:Warn('Buffer is in multiple windows (use ":let bclose_multiple=1")')
    return
  endif
  let wcurrent = winnr()
  for w in wnums
    execute w.'wincmd w'
    let prevbuf = bufnr('#')
    if prevbuf > 0 && buflisted(prevbuf) && prevbuf != btarget
      buffer #
    else
      bprevious
    endif
    if btarget == bufnr('%')
      " Numbers of listed buffers which are not the target to be deleted.
      let blisted = filter(range(1, bufnr('$')), 'buflisted(v:val) && v:val != btarget')
      " Listed, not target, and not displayed.
      let bhidden = filter(copy(blisted), 'bufwinnr(v:val) < 0')
      " Take the first buffer, if any (could be more intelligent).
      let bjump = (bhidden + blisted + [-1])[0]
      if bjump > 0
        execute 'buffer '.bjump
      else
        execute 'enew'.a:bang
      endif
    endif
  endfor
  execute 'bdelete'.a:bang.' '.btarget
  execute wcurrent.'wincmd w'
endfunction
command! -bang -complete=buffer -nargs=? Bclose call <SID>Bclose(<q-bang>, <q-args>)
" </Funcs>

" <Dashboard>
let g:dashboard_default_executive = 'telescope'
" let g:dashboard_custom_header = [
"     \'   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣭⣿⣶⣿⣦⣼⣆         ',
"     \'    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ',
"     \'          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷⠄⠄⠄⠄⠻⠿⢿⣿⣧⣄     ',
"     \'           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ',
"     \'          ⢠⣿⣿⣿⠈  ⠡⠌⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ',
"     \'   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘⠄ ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ',
"     \'  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ',
"     \' ⣠⣿⠿⠛⠄⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ',
"     \' ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇⠄⠛⠻⢷⣄ ',
"     \'      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ',
"     \'       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ',
"     \'   𝒘𝒉𝒚 𝒂𝒓𝒆 𝒚𝒐𝒖 𝒍𝒐𝒐𝒌𝒊𝒏𝒈 𝒇𝒐𝒓 𝒉𝒆𝒍𝒑?   ',
"     \'',
"     \]
let s:morning = ['            𝙶𝚘𝚘𝚍 𝚖𝚘𝚛𝚗𝚒𝚗𝚐.']
let s:afternoon = ['             𝙶𝚘𝚘𝚍 𝚊𝚏𝚝𝚎𝚛𝚗𝚘𝚘𝚗.']
let s:night = ['              𝙶𝚘𝚘𝚍 𝚗𝚒𝚐𝚑𝚝.']
let s:header = [
      \'    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠤⠖⠚⢉⣩⣭⡭⠛⠓⠲⠦⣄⡀⠀⠀⠀⠀⠀⠀⠀  ',
      \'    ⠀⠀⠀⠀⠀⠀⢀⡴⠋⠁⠀⠀⠊⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠳⢦⡀⠀⠀⠀⠀  ',
      \'    ⠀⠀⠀⠀⢀⡴⠃⢀⡴⢳⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣆⠀⠀⠀  ',
      \'    ⠀⠀⠀⠀⡾⠁⣠⠋⠀⠈⢧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢧⠀⠀  ',
      \'    ⠀⠀⠀⣸⠁⢰⠃⠀⠀⠀⠈⢣⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣇⠀  ',
      \'    ⠀⠀⠀⡇⠀⡾⡀⠀⠀⠀⠀⣀⣹⣆⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⠀  ',
      \'    ⠀⠀⢸⠃⢀⣇⡈⠀⠀⠀⠀⠀⠀⢀⡑⢄⡀⢀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇  ',
      \'    ⠀⠀⢸⠀⢻⡟⡻⢶⡆⠀⠀⠀⠀⡼⠟⡳⢿⣦⡑⢄⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇  ',
      \'    ⠀⠀⣸⠀⢸⠃⡇⢀⠇⠀⠀⠀⠀⠀⡼⠀⠀⠈⣿⡗⠂⠀⠀⠀⠀⠀⠀⠀⢸⠁  ',
      \'    ⠀⠀⡏⠀⣼⠀⢳⠊⠀⠀⠀⠀⠀⠀⠱⣀⣀⠔⣸⠁⠀⠀⠀⠀⠀⠀⠀⢠⡟⠀  ',
      \'    ⠀⠀⡇⢀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀⢸⠃⠀  ',
      \'    ⠀⢸⠃⠘⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠁⠀⠀⢀⠀⠀⠀⠀⠀⣾⠀⠀  ',
      \'    ⠀⣸⠀⠀⠹⡄⠀⠀⠈⠁⠀⠀⠀⠀⠀⠀⠀⡞⠀⠀⠀⠸⠀⠀⠀⠀⠀⡇⠀⠀  ',
      \'    ⠀⡏⠀⠀⠀⠙⣆⠀⠀⠀⠀⠀⠀⠀⢀⣠⢶⡇⠀⠀⢰⡀⠀⠀⠀⠀⠀⡇⠀⠀  ',
      \'    ⢰⠇⡄⠀⠀⠀⡿⢣⣀⣀⣀⡤⠴⡞⠉⠀⢸⠀⠀⠀⣿⡇⠀⠀⠀⠀⠀⣧⠀⠀  ',
      \'    ⣸⠀⡇⠀⠀⠀⠀⠀⠀⠉⠀⠀⠀⢹⠀⠀⢸⠀⠀⢀⣿⠇⠀⠀⠀⠁⠀⢸⠀⠀  ',
      \'    ⣿⠀⡇⠀⠀⠀⠀⠀⢀⡤⠤⠶⠶⠾⠤⠄⢸⠀⡀⠸⣿⣀⠀⠀⠀⠀⠀⠈⣇⠀  ',
      \'    ⡇⠀⡇⠀⠀⡀⠀⡴⠋⠀⠀⠀⠀⠀⠀⠀⠸⡌⣵⡀⢳⡇⠀⠀⠀⠀⠀⠀⢹⡀  ',
      \'    ⡇⠀⠇⠀⠀⡇⡸⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠮⢧⣀⣻⢂⠀⠀⠀⠀⠀⠀⢧  ',
      \'    ⣇⠀⢠⠀⠀⢳⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⡎⣆⠀⠀⠀⠀⠀⠘  ',
      \]
let s:hour = system('date "+%H"')
if s:hour > 5 && s:hour < 12
  let g:dashboard_custom_header = s:morning + s:header
elseif s:hour >= 12 && s:hour < 19
  let g:dashboard_custom_header = s:afternoon + s:header
else
  let g:dashboard_custom_header = s:night + s:header
endif
nmap <Leader>ss :<C-u>SessionSave<CR>
nmap <Leader>sl :<C-u>SessionLoad<CR>
nnoremap <silent> <Leader>fh :DashboardFindHistory<CR>
nnoremap <silent> <Leader>ff :DashboardFindFile<CR>
nnoremap <silent> <Leader>tc :DashboardChangeColorscheme<CR>
nnoremap <silent> <Leader>fa :DashboardFindWord<CR>
nnoremap <silent> <Leader>fb :DashboardJumpMark<CR>
nnoremap <silent> <Leader>cn :DashboardNewFile<CR>
" </Dashboard>


" <Closetag>
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_filetypes = 'html,xhtml,phtml'
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'
" </Closetag>

" <Emmet>
let g:user_emmet_leader_key = "<c-k>"
" </Emmet>

" <UltiSnips>
let g:UltiSnipsExpandTrigger = "<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<nop>"
" </UltiSnips>

let g:indentLine_fileTypeExclude = ['dashboard', 'vimwiki', 'dockerfile', 'json']
autocmd! TermOpen * IndentLinesDisable
autocmd! FileType dashboard autocmd! BufEnter <buffer> normal gg
