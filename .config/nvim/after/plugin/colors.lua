vim.g.mapleader = " "
local keyset = vim.keymap.set

require('rose-pine').setup({
	disable_background = true,
})

require("gruvbox").setup({
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = true,
    comments = true,
    operators = false,
    folds = true,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false, invert_tabline = false,
  invert_intend_guides = false,
  inverse = true,
  palette_overrides = {},
  overrides = {},
  dim_inactive = false,
  transparent_mode = true, })

function ColorMyPencils(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none", ctermbg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none", ctermbg = "none"  })
    vim.api.nvim_set_hl(0, "Float", { bg = "none", ctermbg = "none"  })
    vim.api.nvim_set_hl(0, "ColorColumn", { fg = "none", bg="none" })
    vim.api.nvim_set_hl(0, "CursorLine", { fg = "none", bg="none", ctermbg = "none" })
    vim.api.nvim_set_hl(0, "LineNr", {fg = "#595959", bg="#3b2e2b"})
    vim.api.nvim_set_hl(0, "SignColumn", {fg = "#595959", bg="#3b2e2b"})
    vim.opt.signcolumn = "no"
end
ColorMyPencils("rose-pine")
