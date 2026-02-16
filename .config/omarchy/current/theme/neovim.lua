return {
    {
        "bjarneo/aether.nvim",
        branch = "v2",
        name = "aether",
        priority = 1000,
        opts = {
            transparent = false,
            colors = {
                -- Background colors
                bg = "#0d0b09",
                bg_dark = "#0d0b09",
                bg_highlight = "#897e72",

                -- Foreground colors
                -- fg: Object properties, builtin types, builtin variables, member access, default text
                fg = "#ffffff",
                -- fg_dark: Inactive elements, statusline, secondary text
                fg_dark = "#e3dbdb",
                -- comment: Line highlight, gutter elements, disabled states
                comment = "#897e72",

                -- Accent colors
                -- red: Errors, diagnostics, tags, deletions, breakpoints
                red = "#c8b6b4",
                -- orange: Constants, numbers, current line number, git modifications
                orange = "#efe9e9",
                -- yellow: Types, classes, constructors, warnings, numbers, booleans
                yellow = "#d5905e",
                -- green: Comments, strings, success states, git additions
                green = "#87a2b0",
                -- cyan: Parameters, regex, preprocessor, hints, properties
                cyan = "#c4c5c6",
                -- blue: Functions, keywords, directories, links, info diagnostics
                blue = "#97afbf",
                -- purple: Storage keywords, special keywords, identifiers, namespaces
                purple = "#cda498",
                -- magenta: Function declarations, exception handling, tags
                magenta = "#ecdad5",
            },
        },
        config = function(_, opts)
            require("aether").setup(opts)
            vim.cmd.colorscheme("aether")

            -- Enable hot reload
            require("aether.hotreload").setup()
        end,
    },
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "aether",
        },
    },
}
