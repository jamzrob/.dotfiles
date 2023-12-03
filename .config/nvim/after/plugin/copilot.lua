vim.keymap.set("i", "<C-]>", "copilot#Next()", {remap = true, expr=true, silent=true})
vim.keymap.set("i", "<C-[>", "copilot#Previous()", {remap = true, expr=true, silent=true})
vim.keymap.set("i", "<C-S>", "copilot#Suggest()", {remap = true, expr=true, silent=true})
vim.cmd([[
    let g:copilot_filetypes = { '*': v:true  }
    imap <silent><script><expr> <C-y> copilot#Accept("\<CR>")
    let g:copilot_no_tab_map = v:true
]])
