local cfg = {
  bind = true, -- This is mandatory, otherwise border config won't get registered.
  floating_window = true, -- show hint in a floating window, set to false for virtual text only mode
  hint_enable = true, -- virtual hint enable
  hint_prefix = "🐼 ",  -- Panda for parameter
  hint_scheme = "String",
  use_lspsaga = false,  -- set to true if you want to use lspsaga popup
  hi_parameter = "Search", -- how your parameter will be highlight
  max_height = 12, -- max height of signature floating_window, if content is more than max_height, you can scroll down
  max_width = 120, -- max_width of signature floating_window, line will be wrapped if exceed max_width
  handler_opts = {
    border = "double"   -- double, single, shadow, none
  },
  extra_trigger_chars = {} -- Array of extra characters that will trigger signature completion, e.g., {"(", ","}
}

require'lsp_signature'.on_attach(cfg)
