return {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    config = function()
        require("refactoring").setup()
        vim.keymap.set("v", "<leader>rm", function() require('refactoring').refactor('Extract Function') end)
        vim.keymap.set("x", "<leader>rv", function() require('refactoring').refactor('Extract Variable') end)
        vim.keymap.set("n", "<leader>rI", function() require('refactoring').refactor('Inline Function') end)
        vim.keymap.set({ "n", "x" }, "<leader>ri", function() require('refactoring').refactor('Inline Variable') end)
        vim.keymap.set("n", "<leader>rb", function() require('refactoring').refactor('Extract Block') end)

        require("telescope").load_extension("refactoring")
        vim.keymap.set({"n", "x"}, "<leader>rr", function()
            require('telescope').extensions.refactoring.refactors()
        end)
    end,
}
