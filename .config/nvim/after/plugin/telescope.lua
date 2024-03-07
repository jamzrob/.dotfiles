local keyset = vim.keymap.set
require('telescope').setup{
  defaults = {
     vimgrep_arguments = {
         'rg',
         '--color=never',
         '--no-heading',
         '--with-filename',
         '--line-number',
         '--column',
         '--smart-case'
     },
    file_ignore_patterns = {
      "node_modules",
      ".git"
    },
    path_display = {"smart"}
  }
}
local builtin = require('telescope.builtin')
keyset('n', '<leader>ff', builtin.find_files, {})
keyset('n', '<leader>fg', builtin.live_grep, {})
keyset('n', '<leader>fb', builtin.buffers, {})
keyset('n', '<leader>fh', builtin.help_tags, {})
keyset({'n', 'v'}, '<leader>ps', function () builtin.grep_string({ search = vim.fn.input("Grep > ") }) end, {})

keyset('n', '<C-g>', builtin.git_files, {})
keyset('n', '<leader>vrc', function()
    builtin.git_files({
        prompt_title = "< nvim >",
        cwd = '~/.config/nvim',
    })
end)
keyset('n', '<leader>vrw', function()
    builtin.git_files({
        prompt_title = "< nvim >",
        cwd = '~/vimwiki',
    })
end)
keyset('n', '<leader>vrd', function()
    builtin.git_files({
        prompt_title = "< dotfiles >",
        cwd = '~/.dotfiles',
    })
end)
keyset('n', '<leader>vrf', function()
    builtin.live_grep({
        prompt_title = "< nvim >",
        cwd = '~/.config/nvim',
    })
end)
keyset('n', '<leader>fG', function()
    builtin.live_grep({
     vimgrep_arguments = {
         'rg',
         '--color=never',
         '--no-heading',
         '--with-filename',
         '--line-number',
         '--column',
         '--smart-case',
         '--hidden'
     },
    })
end)
keyset('n', '<leader>vrg', function()
    builtin.live_grep({
        prompt_title = "< nvim >",
        cwd = '~/.config/nvim',
    })
end)

keyset('n', '<leader>wg', function()
    builtin.live_grep({
        prompt_title = "< vimwiki >",
        cwd = '~/vimwiki',
        path_display = function(_, path)
          local tail = require("telescope.utils").path_tail(path)
          local filename = string.gsub(tail, ".md", "")
          return filename
        end,
        file_ignore_patterns = { "site_html", "templates" },
    })
end)

function vim.getVisualSelection()
	vim.cmd('noau normal! "vy"')
	local text = vim.fn.getreg('v')
	vim.fn.setreg('v', {})

	text = string.gsub(text, "\n", "")
	if #text > 0 then
		return text
	else
		return ''
	end
end

keyset('v', '<leader>fg', function()
    local text = vim.getVisualSelection()
	builtin.live_grep({ default_text = text })
end)
keyset('n', '<leader>fS', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

local telescope = require('telescope')
local finders = require('telescope.finders')
local pickers = require('telescope.pickers')
local conf = require('telescope.config').values

-- Function to select the current file and two preceding directories
function _G.searchFilePath()
    local current_path = vim.fn.expand('%:p')
    local filename = vim.fn.fnamemodify(current_path, ':t')
    local file = filename:match("^(.-)%.")
    local parent_dir1 = vim.fn.fnamemodify(current_path, ':h:h:t')
    local parent_dir2 = vim.fn.fnamemodify(current_path, ':h:t')
    local search_query = string.format('%s/%s/%s', parent_dir2, parent_dir1, file)

    builtin.live_grep({
        prompt_title = 'Folder Search',
        default_text = search_query,
    })
end

vim.api.nvim_command([[command! -nargs=? SearchFilePath lua searchFilePath(<f-args>)]])
-- Create a key mapping for this function
vim.api.nvim_set_keymap('n', '<Leader>pf', ":SearchFilePath<CR>", { noremap = true, silent = true })
