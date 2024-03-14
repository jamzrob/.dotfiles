local keyset = vim.keymap.set
require('telescope').setup{
  defaults = {
     vimgrep_arguments = { 'rg', '--color=never',
         '--no-heading',
         '--with-filename', '--line-number',
         '--column',
         '--smart-case'
     },
    file_ignore_patterns = {
      "node_modules",
      ".git"
    },
    path_display = {"smart"}
  },
}
require("telescope").load_extension("git_worktree")
local builtin = require('telescope.builtin')
keyset('n', '<leader>ff', builtin.find_files, {})
keyset('n', '<leader>fg', builtin.live_grep, {})
keyset('n', '<leader>fb', builtin.buffers, {})
keyset('n', '<leader>fh', builtin.help_tags, {})
keyset({'n', 'v'}, '<leader>ps', function () builtin.grep_string({ search = vim.fn.input("Grep > ") }) end, {})

keyset('n', '<C-g>', builtin.git_files, {})

keyset('n', '<leader>vrw', function()
    builtin.git_files({
        prompt_title = "< nvim >",
        cwd = '~/vimwiki',
    })
end)
keyset('n', '<leader>fd', function()
    builtin.find_files({
        prompt_title = "< dotfiles (no nvim) >",
        cwd = '~/.dotfiles',
        no_ignore = true,
        hidden = true,
        file_ignore_patterns = { "nvim", "powerlevel10k", "plugins", ".git" },
        path_display = function(_, path)
          local tail = require("telescope.utils").path_tail(path)
          local filename = string.gsub(tail, ".md", "")
          return filename
        end,
    })
end)

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
keyset('n', '<leader>fp', ":SearchFilePath<CR>", { noremap = true, silent = true })
keyset('n', '<leader>fP', function()
    builtin.find_files({
        prompt_title = "< Packer Search >",
        cwd = '~/.local/share/nvim/site/pack/packer/start',
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


keyset('n', '<leader>fn', function()
    builtin.find_files({
        prompt_title = "< nvim >",
        cwd = '~/.config/nvim',
        file_ignore_patterns = { "packer_compiled.lua" },
        path_display = function(_, path)
          local tail = require("telescope.utils").path_tail(path)
          local filename = string.gsub(tail, ".md", "")
          return filename
        end,
    })
end)

keyset('n', '<leader>fN', function()
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


local wk = require("which-key")
wk.register({
    f = {
        name = "Find",
        S = { "Search string in folders" },
        p = { "Search for imports" },
        P = { "Search packer files" },
        n = { "Search neovim files" },
        N = { "Grep neovim files" },
        d = { "Search dotfiles" },
        D = { "Grep dotfiles" },
        f = { "<cmd>lua require('telescope.builtin').find_files()<CR>", "Find Files" },
        r = { "<cmd>lua require('telescope.builtin').oldfiles()<CR>", "Find Recent Files" },
        g = { "<cmd>lua require('telescope.builtin').live_grep()<CR>", "Find in Project" },
        b = { "<cmd>lua require('telescope.builtin').buffers()<CR>", "Find Buffers" },
        h = { "<cmd>lua require('telescope.builtin').help_tags()<CR>", "Find Help" },
        c = { "<cmd>lua require('telescope.builtin').commands()<CR>", "Find Commands" },
        m = { "<cmd>lua require('telescope.builtin').marks()<CR>", "Find Marks" },
        s = { "<cmd>lua require('telescope.builtin').spell_suggest()<CR>", "Find Spelling Suggestions" },
        t = { "<cmd>lua require('telescope.builtin').treesitter()<CR>", "Find Treesitter" },
        l = { "<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>", "Find Document Symbols" },
        L = { "<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<CR>", "Find Workspace Symbols" },
        o = { "<cmd>lua require('telescope.builtin').lsp_document_diagnostics()<CR>", "Find Document Diagnostics" },
        O = { "<cmd>lua require('telescope.builtin').lsp_workspace_diagnostics()<CR>", "Find Workspace Diagnostics" },
        ["?"] = { "<cmd>lua require('telescope.builtin').builtin()<CR>", "Find Telescope Help" },
    },
}, { prefix = "<leader>" })


