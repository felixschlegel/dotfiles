require("plugins")

local lspconfig = require('lspconfig')
local configs = require('lspconfig/configs')
local servers = { configs.sourcekit }
local telescope = require("telescope")
local fzf_opts = {
  fuzzy = true,                    -- false will only do exact matching
  override_generic_sorter = true,  -- override the generic sorter
  override_file_sorter = true,     -- override the file sorter
  case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                   -- the default case_mode is "smart_case"
}

telescope.setup {
  pickers = {
    -- Manually set sorter, for some reason not picked up automatically
    lsp_dynamic_workspace_symbols = {
      sorter = telescope.extensions.fzf.native_fzf_sorter(fzf_opts)
    },
  },
  extensions = {
    fzf = fzf_opts
  },
}
telescope.load_extension('fzf')


-- Check if the SourceKit-LSP configuration already exists
if not lspconfig.sourcekit then
    configs.sourcekit = {
        default_config = {
            cmd = {'sourcekit-lsp'},
            filetypes = {'swift', 'c', 'cpp'},
            root_dir = lspconfig.util.root_pattern('.git', '*.xcodeproj', '*.xcworkspace', '*.swift', '*.c', '*.cpp'),
            settings = {
                swift = {
                    enableCodeLenses = true,
                    enableIndexStore = true
                }
            }
        }
    }
end

lspconfig.sourcekit.setup{}

-- coq
-- Automatically start coq
vim.g.coq_settings = { auto_start = 'shut-up' }

-- Enable some language servers with the additional completion capabilities offered by coq_nvim
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup(require('coq').lsp_ensure_capabilities({
    -- on_attach = my_custom_on_attach,
  }))
end

-- Keybindings

vim.keymap.set('n', '<C-_>', ':Telescope live_grep<CR>')
vim.keymap.set('n', '<C-P>', ':Telescope lsp_dynamic_workspace_symbols<CR>')
vim.keymap.set('n', '<C-F>', ':Telescope find_files<CR>')
vim.keymap.set('n', '<C-G>', ':Telescope<CR>')
