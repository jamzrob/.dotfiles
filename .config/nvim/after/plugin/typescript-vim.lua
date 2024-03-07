vim.cmd([[
    let g:typescript_compiler_binary = 'home/jraubenheimer/development/Etsyweb/node_modules/.bin/tsc'
    autocmd QuickFixCmdPost [^l]* nested cwindow
    autocmd QuickFixCmdPost    l* nested lwindow


]])
