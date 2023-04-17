local grapple = require('grapple');

-- Grapple configuration
grapple.setup({
    popup_options = {
        -- Override some defaults
        width = 120,
        border = 'rounded'
    }
})

-- Mapping most commonly used functions
vim.keymap.set('n', '<leader>go', grapple.popup_tags)
vim.keymap.set('n', '<leader>gh', grapple.cycle_forward)
vim.keymap.set('n', '<leader>gm', grapple.toggle)
