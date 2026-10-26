-- Serialize and print tables
P = function(v)
    print(vim.inspect(v))
    return v
end

-- lean.nvim: General configuration
-- Don't open the infoview automatically
vim.g.lean_config = {
    infoview = {autoopen = false},
    -- Hide the orange "still processing" bar
    progress_bars = {enable = false},
    -- Unsolved goals already show up as regular errors, so skip the extra
    -- marker. Finished proofs get a plain sign instead of an emoji.
    goal_markers = {unsolved = '', accomplished = '✓'},
    -- Use Neovim's built-in diagnostic signs so lsp.lua's styling applies
    signs = {enabled = false}
}

-- Color the finished proof sign like other signs.
-- Add a line number color, matches other diagnostics.
local value = {link = 'DiagnosticSignInfo'}
vim.api.nvim_set_hl(0, 'leanGoalsAccomplishedSign', value)
vim.api.nvim_create_autocmd('DiagnosticChanged', {
    group = vim.api.nvim_create_augroup('LeanGoalNumberHl', {}),
    callback = function(args)
        if vim.bo[args.buf].filetype ~= 'lean' then return end
        local ns = vim.api.nvim_get_namespaces()['lean.goal.markers']
        if not ns then return end
        local opts = {details = true, type = 'sign'}
        local marks = vim.api.nvim_buf_get_extmarks(args.buf, ns, 0, -1, opts)
        for _, mark in ipairs(marks) do
            local id, row, col, details = unpack(mark)
            if not details.number_hl_group then
                vim.api.nvim_buf_set_extmark(args.buf, ns, row, col, {
                    id = id,
                    sign_text = details.sign_text,
                    sign_hl_group = details.sign_hl_group,
                    number_hl_group = 'DiagnosticSignInfo'
                })
            end
        end
    end
})
