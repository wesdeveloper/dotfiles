local g = vim.g

vim.o.termguicolors = true

g.nvim_tree_side = "left"
g.nvim_tree_allow_resize = 1
-- Mappings for nvimtree

vim.api.nvim_set_keymap(
    "n",
    "<C-\\>",
    ":NvimTreeToggle<CR>",
    {
        noremap = true,
        silent = true
    }
)
require('nvim-tree').setup {
  auto_reload_on_write = true,
  disable_netrw = false,
  -- hide_root_folder = false,
  hijack_cursor = false,
  hijack_netrw = true,
  hijack_unnamed_buffer_when_opening = false,
  ignore_buffer_on_setup = false,
  open_on_setup = false,
  open_on_setup_file = false,
  open_on_tab = false,
  sort_by = "name",
  update_cwd = false,
  update_focused_file = {
    enable = true,
    ignore_list = {".git", "node_modules", ".cache"}
  },
  view = {
    width = 37,
    auto_resize = true
  },
  filters = {
    dotfiles = false,
    custom = {}
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 400,
  },
  renderer = {
    root_folder_modifier = ":t",
    highlight_git = true,
    indent_markers = {
      enable = true,
      icons = {
        corner = "└ ",
        edge = "│ ",
        none = "  ",
      },
    },
    icons = {
      webdev_colors = true,
      show = {
        git = true,
        folder = true,
        file = true,
        folder_arrow = true
      },
      glyphs = {
        default = " ",
        symlink = " ",
        git = {
            unstaged = "✗",
            staged = "✓",
            unmerged = "",
            renamed = "➜",
            untracked = "★",
            deleted = "",
            ignored = "◌"
        },
        folder = {
            default = "",
            open = "",
            symlink = "",
            empty = "",
            empty_open = "",
            symlink_open = ""
        }
      }
    },
  },
  trash = {
    cmd = "trash",
    require_confirm = true,
  },
  log = {
    enable = false,
    truncate = false,
    types = {
      all = false,
      config = false,
      copy_paste = false,
      git = false,
      profile = false,
    },
  },
}

