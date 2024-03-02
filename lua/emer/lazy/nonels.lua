return {
    "nvimtools/none-ls.nvim",
    dependencies = {
        "nvimtools/none-ls-extras.nvim",
    },
    config = function()
        local null_ls = require("null-ls")

        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua,

                require("none-ls.code_actions.eslint"),
                require("none-ls.diagnostics.eslint"),
                null_ls.builtins.formatting.prettier,

                null_ls.builtins.completion.spell,

                null_ls.builtins.formatting.google_java_format,

                null_ls.builtins.formatting.rubocop,
                null_ls.builtins.diagnostics.rubocop,
            },
        })
    end,
}
