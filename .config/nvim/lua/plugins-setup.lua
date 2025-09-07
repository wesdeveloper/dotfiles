local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	-- Core Dependencies
	"nvim-lua/plenary.nvim",
	"MunifTanjim/nui.nvim",
	"nvim-tree/nvim-web-devicons",

	-- UI and Theming
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "macchiato",
				transparent_background = true,
				term_colors = true,
				integrations = {
					cmp = true,
					gitsigns = true,
					telescope = true,
					nvimtree = true,
					notify = true,
					mini = true,
				},
			})
		end,
	},
	{
		"marko-cerovac/material.nvim",
		config = function()
			require("material").setup({
				plugins = {
					"dap",
					"gitsigns",
					"indent-blankline",
					"lspsaga",
					"nvim-cmp",
					"nvim-tree",
					"nvim-web-devicons",
					"telescope",
					"trouble",
					"which-key",
					"nvim-notify",
				},
				high_visibility = {
					lighter = true,
					darker = true,
				},
				disable = {
					background = true,
				},
				lualine_style = "default",
				async_loading = true,
			})
		end,
	},
	"mhinz/vim-startify",
	"lukas-reineke/indent-blankline.nvim",
	"xiyaowong/nvim-transparent",
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = {
					icons_enabled = true,
					theme = "auto",
					component_separators = { left = "", right = "" },
					section_separators = { left = "", right = "" },
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch", "diff", "diagnostics" },
					lualine_c = { "filename" },
					lualine_x = { "encoding", "fileformat", "filetype" },
					lualine_y = { "progress" },
					lualine_z = { "location" },
				},
			})
		end,
	},

	-- Editor Enhancement
	"christoomey/vim-tmux-navigator",
	"szw/vim-maximizer",
	"editorconfig/editorconfig-vim",
	"machakann/vim-highlightedyank",
	"terryma/vim-multiple-cursors",
	"RRethy/vim-illuminate",

	-- Buffer and Tab Management
	{
		"romgrk/barbar.nvim",
		dependencies = {
			"lewis6991/gitsigns.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		init = function()
			vim.g.barbar_auto_setup = false
		end,
		opts = {
			animation = true,
			clickable = true,
			highlight_visible = true,
			icons = {
				buffer_index = false,
				buffer_number = false,
				button = "",
				filetype = {
					custom_colors = false,
					enabled = true,
				},
				separator = { left = "▎", right = "" },
				separator_at_end = true,
				modified = { button = "●" },
				pinned = { button = "", filename = true },
				preset = "default",
			},
		},
		version = "^1.0.0",
	},
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
	},

	-- File Navigation and Search
	-- "nvim-tree/nvim-tree.lua",
	-- "nvim-neo-tree/neo-tree.nvim",
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
		},
		config = function()
			require("telescope").load_extension("notify")
		end,
	},

	-- Git Integration
	"tpope/vim-fugitive",
	"lewis6991/gitsigns.nvim",
	{ "akinsho/git-conflict.nvim", version = "*", config = true },
	"sindrets/diffview.nvim",
	{
		"f-person/git-blame.nvim",
		event = "VeryLazy",
		opts = {
			enabled = true,
			message_template = " <author> • <summary> • <date> • <<sha>>",
			date_format = "%m-%d-%Y %H:%M:%S",
			virtual_text_column = 1,
		},
	},

	-- LSP and Completion
	"neovim/nvim-lspconfig",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/vim-vsnip",
	{
		"glepnir/lspsaga.nvim",
		branch = "main",
		config = function()
			require("lspsaga").setup({})
		end,
	},
	-- {
	-- 	"pmizio/typescript-tools.nvim",
	-- 	dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	-- 	opts = {},
	-- },
	"onsails/lspkind.nvim",
	"ray-x/lsp_signature.nvim",

	-- Snippets
	"L3MON4D3/LuaSnip",
	"saadparwaiz1/cmp_luasnip",
	"rafamadriz/friendly-snippets",

	-- Code Analysis and Formatting
	"jayp0521/mason-null-ls.nvim",
	{
		"nvimtools/none-ls.nvim",
		dependencies = {
			"nvimtools/none-ls-extras.nvim",
			"gbprod/none-ls-luacheck.nvim",
		},
	},
	"sbdchd/neoformat",
	"MunifTanjim/prettier.nvim",

	-- Treesitter
	"nvim-treesitter/nvim-treesitter",
	"windwp/nvim-autopairs",
	{ "windwp/nvim-ts-autotag", after = "nvim-treesitter" },

	-- Comments and Documentation
	{
		"terrortylor/nvim-comment",
		config = function()
			require("nvim_comment").setup()
		end,
	},
	{
		"folke/todo-comments.nvim",
		config = function()
			require("todo-comments").setup()
		end,
	},

	-- Debugging
	"ravenxrz/DAPInstall.nvim",
	"mfussenegger/nvim-dap",
	"theHamsta/nvim-dap-virtual-text",
	"nvim-telescope/telescope-dap.nvim",
	{
		"David-Kunz/jester",
		opts = {},
		config = function()
			require("jester").setup({
				cmd = "./node_modules/.bin/jest -t '$result' -- $file", -- run command
				identifiers = { "test", "it" }, -- used to identify tests
				prepend = { "describe" }, -- prepend describe blocks
				expressions = { "call_expression" }, -- tree-sitter object used to scan for tests/describe blocks
				path_to_jest_run = "./node_modules/.bin/jest", -- used to run tests
				path_to_jest_debug = "./node_modules/.bin/jest", -- used for debugging
				terminal_cmd = ":vsplit | terminal", -- used to spawn a terminal for running tests, for debugging refer to nvim-dap's config
				dap = { -- debug adapter configuration
					type = "node2",
					request = "launch",
					name = "Jest Dap",
					cwd = vim.fn.getcwd(),
					runtimeArgs = { "--inspect-brk", "$path_to_jest", "--no-coverage", "-t", "$result", "--", "$file" },
					args = { "--no-cache" },
					sourceMaps = false,
					protocol = "inspector",
					skipFiles = { "<node_internals>/**/*.js" },
					console = "integratedTerminal",
					port = 9229,
					disableOptimisticBPs = true,
				},
			})
		end,
	},
	"preservim/vimux",

	-- AI Assistance
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({})
		end,
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "github/copilot.vim" },
			{ "nvim-lua/plenary.nvim", branch = "master" },
		},
		build = "make tiktoken",
		opts = {
			model = "claude-3.5-sonnet",
		},
	},
	{
		"zbirenbaum/copilot-cmp",
		after = { "copilot.lua" },
		config = function()
			require("copilot_cmp").setup()
		end,
	},
	{
		"yetone/avante.nvim",
		event = "VeryLazy",
		version = false, -- Never set this value to "*"! Never!
		opts = {
			-- add any opts here
			-- for example
			provider = "copilot",
		},
		-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
		build = "make",
		-- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"stevearc/dressing.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			--- The below dependencies are optional,
			"echasnovski/mini.pick", -- for file_selector provider mini.pick
			"nvim-telescope/telescope.nvim", -- for file_selector provider telescope
			"hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
			"ibhagwan/fzf-lua", -- for file_selector provider fzf
			"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
			"zbirenbaum/copilot.lua", -- for providers='copilot'
			{
				-- support for image pasting
				"HakonHarnes/img-clip.nvim",
				event = "VeryLazy",
				opts = {
					-- recommended settings
					default = {
						embed_image_as_base64 = false,
						prompt_for_file_name = false,
						drag_and_drop = {
							insert_mode = true,
						},
						-- required for Windows users
						use_absolute_path = true,
					},
				},
			},
			{
				-- Make sure to set this up properly if you have lazy=true
				"MeanderingProgrammer/render-markdown.nvim",
				opts = {
					file_types = { "markdown", "Avante" },
				},
				ft = { "markdown", "Avante" },
			},
		},
	},

	-- Utility and Misc
	{
		"rcarriga/nvim-notify",
		config = function()
			require("notify").setup({
				background_colour = "#000000",
			})
			vim.notify = require("notify")
		end,
	},
	{
		"tomasky/bookmarks.nvim",
		event = "VimEnter",
		config = function()
			require("bookmarks").setup({
				save_file = vim.fn.expand("$HOME/.bookmarks"),
				keywords = {
					["@t"] = "☑️ ",
					["@w"] = "⚠️ ",
					["@f"] = "⛏ ",
					["@n"] = " ",
				},
			})
			require("telescope").load_extension("bookmarks")
		end,
	},
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		---@type snacks.Config
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			bigfile = { enabled = true },
			dashboard = {
				enabled = false,
			},
			explorer = { enabled = true, replace_netrw = true },
			indent = { enabled = true },
			input = { enabled = true },
			picker = { enabled = true },
			notifier = { enabled = true },
			quickfile = { enabled = false },
			scope = { enabled = true },
			scroll = { enabled = true },
			-- statuscolumn = { enabled = true },
			words = { enabled = true },
		},
		keys = {
			{
				"<leader>e",
				function()
					Snacks.explorer()
				end,
				desc = "File Explorer",
			},
		},
	},
	{
		"rest-nvim/rest.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			opts = function(_, opts)
				opts.ensure_installed = opts.ensure_installed or {}
				table.insert(opts.ensure_installed, "http")
			end,
		},
		config = function()
			require("rest-nvim").setup({
				response = {
					---Default response hooks
					---@class rest.Config.Response.Hooks
					hooks = {
						---@type boolean Decode the request URL segments on response UI to improve readability
						decode_url = true,
						---@type boolean Format the response body using `gq` command
						format = true,
						-- formatters = {
						-- 	json = "jq",
						-- 	html = function(body)
						-- 		return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
						-- 	end,
						-- },
					},
				},
			})
		end,
	},
	{
		"kylechui/nvim-surround",
		version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},

	{
		"nvim-neotest/neotest",
		commit = "52fca6717ef972113ddd6ca223e30ad0abb2800c", -- latest as of 2024-06-19
		settings = {
			watch = true,
		},
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			"marilari88/neotest-vitest",
			"nvim-neotest/neotest-jest",
		},
		keys = {
			{ "<leader>tr", "<cmd>Neotest run<cr>" },
			{ "<leader>ti", "<cmd>Neotest output<cr>" },
			{ "<leader>ts", "<cmd>Neotest summary<cr>" },
			{ "<leader>ta", "<cmd>lua require('neotest').run.run({ suite = true })<cr>" },
		},
		config = function()
			require("neotest").setup({
				settings = {
					watch = true,
				},
				adapters = {
					require("neotest-vitest"),
					require("neotest-jest")({
						jestCommand = "./node_modules/.bin/jest",
						jestConfigFile = "jest.config.ts",
						env = { CI = true },
						cwd = function(path)
							return vim.fn.getcwd()
						end,
						isTestFile = require("neotest-jest.jest-util").defaultIsTestFile,
					}),
				},
				strategies = {
					["dap"] = {},
				},
			})
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		config = function()
			require("dapui").setup()
		end,
	},
}

local opts = {}
require("lazy").setup(plugins, opts)
