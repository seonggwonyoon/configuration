vim.g.mapleader = ' '

local o = vim.opt
o.number = true
o.relativenumber = true
o.cursorline = true
o.ignorecase = true
o.smartcase = true
o.clipboard = 'unnamedplus'
o.scrolloff = 8
o.signcolumn = 'yes'
o.updatetime = 300
o.timeoutlen = 500
o.swapfile = false
o.undofile = true
o.splitbelow = true
o.splitright = true
o.tabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.smartindent = true
o.completeopt = 'menuone,noselect,popup,fuzzy'

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'yaml', 'json', 'dockerfile', 'terraform', 'hcl', 'lua', 'javascript', 'typescript' },
  command = 'setlocal ts=2 sts=2 sw=2 expandtab',
})
vim.api.nvim_create_autocmd('FileType', { pattern = 'go', command = 'setlocal ts=4 sts=4 sw=4 noexpandtab' })

vim.pack.add({
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/ibhagwan/fzf-lua',
  'https://github.com/lewis6991/gitsigns.nvim',
  'https://github.com/ellisonleao/gruvbox.nvim',
})

vim.cmd.colorscheme('gruvbox')

vim.lsp.config('yamlls', { settings = { yaml = { format = { enable = true } } } })
vim.lsp.config('lua_ls', { settings = { Lua = { workspace = { library = { vim.env.VIMRUNTIME } } } } })
vim.lsp.enable({ 'gopls', 'ruff', 'basedpyright', 'terraformls', 'yamlls', 'dockerls', 'vtsls', 'lua_ls' })
vim.diagnostic.config({ virtual_text = true })

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
    end
    if client:supports_method('textDocument/formatting') then
      vim.api.nvim_create_autocmd('BufWritePre', {
        buffer = args.buf,
        callback = function() vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 2000 }) end,
      })
    end
  end,
})

local map = vim.keymap.set
local fzf = require('fzf-lua')
local gs = require('gitsigns')
gs.setup()

map('n', '<leader>ff', fzf.files)
map('n', '<leader>fg', fzf.live_grep)
map('n', '<leader>fb', fzf.buffers)
map('n', '<leader>fh', fzf.oldfiles)
map('n', '<leader>fd', fzf.diagnostics_document)
map('n', 'gd', vim.lsp.buf.definition)
map('n', '<leader>e', vim.cmd.Explore)

map('n', '<leader>gg', '<cmd>tab terminal lazygit<cr><cmd>startinsert<cr>')
map('n', '<leader>gn', function() gs.nav_hunk('next') end)
map('n', '<leader>gp', function() gs.nav_hunk('prev') end)
map('n', '<leader>ga', gs.stage_hunk)
map('n', '<leader>gu', gs.reset_hunk)
map('n', '<leader>gb', gs.blame_line)

map('n', '<leader>tn', vim.cmd.tabnew)
map('n', '<leader>tc', vim.cmd.tabclose)
map('n', '<leader>to', vim.cmd.tabonly)
map('n', ']t', vim.cmd.tabnext)
map('n', '[t', vim.cmd.tabprevious)

map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

map('n', '<leader>w', vim.cmd.write)
map('n', '<leader>q', vim.cmd.quit)
map('n', '<leader>bd', vim.cmd.bdelete)

map('n', '<A-j>', '<cmd>m .+1<cr>==')
map('n', '<A-k>', '<cmd>m .-2<cr>==')
map('v', '<A-j>', ":m '>+1<cr>gv=gv")
map('v', '<A-k>', ":m '<-2<cr>gv=gv")
