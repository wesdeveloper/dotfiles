local js_based_languages = {
	"typescript",
	"javascript",
	"typescriptreact",
	"javascriptreact",
	"vue",
}

local dap = require("dap")
dap.adapters.node2 = {
	type = "executable",
	command = "node",
	port = 9229,
	args = {
		os.getenv("HOME") .. "/codebase/vscode-node-debug2/out/src/nodeDebug.js",
	},
}

dap.adapters["pwa-node"] = {
	type = "server",
	host = "localhost",
	port = "${port}",
	executable = {
		command = "node",
		cwd = vim.fn.getcwd(),
		args = {
			os.getenv("HOME") .. "/codebase/js-debug/src/dapDebugServer.js",
			"${port}",
			-- os.getenv("HOME") .. "/codebase/vscode-node-debug2/out/src/nodeDebugAdapter.js",
		},
	},
}

for _, language in ipairs(js_based_languages) do
	dap.configurations[language] = {
		{
			-- For this to work you need to make sure the node process is started with the `--inspect` flag.
			name = "Attach to process my",
			type = "node2",
			request = "attach",
			processId = require("dap.utils").pick_process,
			cwd = "${workspaceFolder}",
			sourceMaps = true,
			skipFiles = { "<node_internals>/**/*.js" },
		},
		{
			type = "node2",
			request = "attach",
			name = "Attach to process node pwa",
			pid = require("dap.utils").pick_process,
			cwd = "${workspaceFolder}",
			sourceMaps = true,
			skipFiles = { "<node_internals>/**/*.js" },
		},
		-- Divider for the launch.json derived configs
		{
			name = "----- ↓ launch.json configs ↓ -----",
			type = "",
			request = "launch",
		},
	}
end

-- require('dap').set_log_level('INFO')
dap.defaults.fallback.terminal_win_cmd = "20split new"
vim.fn.sign_define("DapBreakpoint", { text = "✋", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointRejected", { text = "⚠️", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "⭐️", texthl = "", linehl = "", numhl = "" })

local function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
map("n", "<leader>dh", ':lua require"dap".toggle_breakpoint()<CR>')
map("n", "<leader>dH", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
map("n", "<A-k>", ':lua require"dap".step_out()<CR>')
map("n", "<A-l>", ':lua require"dap".step_into()<CR>')
map("n", "<A-j>", ':lua require"dap".step_over()<CR>')
map("n", "]h", ':lua require"dap".continue()<CR>')
map("n", "<leader>dn", ':lua require"dap".run_to_cursor()<CR>')
map("n", "<leader>dk", ':lua require"dap".up()<CR>zz')
map("n", "<leader>dj", ':lua require"dap".down()<CR>zz')
map("n", "<leader>dc", ':lua require"dap".terminate()<CR>')
map("n", "<leader>dr", ':lua require"dap".repl.toggle({})<CR><C-w>l')
map("n", "<leader>dR", ':lua require"dap".clear_breakpoints()<CR>')
map("n", "<leader>de", ':lua require"dap".set_exception_breakpoints({"all"})<CR>')
map("n", "<leader>da", ':lua require"debughelper".attach()<CR>')
map("n", "<leader>dA", ':lua require"debughelper".attachToProcess()<CR>')
map("n", "<leader>di", ':lua require"dap.ui.widgets".hover()<CR>')
map("n", "<leader>d?", ':lua local widgets=require"dap.ui.widgets";widgets.centered_float(widgets.scopes)<CR>')
map("n", "<leader>uit", ':lua require"dapui".toggle()<CR>')

-- nvim-telescope/telescope-dap.nvim
require("telescope").load_extension("dap")
map("n", "<leader>ds", ":Telescope dap frames<CR>")
-- map('n', '<leader>dc', ':Telescope dap commands<CR>')
map("n", "<leader>db", ":Telescope dap list_breakpoints<CR>")

-- nvim-telescope/telescope-file-browser.nvim
-- require('telescope').load_extension('file_browser')
-- theHamsta/nvim-dap-virtual-text and mfussenegger/nvim-dap
require("nvim-dap-virtual-text").setup()
--require("jester").setup({ path_to_jest = "/opt/homebrew/bin/jest" })
