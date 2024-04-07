local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.completion.spell,
		null_ls.builtins.code_actions.textlint,
		null_ls.builtins.completion.luasnip,
		null_ls.builtins.diagnostics.dotenv_linter,
		null_ls.builtins.diagnostics.markdownlint,
		null_ls.builtins.formatting.prettier,
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ async = false })
				end,
			})
		end
	end,
})

-- -- import null-ls plugin safely
-- local setup, null_ls = pcall(require, "null-ls")
-- if not setup then
-- 	return
-- end
--
-- -- for conciseness
-- local formatting = null_ls.builtins.formatting -- to setup formatters
-- local diagnostics = null_ls.builtins.diagnostics -- to setup linters
--
-- -- to setup format on save
-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
--
-- -- configure null_ls
-- null_ls.setup({
-- 	-- setup formatters & linters
-- sources = {
--         require("none-ls.diagnostics.cpplint"),
--         require("none-ls.formatting.jq"),
--         require("none-ls.code_actions.eslint"),
--         require("none-ls-luacheck.diagnostics.luacheck"),
-- 	},
-- 	-- configure format on save
-- 	on_attach = function(current_client, bufnr)
-- 		if current_client.supports_method("textDocument/formatting") then
-- 			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
-- 			vim.api.nvim_create_autocmd("BufWritePre", {
-- 				group = augroup,
-- 				buffer = bufnr,
-- 				callback = function()
-- 					vim.lsp.buf.format({
-- 						filter = function(client)
-- 							--  only use null-ls for formatting instead of lsp server
-- 							return client.name == "null-ls"
-- 						end,
-- 						bufnr = bufnr,
-- 					})
-- 				end,
-- 			})
-- 		end
-- 	end,
-- })
