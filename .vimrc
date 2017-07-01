syntax on
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set wrap
set linebreak
set nolist
set pastetoggle=<F2>
set nu

function RunUnitTests()
    let file_name = expand('%:t')
    let startswith = split(file_name, "_")[0]
    if startswith == "test"
        let unit_test_file_name = file_name
    else
        let unit_test_file_name = 'test_'.file_name
    endif
    let test_directory = expand('%:p:h')
    execute "!clear; cd ".test_directory."; green -vvv ".unit_test_file_name."; cd -"
endfunction

autocmd FileType python map <buffer> <C-t> :call RunUnitTests()<CR>

execute pathogen#infect()
