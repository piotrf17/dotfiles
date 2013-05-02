syntax on

set backspace=indent,eol,start " allow backspace in insert mode

set autoindent    " text indenting - you may want to remove this if cutting and pasting
set smartindent   " as above - you may want to remove this if cutting and pasting
set cindent
set expandtab
set softtabstop=2
set shiftwidth=2
"set cinkeys=0{,0},:,0#,!,!^F

set tabstop=4     " number of spaces in a tab
set softtabstop=4 " as above
set shiftwidth=4  " as above
set smarttab     " always turn tabs into spaces. (you might want smarttab)

set history=1000   " lines of command history
set showcmd       " show incomplete commands
set hlsearch      " highlight searched-for phrases
set incsearch     " highlight search as you type
set ruler         " display current line number

"set wrapmargin=80
"complete word by searching backwards
map! ^P ^[a. ^[hbmmi?\<^[2h"zdt.@z^Mywmx`mP xi   
"complete word by searching forwards
map! ^N ^[a. ^[hbmmi/\<^[2h"zdt.@z^Mywmx`mP xi

" check for terminal colours then activate syntax highlighting
 if &t_Co > 2 || has("gui_running")
   syntax on
   endif

   if has("autocmd")
      filetype plugin indent on
         autocmd FileType text setlocal textwidth=78

         " always jump to last edit position when opening a file
            autocmd BufReadPost *
               \ if line("'\"") > 0 && line("'\"") <= line("$") |
   \   exe "normal g`\"" |
      \ endif
      endif


function! Mosh_Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
      return "\<C-N>"
  else
      return "\<Tab>"
endfunction

:inoremap <Tab> <C-R>=Mosh_Tab_Or_Complete()<CR>

:set  dictionary="/usr/dict/words"  
