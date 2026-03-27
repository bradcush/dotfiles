-- Deeps manual setup required
require('deeps').setup({
    api_key_cmd = 'dcli n OPENAI_API_KEY',
    model = 'gpt-3.5-turbo',
    orientation = 'horizontal'
})

-- Mapping to show the deeps visual mode menu
local opts = {noremap = true, silent = true}
vim.keymap.set('v', '<leader>dp', require('deeps').show_menu, opts)
