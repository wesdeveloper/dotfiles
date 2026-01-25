-- ============================================================================
-- Lazy.nvim Plugin Manager Setup
-- ============================================================================
-- This section bootstraps lazy.nvim, a modern plugin manager for Neovim
-- If lazy.nvim is not installed, it will be automatically cloned from GitHub

-- Define the installation path for lazy.nvim in Neovim's data directory
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Check if lazy.nvim is already installed
if not vim.loop.fs_stat(lazypath) then
	-- Clone lazy.nvim from GitHub if not found
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none", -- Partial clone for faster download
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- Use the latest stable release
		lazypath,
	})
end

-- Add lazy.nvim to the runtime path so Neovim can find it
vim.opt.rtp:prepend(lazypath)

-- ============================================================================
-- Plugin Definitions
-- ============================================================================
-- This table contains all plugins to be managed by lazy.nvim
-- Each entry can be a simple string (plugin name) or a table with configuration

local plugins = {
	-- ============================================================================
	-- Core Dependencies
	-- ============================================================================
	-- These plugins provide essential utilities and APIs required by other plugins
	"nvim-lua/plenary.nvim", -- Comprehensive Lua functions library (required by many plugins)
	"MunifTanjim/nui.nvim", -- UI component library for creating custom interfaces
	"nvim-tree/nvim-web-devicons", -- Filetype icons for better visual experience

	-- UI and Theming
	-- Plugins to customize the appearance of Neovim, including colorschemes and theme integrations.
	{
		"catppuccin/nvim", -- Catppuccin theme with macchiato flavour
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "macchiato", -- Use the macchiato flavour
				transparent_background = true,
				term_colors = true,
				integrations = { -- Integration with other plugins
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
		"marko-cerovac/material.nvim", -- Material design theme with deep ocean variant
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
	"mhinz/vim-startify", -- Fancy start screen for Vim with recent files and sessions
	"lukas-reineke/indent-blankline.nvim", -- Adds indentation guides to all lines (including empty lines)
	"xiyaowong/nvim-transparent", -- Remove background color to make Neovim transparent
	{
		"nvim-lualine/lualine.nvim", -- Fast and easy to configure statusline plugin
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

	-- ============================================================================
	-- Editor Enhancement
	-- ============================================================================
	-- Plugins that improve the editing experience
	"christoomey/vim-tmux-navigator", -- Seamless navigation between tmux panes and vim splits
	"szw/vim-maximizer", -- Maximize and restore current window
	"editorconfig/editorconfig-vim", -- EditorConfig support for maintaining consistent coding styles
	"machakann/vim-highlightedyank", -- Highlight yanked text briefly
	"terryma/vim-multiple-cursors", -- Multiple cursor support like in Sublime Text
	"RRethy/vim-illuminate", -- Automatically highlight other uses of the word under cursor

	-- ============================================================================
	-- Buffer and Tab Management
	-- ============================================================================
	-- Plugins for managing buffers and tabs
	{
		"romgrk/barbar.nvim", -- Tabline plugin with re-orderable, auto-sizing tabs
		dependencies = {
			"lewis6991/gitsigns.nvim", -- Git integration for buffer indicators
			"nvim-tree/nvim-web-devicons", -- File icons
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
		"akinsho/bufferline.nvim", -- Alternative bufferline plugin
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
	},

	-- ============================================================================
	-- File Navigation and Search
	-- ============================================================================
	-- Fuzzy finder and file explorer plugins
	-- Note: nvim-tree and neo-tree are commented out, using snacks.nvim explorer instead
	-- "nvim-tree/nvim-tree.lua", -- File explorer (disabled)
	-- "nvim-neo-tree/neo-tree.nvim", -- Alternative file explorer (disabled)
	{
		"nvim-telescope/telescope.nvim", -- Highly extendable fuzzy finder over lists
		branch = "0.1.x",
		dependencies = {
			{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }, -- FZF sorter for telescope
		},
		config = function()
			require("telescope").load_extension("notify") -- Load notify extension for telescope
		end,
	},

	-- ============================================================================
	-- Git Integration
	-- ============================================================================
	-- Plugins for Git operations and visualization
	"tpope/vim-fugitive", -- Comprehensive Git wrapper for Vim
	"lewis6991/gitsigns.nvim", -- Git decorations (signs) for added/removed/changed lines
	{ "akinsho/git-conflict.nvim", version = "*", config = true }, -- Visualize and resolve git conflicts
	"sindrets/diffview.nvim", -- Single tabpage interface for reviewing diffs
	{
		"f-person/git-blame.nvim", -- Show git blame info inline
		event = "VeryLazy", -- Load lazily for better startup time
		opts = {
			enabled = true,
			message_template = " <author> • <summary> • <date> • <<sha>>", -- Blame message format
			date_format = "%m-%d-%Y %H:%M:%S",
			virtual_text_column = 1, -- Column for virtual text
		},
	},

	-- ============================================================================
	-- LSP and Completion
	-- ============================================================================
	-- Language Server Protocol support and autocompletion
	"neovim/nvim-lspconfig", -- Quickstart configs for Nvim LSP
	"williamboman/mason.nvim", -- Package manager for LSP servers, linters, formatters
	"williamboman/mason-lspconfig.nvim", -- Bridge between mason and lspconfig
	"hrsh7th/nvim-cmp", -- Autocompletion plugin
	"hrsh7th/cmp-buffer", -- Buffer words completion source
	"hrsh7th/cmp-path", -- Path completion source
	"hrsh7th/cmp-nvim-lsp", -- LSP completion source
	"hrsh7th/vim-vsnip", -- Snippet engine
	{
		"glepnir/lspsaga.nvim", -- Lightweight LSP UI
		branch = "main",
		config = function()
			require("lspsaga").setup({})
		end,
	},
	-- NOTE: TypeScript tools plugin is commented out
	-- {
	-- 	"pmizio/typescript-tools.nvim",
	-- 	dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	-- 	opts = {},
	-- },
	"onsails/lspkind.nvim", -- VSCode-like pictograms for completion items
	"ray-x/lsp_signature.nvim", -- Show function signature when typing

	-- ============================================================================
	-- Snippets
	-- ============================================================================
	-- Snippet engine and snippet collections
	"L3MON4D3/LuaSnip", -- Snippet engine written in Lua
	"saadparwaiz1/cmp_luasnip", -- LuaSnip completion source for nvim-cmp
	"rafamadriz/friendly-snippets", -- Collection of snippets for various languages

	-- ============================================================================
	-- Code Analysis and Formatting
	-- ============================================================================
	-- Linting and formatting plugins
	"jayp0521/mason-null-ls.nvim", -- Bridge between mason and null-ls
	{
		"nvimtools/none-ls.nvim", -- Null-ls fork for diagnostics, formatting, code actions
		dependencies = {
			"nvimtools/none-ls-extras.nvim", -- Extra sources for none-ls
			"gbprod/none-ls-luacheck.nvim", -- Luacheck source for none-ls
		},
	},
	"sbdchd/neoformat", -- Format code with external formatters
	"MunifTanjim/prettier.nvim", -- Prettier integration for Neovim

	-- ============================================================================
	-- Treesitter
	-- ============================================================================
	-- Syntax parsing and highlighting
	"nvim-treesitter/nvim-treesitter", -- Treesitter configurations and abstraction layer
	"windwp/nvim-autopairs", -- Autopairs for brackets, quotes, etc.
	{ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }, -- Auto close and rename HTML tags

	-- ============================================================================
	-- Comments and Documentation
	-- ============================================================================
	-- Tools for commenting and managing TODO comments
	{
		"terrortylor/nvim-comment", -- Smart commenting plugin
		config = function()
			require("nvim_comment").setup()
		end,
	},
	{
		"folke/todo-comments.nvim", -- Highlight and search for TODO comments
		config = function()
			require("todo-comments").setup()
		end,
	},

	-- ============================================================================
	-- Debugging
	-- ============================================================================
	-- Debug Adapter Protocol (DAP) plugins
	"ravenxrz/DAPInstall.nvim", -- DAP installer
	"mfussenegger/nvim-dap", -- Debug Adapter Protocol client
	"theHamsta/nvim-dap-virtual-text", -- Show variable values as virtual text
	"nvim-telescope/telescope-dap.nvim", -- Telescope integration for DAP
	{
		"David-Kunz/jester", -- Run and debug Jest tests
		opts = {},
		config = function()
			require("jester").setup({
				cmd = "./node_modules/.bin/jest -t '$result' -- $file", -- Command to run tests
				identifiers = { "test", "it" }, -- Test identifiers
				prepend = { "describe" }, -- Prepend describe blocks
				expressions = { "call_expression" }, -- Treesitter expression for tests
				path_to_jest_run = "./node_modules/.bin/jest", -- Jest binary path
				path_to_jest_debug = "./node_modules/.bin/jest", -- Jest debug path
				terminal_cmd = ":vsplit | terminal", -- Terminal command for running tests
				dap = { -- DAP configuration for Jest debugging
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
	"preservim/vimux", -- Interact with tmux from Vim

	-- ============================================================================
	-- AI Assistance
	-- ============================================================================
	-- AI-powered code completion and chat assistants
	{
		"zbirenbaum/copilot.lua", -- GitHub Copilot integration
		cmd = "Copilot",
		event = "InsertEnter", -- Load on insert mode
		config = function()
			require("copilot").setup({
				model = "claude-sonnet-4.5", -- AI model to use
				panel = { enabled = true }, -- Enable copilot panel
				suggestion = { enabled = false }, -- Disable inline suggestions
				nes = {
					enabled = false,
					keymap = {
						accept_and_goto = "<leader>p",
						accept = false,
						dismiss = "<Esc>",
					},
				},
			})
		end,
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim", -- Chat interface for GitHub Copilot
		dependencies = {
			{ "github/copilot.vim" }, -- Original Copilot plugin
			{ "nvim-lua/plenary.nvim", branch = "master" },
		},
		build = "make tiktoken", -- Build tiktoken tokenizer
		opts = {
			model = "claude-sonnet-4.5", -- AI model for chat
		},
	},
	{
		"zbirenbaum/copilot-cmp", -- Copilot source for nvim-cmp
		after = { "copilot.lua" },
		config = function()
			require("copilot_cmp").setup()
		end,
	},
	{
		"yetone/avante.nvim", -- AI-powered code assistant
		event = "VeryLazy",
		version = false, -- Use main branch (important: never use "*")
		opts = {
			provider = "copilot", -- Use Copilot as provider
			-- Additional behavior options are commented out
		},
		build = "make", -- Build from source
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"stevearc/dressing.nvim", -- Improved UI for inputs
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			-- Optional dependencies
			"echasnovski/mini.pick", -- File selector provider
			"nvim-telescope/telescope.nvim", -- File selector provider
			"hrsh7th/nvim-cmp", -- Autocompletion for commands
			"ibhagwan/fzf-lua", -- FZF integration
			"nvim-tree/nvim-web-devicons",
			"zbirenbaum/copilot.lua", -- Copilot provider
			{
				"HakonHarnes/img-clip.nvim", -- Image pasting support
				event = "VeryLazy",
				opts = {
					default = {
						embed_image_as_base64 = false,
						prompt_for_file_name = false,
						drag_and_drop = {
							insert_mode = true,
						},
						use_absolute_path = true, -- Required for Windows
					},
				},
			},
			{
				"MeanderingProgrammer/render-markdown.nvim", -- Markdown rendering
				opts = {
					file_types = { "markdown", "Avante" },
				},
				ft = { "markdown", "Avante" },
			},
		},
	},

	-- ============================================================================
	-- Utility and Misc
	-- ============================================================================
	-- Various utility plugins for enhanced functionality
	{
		"rcarriga/nvim-notify", -- Fancy notification manager
		config = function()
			require("notify").setup({
				background_colour = "#000000",
			})
			vim.notify = require("notify") -- Override default notify
		end,
	},
	{
		"tomasky/bookmarks.nvim", -- Bookmark management
		event = "VimEnter",
		config = function()
			require("bookmarks").setup({
				save_file = vim.fn.expand("$HOME/.bookmarks"), -- Bookmarks save location
				keywords = {
					["@t"] = "☑️ ", -- Task bookmark
					["@w"] = "⚠️ ", -- Warning bookmark
					["@f"] = "⛏ ", -- Fix bookmark
					["@n"] = " ", -- Note bookmark
				},
			})
			require("telescope").load_extension("bookmarks") -- Telescope integration
		end,
	},
	{
		"folke/trouble.nvim", -- Pretty list for diagnostics, references, etc.
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
	},
	{
		"folke/which-key.nvim", -- Display keybindings in a popup
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
		"folke/snacks.nvim", -- Collection of small QoL plugins
		priority = 1000,
		lazy = false,
		---@type snacks.Config
		opts = {
			bigfile = { enabled = true }, -- Handle large files better
			dashboard = { enabled = false }, -- Disable dashboard
			explorer = { enabled = true, replace_netrw = true }, -- File explorer
			indent = { enabled = true }, -- Indent guides
			input = { enabled = true }, -- Better input UI
			picker = { enabled = true }, -- File picker
			notifier = { enabled = true }, -- Notification system
			quickfile = { enabled = false },
			scope = { enabled = true }, -- Scope detection
			scroll = { enabled = true }, -- Smooth scrolling
			words = { enabled = true }, -- Word reference highlighting
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
		"rest-nvim/rest.nvim", -- HTTP REST client
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			opts = function(_, opts)
				opts.ensure_installed = opts.ensure_installed or {}
				table.insert(opts.ensure_installed, "http") -- Ensure HTTP parser is installed
			end,
		},
		config = function()
			require("rest-nvim").setup({
				response = {
					hooks = {
						decode_url = true, -- Decode URL segments
						format = true, -- Format response body
					},
				},
			})
		end,
	},
	{
		"kylechui/nvim-surround", -- Add/change/delete surrounding characters
		version = "^3.0.0",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({})
		end,
	},

	-- ============================================================================
	-- Testing
	-- ============================================================================
	-- Test runner and debugging integration
	{
		"nvim-neotest/neotest", -- Testing framework for Neovim
		commit = "52fca6717ef972113ddd6ca223e30ad0abb2800c", -- Pinned version
		settings = {
			watch = true, -- Watch mode for tests
		},
		dependencies = {
			"nvim-neotest/nvim-nio", -- Async IO library
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim", -- Fix CursorHold performance
			"nvim-treesitter/nvim-treesitter",
			"marilari88/neotest-vitest", -- Vitest adapter
			"nvim-neotest/neotest-jest", -- Jest adapter
		},
		keys = {
			{ "<leader>tr", "<cmd>Neotest run<cr>" }, -- Run nearest test
			{ "<leader>ti", "<cmd>Neotest output<cr>" }, -- Show test output
			{ "<leader>ts", "<cmd>Neotest summary<cr>" }, -- Show test summary
			{ "<leader>ta", "<cmd>lua require('neotest').run.run({ suite = true })<cr>" }, -- Run all tests
			{ "<leader>tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>" }, -- Run file tests
			{ "<leader>td", "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>" }, -- Debug test
		},
		config = function()
			require("neotest").setup({
				settings = {
					watch = true,
				},
				adapters = {
					require("neotest-vitest"), -- Vitest adapter
					require("neotest-jest")({ -- Jest adapter configuration
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
					["dap"] = {}, -- DAP strategy for debugging
				},
			})
		end,
	},
	{
		"rcarriga/nvim-dap-ui", -- UI for nvim-dap
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		config = function()
			require("dapui").setup()
		end,
	},
	{
		"olimorris/codecompanion.nvim", -- AI coding companion
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {
			opts = {
				model = "claude-sonnet-4.5", -- AI model to use
				log_level = "DEBUG", -- Logging level
			},
		},
	},

	{
		"folke/sidekick.nvim", -- Sidebar with code outline
		opts = {},
	},
	{
		"MeanderingProgrammer/render-markdown.nvim", -- Enhanced markdown rendering
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" },
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {},
	},
}

-- ============================================================================
-- Lazy.nvim Setup
-- ============================================================================
-- Initialize lazy.nvim with the plugins table
local opts = {}
require("lazy").setup(plugins, opts)
