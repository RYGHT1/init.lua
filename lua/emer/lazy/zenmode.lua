return {
    "folke/zen-mode.nvim",
    config = function()
        vim.keymap.set("n", "<leader>zz", function()
            require("zen-mode").setup {
                window = {
                    width = 1,
                    options = {
                        signcolumn = "yes",
                    }
                },
                plugins = {
                    alacritty = {
                        enabled = true,
                        font = "10",
                    },
                },
            }
            require("zen-mode").toggle()
            vim.wo.wrap = false
            vim.wo.number = true
            vim.wo.rnu = true
            ColorMyPencils()
        end)
    end
}


