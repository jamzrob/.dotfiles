-- pass to setup along with your other options
require("nvim-tree").setup {
  hijack_netrw = false,
  disable_netrw = false,
}


vim.api.nvim_set_keymap("n", "<C-h>", ":NvimTreeToggle<cr>", {silent = true, noremap = true})

