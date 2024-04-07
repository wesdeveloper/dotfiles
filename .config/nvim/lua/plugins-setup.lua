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
	-- UI Enhancements
	"mhinz/vim-startify", -- initial screen
	"lukas-reineke/indent-blankline.nvim", -- indentation guides
	"xiyaowong/nvim-transparent", -- transparency
	"nvim-tree/nvim-web-devicons", -- icons

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
				current = { button = "" },
				inactive = { button = "x" },
				visible = { modified = { buffer_number = false } },
			},
		},
		version = "^1.0.0", -- optional: only update when a new 1.x version is released
	},
	{ "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons" }, -- bufferline
	-- {
	-- 	"Shatur/neovim-ayu",
	-- 	config = function()
	-- 		require("ayu").setup({
	-- 			mirage = true, -- Set to `true` to use `mirage` variant instead of `dark` for dark background.
	-- 			terminal = true, -- Set to `false` to let terminal manage its own colors.
	-- 			overrides = {}, -- A dictionary of group names, each associated with a dictionary of parameters (`bg`, `fg`, `sp` and `style`) and colors in hex.
	-- 		})
	-- 	end,
	-- },

	-- Navigation
	"christoomey/vim-tmux-navigator", -- tmux & split navigation
	"szw/vim-maximizer", -- maximize windows
	"nvim-tree/nvim-tree.lua", -- file explorer

	-- Git Integration
	"tpope/vim-fugitive", -- git commands
	"lewis6991/gitsigns.nvim", -- git signs
	{ "akinsho/git-conflict.nvim", version = "*", config = true }, -- resolve conflicts
	"sindrets/diffview.nvim", -- diff view
	{
		"f-person/git-blame.nvim",
		-- load the plugin at startup
		event = "VeryLazy",
		-- Because of the keys part, you will be lazy loading this plugin.
		-- The plugin wil only load once one of the keys is used.
		-- If you want to load the plugin at startup, add something like event = "VeryLazy",
		-- or lazy = false. One of both options will work.
		opts = {
			-- your configuration comes here
			-- for example
			enabled = true, -- if you want to enable the plugin
			message_template = " <author> • <summary> • <date> • <<sha>>", -- template for the blame message, check the Message template section for more options
			date_format = "%m-%d-%Y %H:%M:%S", -- template for the date, check Date format section for more options
			virtual_text_column = 1, -- virtual text start column, check Start virtual text at column section for more options
		},
	}, -- git blame

	"nvim-lua/plenary.nvim", -- lua functions that many plugins
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
	"editorconfig/editorconfig-vim",
	"MunifTanjim/nui.nvim",

	"nvim-neo-tree/neo-tree.nvim",

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
	-- "jose-elias-alvarez/typescript.nvim", -- additional functionality for typescript server (e.g. rename file & update imports)
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		opts = {},
	},
	"onsails/lspkind.nvim", -- vs-code like icons for autocompletion

	-- formatting & linting
	"jayp0521/mason-null-ls.nvim", -- bridges gap b/w mason & null-ls

	-- treesitter configuration
	"nvim-treesitter/nvim-treesitter",

	-- auto closing
	"windwp/nvim-autopairs", -- autoclose parens, brackets, quotes, etc...
	{ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }, -- autoclose tags

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
		commit = "8b62563",
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
					show_http_info = false,
					show_headers = false,
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
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
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
			{ "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
			{ "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
		},
		build = "make tiktoken", -- Only on MacOS or Linux
		opts = {
			-- See Configuration section for options
		},
		-- See Commands section for default commands if you want to lazy load on them
	},
	{
		"zbirenbaum/copilot-cmp",
		after = { "copilot.lua" },
		config = function()
			require("copilot_cmp").setup()
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = {
					icons_enabled = true,
					theme = "auto",
					component_separators = { left = "", right = "" },
					section_separators = { left = "", right = "" },
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch", "diff", "diagnostics" },
					lualine_c = { "filename" },
					lualine_x = { "encoding", "fileformat", "filetype" },
					lualine_y = { "progress" },
					lualine_z = { "location" },
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = { "filename" },
					lualine_x = { "location" },
					lualine_y = {},
					lualine_z = {},
				},
				tabline = {},
				extensions = {},
			})
		end,
	},
	{
		"marko-cerovac/material.nvim",
		config = function()
			require("material").setup({
				plugins = { -- Uncomment the plugins that you use to highlight them
					-- Available plugins:
					"dap",
					-- "dashboard",
					-- "eyeliner",
					-- "fidget",
					-- "flash",
					"gitsigns",
					-- "harpoon",
					-- "hop",
					-- "illuminate",
					"indent-blankline",
					"lspsaga",
					-- "mini",
					-- "neogit",
					-- "neotest",
					-- "neo-tree",
					-- "neorg",
					-- "noice",
					-- "nvim-cmp",
					-- "nvim-navic",
					-- "nvim-tree",
					"nvim-web-devicons",
					-- "rainbow-delimiters",
					-- "sneak",
					"telescope",
					-- "trouble",
					"which-key",
					"nvim-notify",
				},
				high_visibility = {
					lighter = true, -- Enable higher contrast text for lighter style
					darker = true, -- Enable higher contrast text for darker style
				},
				disable = {
					background = true,
				},
				lualine_style = "default", -- Lualine style ( can be 'stealth' or 'default' )
				async_loading = true, -- Load parts of the theme asynchronously for faster startup (turned on by default)
				custom_colors = nil, -- If you want to override the default colors, set this to a function
				custom_highlights = {}, -- Overwrite highlights with your own
			})
		end,
	},
	{
		"nvimtools/none-ls.nvim",
		dependencies = {
			"nvimtools/none-ls-extras.nvim",
			"gbprod/none-ls-luacheck.nvim",
		},
	},
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000, config = function()
    require("catppuccin").setup({
      flavour = "macchiato", -- latte, frappe, macchiato, mocha
      transparent_background = true,
      term_colors = true,
      styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = { "italic" },
        functions = { "italic" },
        keywords = { "italic" },
        strings = { "italic" },
        variables = { "italic" },
        numbers = { "bold" },
        booleans = { "bold" },
        properties = { "bold" },
        parameters = { "italic" },
      },
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
}

local opts = {}
require("lazy").setup(plugins, opts)
