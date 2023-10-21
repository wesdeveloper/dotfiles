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
	"mhinz/vim-startify", -- initial screen
	"nvim-lua/plenary.nvim", -- lua functions that many plugins
	"patstockwell/vim-monokai-tasty", -- preferred colorscheme
	"christoomey/vim-tmux-navigator", -- tmux & split window navigation
	"szw/vim-maximizer", -- maximizes and restores current window
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
	"tpope/vim-fugitive",
	"editorconfig/editorconfig-vim",
	"xiyaowong/nvim-transparent",
	"nvim-lua/plenary.nvim",
	"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
	"MunifTanjim/nui.nvim",

	"lukas-reineke/indent-blankline.nvim",

	"nvim-neo-tree/neo-tree.nvim",
	-- vs-code like icons
	{
		"romgrk/barbar.nvim",
		dependencies = {
			"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
			"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
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
				button = "",
				filetype = {
					custom_colors = false,
					enabled = true,
				},
				separator = { left = "▎", right = "" },
				modified = { button = "●" },
				pinned = { button = "", filename = true },
				preset = "default",
				alternate = { filetype = { enabled = false } },
				current = { button = "-" },
				inactive = { button = "x" },
				visible = { modified = { buffer_number = false } },
			},
		},
		version = "^1.0.0", -- optional: only update when a new 1.x version is released
	},
	-- statusline
	"nvim-lualine/lualine.nvim",

	-- fuzzy finding w/ telescope
	{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }, -- dependency for better sorting performance
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		config = function()
			require("telescope").load_extension("notify")
		end,
	}, -- fuzzy finder

	-- autocompletion
	"hrsh7th/nvim-cmp", -- completion plugin
	"hrsh7th/cmp-buffer", -- source for text in buffer
	"hrsh7th/cmp-path", -- source for file system paths
	"hrsh7th/vim-vsnip",

	-- snippets
	"L3MON4D3/LuaSnip", -- snippet engine
	"saadparwaiz1/cmp_luasnip", -- for autocompletion
	"rafamadriz/friendly-snippets", -- useful snippets

	-- managing & installing lsp servers, linters & formatters
	"williamboman/mason.nvim", -- in charge of managing lsp servers, linters & formatters
	"williamboman/mason-lspconfig.nvim", -- bridges gap b/w mason & lspconfig

	-- configuring lsp servers
	"neovim/nvim-lspconfig", -- easily configure language servers
	"hrsh7th/cmp-nvim-lsp", -- for autocompletion
	{
		"glepnir/lspsaga.nvim",
		branch = "main",
		config = function()
			require("lspsaga").setup({})
		end,
	}, -- enhanced lsp uis
	"jose-elias-alvarez/typescript.nvim", -- additional functionality for typescript server (e.g. rename file & update imports)
	"onsails/lspkind.nvim", -- vs-code like icons for autocompletion

	-- formatting & linting
	"jose-elias-alvarez/null-ls.nvim",
	"jayp0521/mason-null-ls.nvim", -- bridges gap b/w mason & null-ls

	-- treesitter configuration
	"nvim-treesitter/nvim-treesitter",

	-- auto closing
	"windwp/nvim-autopairs", -- autoclose parens, brackets, quotes, etc...
	{ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }, -- autoclose tags

	-- git integration
	"lewis6991/gitsigns.nvim", -- show line modifications on left hand side

	"f-person/git-blame.nvim",

	"ray-x/lsp_signature.nvim",

	"sbdchd/neoformat",
	"machakann/vim-highlightedyank",
	"iamcco/markdown-preview.nvim",
	"terryma/vim-multiple-cursors",

	-- debugger
	"ravenxrz/DAPInstall.nvim",
	"mfussenegger/nvim-dap",
	"theHamsta/nvim-dap-virtual-text",
	"nvim-telescope/telescope-dap.nvim",
	"David-Kunz/jester",
	"preservim/vimux",
	"ryanoasis/vim-devicons",
	{ "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons" },
	{
		"rest-nvim/rest.nvim",
		config = function()
			require("rest-nvim").setup({
				-- Open request results in a horizontal split
				result_split_horizontal = false,
				-- Keep the http file buffer above|left when split horizontal|vertical
				result_split_in_place = false,
				-- Skip SSL verification, useful for unknown certificates
				skip_ssl_verification = false,
				-- Encode URL before making request
				encode_url = true,
				-- Highlight request on run
				highlight = {
					enabled = true,
					timeout = 150,
				},
				result = {
					-- toggle showing URL, HTTP info, headers at top the of result window
					show_url = true,
					-- show the generated curl command in case you want to launch
					-- the same request via the terminal (can be verbose)
					show_curl_command = false,
					show_http_info = true,
					show_headers = true,
					-- executables or functions for formatting response body [optional]
					-- set them to false if you want to disable them
					formatters = {
						json = "jq",
						html = function(body)
							return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
						end,
					},
				},
				-- Jump to request line on run
				jump_to_request = false,
				env_file = ".env",
				custom_dynamic_variables = {},
				yank_dry_run = true,
			})
		end,
	},
	"RRethy/vim-illuminate",
	{
		"rcarriga/nvim-notify",
		config = function()
			require("notify").setup({
				background_colour = "#000000",
			})

			vim.notify = require("notify")
		end,
	},
	{ "EdenEast/nightfox.nvim" }, -- lazy
	"marko-cerovac/material.nvim",
	{
		"Shatur/neovim-ayu",
		config = function()
			require("ayu").setup({
				mirage = true,
			})
			require("lualine").setup({
				options = {
					theme = "ayu",
				},
			})

			require("ayu").colorscheme()
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("nvim-tree").setup({})
		end,
	},
	{
		"simrat39/symbols-outline.nvim",
		config = function()
			require("symbols-outline").setup()
		end,
	},
	{
		"tomasky/bookmarks.nvim",
		event = "VimEnter",
		config = function()
			require("bookmarks").setup({
				-- sign_priority = 8,  --set bookmark sign priority to cover other sign
				save_file = vim.fn.expand("$HOME/.bookmarks"), -- bookmarks save file path
				keywords = {
					["@t"] = "☑️ ", -- mark annotation startswith @t ,signs this icon as `Todo`
					["@w"] = "⚠️ ", -- mark annotation startswith @w ,signs this icon as `Warn`
					["@f"] = "⛏ ", -- mark annotation startswith @f ,signs this icon as `Fix`
					["@n"] = " ", -- mark annotation startswith @n ,signs this icon as `Note`
				},
				on_attach = function(bufnr)
					local bm = require("bookmarks")
					local map = vim.keymap.set
					map("n", "mm", bm.bookmark_toggle) -- add or remove bookmark at current line
					map("n", "mi", bm.bookmark_ann) -- add or edit mark annotation at current line
					map("n", "mc", bm.bookmark_clean) -- clean all marks in local buffer
					map("n", "mn", bm.bookmark_next) -- jump to next mark in local buffer
					map("n", "mp", bm.bookmark_prev) -- jump to previous mark in local buffer
					map("n", "ml", ":Telescope bookmarks list<CR>") -- show marked file list in quickfix window
				end,
			})
			require("telescope").load_extension("bookmarks")
		end,
	},
	{
		"utilyre/barbecue.nvim",
		name = "barbecue",
		version = "*",
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons", -- optional dependency
		},
		opts = {
			-- configurations go here
		},
	},
	"tpope/vim-surround",
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
}

local opts = {}
require("lazy").setup(plugins, opts)
