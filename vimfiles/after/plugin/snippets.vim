call NERDSnippetsReset()

let vimhome_path = '~/.vim/'
try
  source ~/.vim/snippets/support_functions.vim
catch
  let vimhome_path = '~/vimfiles/'
  source ~\vimfiles\snippets\support_functions.vim
endtry


call NERDSnippetsFromDirectory(vimhome_path . "snippets")

function! s:inRailsEnv()
    return filereadable(getcwd() . '/config/environment.rb')
endfunction

if s:inRailsEnv()
    call NERDSnippetsFromDirectoryForFiletype(vimhome_path . 'snippets/ruby-rails', 'ruby')
    call NERDSnippetsFromDirectoryForFiletype(vimhome_path . 'snippets/eruby-rails', 'eruby')
endif

call NERDSnippetsFromDirectoryForFiletype(vimhome_path . 'snippets/html', 'eruby')
call NERDSnippetsFromDirectoryForFiletype(vimhome_path . 'snippets/html', 'xhtml')
call NERDSnippetsFromDirectoryForFiletype(vimhome_path . 'snippets/html', 'php')
