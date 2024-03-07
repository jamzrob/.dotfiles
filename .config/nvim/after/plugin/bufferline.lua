local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

bufferline.setup({
  options = {
    mode = "tabs",
    separator_style = 'slant',
    always_show_bufferline = false,
    show_buffer_close_icons = false,
    show_close_icon = false,
    color_icons = true
  },
  highlights = {
    separator = {
      guifg = '#073642',
      guibg = '#002b36',
    },
    separator_selected = {
      guifg = '#073642',
    },
    background = {
      guifg = '#657b83',
      guibg = '#002b36'
    },
    buffer_selected = {
      guifg = '#fdf6e3',
      gui = "bold",
    },
    fill = {
      guibg = '#073642'
    }
  },
})

<<<<<<< HEAD
vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', 'gt', '<Cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', 'gT', '<Cmd>BufferLineCycleNext<CR>', {})
=======
vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', 'gT', '<Cmd>BufferLineCyclePrev<CR>', {})
vim.keymap.set('n', 'gt', '<Cmd>BufferLineCycleNext<CR>', {})
>>>>>>> 776b7ed2c4eb0605b84b377e3d2e38681a4f3166
