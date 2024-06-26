{ ... }:
{
  programs.vim = {
    enable = true;
    extraConfig = ''
      " Enable auto completion menu after pressing TAB.
      set wildmenu

      set wildmode=list:longest
      set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

      " Disable compatibility with vi which can cause unexpected issues.
      set nocompatible

      " Turn syntax highlighting on.
      syntax on

      " Options
      set number
      set relativenumber 
      set nobackup
      set scrolloff=8

      set shiftwidth=2
      set tabstop=2
      set nowrap
      set incsearch
      set ignorecase
      set smartcase
      set nohlsearch
      set history=1000

      " Mappings
      let mapleader = " "
      inoremap jk <esc>
      nnoremap <leader>w :w<CR>
      nnoremap <leader>q :wq<CR>

      " STATUS LINE ------------------------------------------------------------ {{{

	" Clear status line when vimrc is reloaded.
	  set statusline=

	  " Status line left side.
	  set statusline+=\ %F\ %M\ %Y\ %R

	  " Use a divider to separate the left side from the right side.
	  set statusline+=%=

	  " Status line right side.
	  set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%

	  " Show the status on the second to last line.
	  set laststatus=2
	  '';
      };
  }
