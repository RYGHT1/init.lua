return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
		"gbprod/none-ls-shellcheck.nvim",
	},
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,

				null_ls.builtins.formatting.prettierd.with({
					env = { "PRETTIERD_DEFAULT_CONFIG", vim.fn.expand("~/.config/nvim/linters/.prettierrc") },
				}),

				null_ls.builtins.formatting.rubocop,
				null_ls.builtins.diagnostics.rubocop,

				require("null-ls").register(require("none-ls-shellcheck.diagnostics")),
				require("null-ls").register(require("none-ls-shellcheck.code_actions")),
				null_ls.builtins.formatting.shfmt.with({
					extra_args = { "-i", "2", "-ci" },
				}),
			},
		})
	end,
}
