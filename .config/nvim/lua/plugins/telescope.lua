return {
    'nvim-telescope/telescope.nvim',
    cmd = "Telescope",
    dependencies = {
        {'nvim-lua/plenary.nvim'},
        {'kdheepak/lazygit.nvim'},
        {'nvim-telescope/telescope-file-browser.nvim'},
        {'nvim-telescope/telescope-fzf-native.nvim', build = 'make'},
        {'nvim-telescope/telescope-dap.nvim'},
    },
    keys = {
        {'<leader>ft', function() require('telescope.builtin').builtin() end, desc = "Telescope"},
        {'<leader>ff', function() require("telescope.builtin").find_files() end, desc = "Find Files"},
        {'<leader>fg', function() require("telescope.builtin").live_grep() end, desc = "Live Grep"},
        {'<leader>fz', function() require("telescope.builtin").current_buffer_fuzzy_find() end, desc = "Current Buffer Fuzzy Find"},
        {'<leader>fs', function() require("telescope.builtin").grep_string() end, desc = "Grep String"},
        {'<leader>fv', function() require("telescope.builtin").lsp_document_symbols() end, desc = "LSP Doc Symbols"},
        {'<leader>fe', function() require("telescope").extensions.file_browser.file_browser() end, desc = "File Browser"},
        {'<leader>fh', function() require("telescope.builtin").help_tags() end, desc = "Help Tags"},
        {'<leader>fl', function() require("telescope").extensions.lazygit.lazygit() end, desc = "Lazy Git"},
    },
    config = function()
        require('telescope').setup({
            defaults = {
                mapping = {
                    i = {
                        ['<C-h>'] = 'which_key'
                    }
                },
                layout_config = {
                    vertical = {
                        results_height = 0.9,
                        preview_height = 0.6,
                        mirror = true,
                        prompt_position = 'bottom'
                    },
                    width = 0.95,
                    height = 0.95,
                },
                layout_strategy = 'vertical',
            }
        })
        require('telescope').load_extension('fzf')
        require("telescope").load_extension('file_browser')
        require('telescope').load_extension('lazygit')
        require('telescope').load_extension('dap')
        vim.cmd "autocmd User TelescopePreviewerLoaded setlocal number"
    end,
 }
