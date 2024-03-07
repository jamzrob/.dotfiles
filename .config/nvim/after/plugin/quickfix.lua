-- use <C-N> and <C-P> for next/prev.
vim.keymap.set("n", "<C-k>", ":cprev<CR>")
vim.keymap.set("n", "<C-j>", ":cnext<CR>")
-- toggle the quickfix open/closed without jumping to it
vim.keymap.set("n", "<C-q>", ":call ToggleQuickfixList()<CR>")
vim.keymap.set("n", "<C-l>", ":call ToggleLocationList()<CR>")

