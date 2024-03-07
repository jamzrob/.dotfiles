local wk = require("which-key")
-- As an example, we will create the following mappings:
--  * <leader>ff find files
--  * <leader>fr show recent files
--  * <leader>fb Foobar
-- we'll document:
--  * <leader>fn new file
--  * <leader>fe edit file
-- and hide <leader>1

--[[
wk.register({
  c = { name = "ChatGPT",
    c = { "<cmd>ChatGPT<CR>", "ChatGPT" },
    e = { "<cmd>ChatGPTEditWithInstruction<CR>", "Edit with instruction", mode = { "n", "v" } },
    g = { "<cmd>ChatGPTRun grammar_correction<CR>", "Grammar Correction", mode = { "n", "v" } },
    t = { "<cmd>ChatGPTRun translate<CR>", "Translate", mode = { "n", "v" } },
    k = { "<cmd>ChatGPTRun keywords<CR>", "Keywords", mode = { "n", "v" } },
    d = { "<cmd>ChatGPTRun docstring<CR>", "Docstring", mode = { "n", "v" } },
    a = { "<cmd>ChatGPTRun add_tests<CR>", "Add Tests", mode = { "n", "v" } },
    o = { "<cmd>ChatGPTRun optimize_code<CR>", "Optimize Code", mode = { "n", "v" } },
    s = { "<cmd>ChatGPTRun summarize<CR>", "Summarize", mode = { "n", "v" } },
    f = { "<cmd>ChatGPTRun fix_bugs<CR>", "Fix Bugs", mode = { "n", "v" } },
    x = { "<cmd>ChatGPTRun explain_code<CR>", "Explain Code", mode = { "n", "v" } },
    r = { "<cmd>ChatGPTRun roxygen_edit<CR>", "Roxygen Edit", mode = { "n", "v" } },
    l = { "<cmd>ChatGPTRun code_readability_analysis<CR>", "Code Readability Analysis", mode = { "n", "v" } },
  },
}, { prefix = "<leader>" })
]]
wk.register({
    f = {
        name = "Find",
        f = { "<cmd>lua require('telescope.builtin').find_files()<CR>", "Find Files" },
        b = { "<cmd>lua require('telescope.builtin').buffers()<CR>", "Find Buffers" },
        h = { "<cmd>lua require('telescope.builtin').help_tags()<CR>", "Find Help" },
        r = { "<cmd>lua require('telescope.builtin').oldfiles()<CR>", "Find Recent Files" },
        g = { "<cmd>lua require('telescope.builtin').live_grep()<CR>", "Find in Project" },
        c = { "<cmd>lua require('telescope.builtin').commands()<CR>", "Find Commands" },
        m = { "<cmd>lua require('telescope.builtin').marks()<CR>", "Find Marks" },
        s = { "<cmd>lua require('telescope.builtin').spell_suggest()<CR>", "Find Spelling Suggestions" },
        t = { "<cmd>lua require('telescope.builtin').treesitter()<CR>", "Find Treesitter" },
        l = { "<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>", "Find Document Symbols" },
        L = { "<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<CR>", "Find Workspace Symbols" },
        o = { "<cmd>lua require('telescope.builtin').lsp_document_diagnostics()<CR>", "Find Document Diagnostics" },
        O = { "<cmd>lua require('telescope.builtin').lsp_workspace_diagnostics()<CR>", "Find Workspace Diagnostics" },
        f = {  "Search file path" },
        ["?"] = { "<cmd>lua require('telescope.builtin').builtin()<CR>", "Find Telescope Help" },
    },
}, { prefix = "<leader>" })

wk.register({
    cr = {
        name = "abolish",
        s = { "snake_case" },
        c = { "camelCase" },
        p = { "PascalCase" },
        u = { "SNAKE_UPPERCASE" },
        ["-"] = { "dash-case" },
        ["."] = { "dot.case" },
    },
}, { prefix = "<leader>" })
-- make another mapping








