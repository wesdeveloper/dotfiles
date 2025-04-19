local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.completion.spell,
		null_ls.builtins.completion.luasnip,
		null_ls.builtins.formatting.prettierd,
	},
	on_attach = function(client, bufnr)
		if client.name == "ts_ls" then
			client.resolved_capabilities.document_formatting = false -- 0.7 and earlier
			client.server_capabilities.documentFormattingProvider = false -- 0.8 and later
		end
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						filter = function(client)
							--  only use null-ls for formatting instead of lsp server
							return client.name == "null-ls"
						end,
						bufnr = bufnr,
					})
				end,
			})
		end
	end,
})

local prettier = require("prettier")
prettier.setup({
	bin = "prettierd", -- or `'prettierd'` (v0.23.3+)
	filetypes = {
		"css",
		"graphql",
		"html",
		"javascript",
		"javascriptreact",
		"json",
		"less",
		"markdown",
		"scss",
		"typescript",
		"typescriptreact",
		"yaml",
	},
	cli_options = {
		-- https://prettier.io/docs/en/cli.html#--config-precedence
		config_precedence = "prefer-file", -- or "cli-override" or "file-override"
	},
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
