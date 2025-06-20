-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Go to the explorer
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex, { desc = 'Open File Explorer' })
-- Go to Oil explorer
vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open Oil Explorer' })

-- Quick fix navigation
vim.keymap.set('n', '<leader>pk', '<cmd>cprev<CR>', { desc = 'Previous item in quickfix list' })
vim.keymap.set('n', '<leader>pj', '<cmd>cnext<CR>', { desc = 'Next item in quickfix list' })

-- Location navigation
vim.keymap.set('n', '<C-k>', '<cmd>lprev<CR>', { desc = 'Previous item in location list' })
vim.keymap.set('n', '<C-j>', '<cmd>lnext<CR>', { desc = 'Next item in location list' })

-- New tab
vim.keymap.set('n', '<C-t>', '<cmd>tabnew<CR>')

-- Buffer navigation
vim.keymap.set('n', '<C-h>', '<cmd>bprev<CR>')
vim.keymap.set('n', '<C-l>', '<cmd>bnext<CR>')

-- Delete buffer
vim.keymap.set('n', '<C-x>', '<cmd>bdel<CR>')

-- Default format
vim.keymap.set('n', '<leader>pf', 'gg=G<C-o>', { desc = 'Format buffer vith vim' })

-- Remap <Esc> to <C-c>
vim.keymap.set('i', '<C-c>', '<Esc>', { desc = 'Remap <Esc> key' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
-- vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
-- vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
-- vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
-- vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})
