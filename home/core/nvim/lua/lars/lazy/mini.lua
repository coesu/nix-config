return {
    "echasnovski/mini.nvim",
    config = function()
        local opts = function(label)
            return { noremap = true, silent = true, desc = label }
        end
        require('mini.ai').setup()        -- a/i textobjects
        require('mini.bracketed').setup() -- unimpaired bindings with TS
        local oil_style = function()
            if not MiniFiles.close() then
                MiniFiles.open(vim.api.nvim_buf_get_name(0))
                MiniFiles.reveal_cwd()
            end
        end
        vim.keymap.set('n', '-', oil_style, opts("File Explorer"));
        local hipatterns = require('mini.hipatterns')
        hipatterns.setup({ -- highlight strings and colors
            highlighters = {
                -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
                fixme     = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
                hack      = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
                todo      = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
                note      = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },

                -- Highlight hex color strings (`#rrggbb`) using that color
                hex_color = hipatterns.gen_highlighter.hex_color(),
            }
        })
        -- require('mini.operators').setup()
        require('mini.icons').setup() -- minimal icons
        require('mini.jump').setup()  -- fFtT work past a line
        local MiniJump2d = require('mini.jump2d').setup({
            view = {
                dim = true
            },
            mappings = {
                start_jumping = ""
            }
        })
        vim.keymap.set('n', 'gw', "<cmd>:lua MiniJump2d.start(MiniJump2d.builtin_opts.single_character)<cr>",
            opts("Jump to Word"))
        require('mini.surround').setup()
    end,
}
