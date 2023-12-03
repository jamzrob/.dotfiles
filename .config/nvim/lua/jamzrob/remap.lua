vim.g.mapleader = " "

--der moving lines vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keep cursor with J
vim.keymap.set("n", "J", "mzJ`z")

-- keep cursor in middle when jumping
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- keep cursor in middle when searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- delete to void
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- use system clipboard
vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]])
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set("n", "<leader>P", [["+P]])

-- vertical mode needs this
vim.keymap.set("i", "<C-c>", "<Esc>")

-- not fun to press
vim.keymap.set("n", "Q", "<nop>")

-- switch projects
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- quickfix navigation
vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- replace word you are on
vim.keymap.set("n", "<leader>S", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- give executable permissions
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Tab navigation
vim.keymap.set("n", "<leader>T", "zz:tabnew<CR>")
vim.keymap.set("n", "<C-n>", "zzgt")
vim.keymap.set("n", "<C-P>", "zzgT")

-- Split windows
vim.keymap.set("n", "<leader>pv", ":Vex!<CR>")
vim.keymap.set("n", "<leader>sv", ":sp!<CR>")
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

-- reload config
-- vim.keymap.set("n", "<leader>CR", ":source ~/.config/nvim/init.lua")
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

-- toggle page back
vim.keymap.set("n", "<C-b>", "<C-^>")

-- Open file tree
vim.keymap.set("n", "<c-x>", ":Ex<CR>")

-- Reload file
vim.keymap.set("n", "<leader><CR>", ":so %<CR>");


-- open config file
function OpenFileInVerticalSplit(path)
    vim.cmd('vsp ' .. path)
end

vim.api.nvim_set_keymap('n', '<leader>vrf', [[:lua OpenFileInVerticalSplit('~/.dotfiles/.config/nvim')<CR>]],
    { noremap = true, silent = true })

-- etsy tests
vim.api.nvim_set_keymap('n', '<leader>t', [[:tabe `run_test -n %`<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>rt', [[:!run_test %<CR>]], { noremap = true, silent = true })


-- wrap wonder under cursor in console.log
function _G.log_word()
    local word = vim.fn.expand('<cword>')
    if word ~= '' then
        vim.fn.setreg('1', 'console.log("' .. word .. ': ", ' .. word .. ');')
        vim.cmd('normal! viw"1P')
    end
end

vim.api.nvim_command([[command! -nargs=? LogWord lua log_word(<f-args>)]])
vim.api.nvim_set_keymap('n', '<Leader>cl', ":LogWord<CR>", { noremap = true, silent = true })

