---@class Everforest.Colours
local M = {}

---@type Everforest.PaletteBackgrounds
local hard_background = {
  dark = {
    bg_dim = "#1e2326",
    bg0 = "#272e33",
    bg1 = "#2e383c",
    bg2 = "#374145",
    bg3 = "#414b50",
    bg4 = "#495156",
    bg5 = "#4f5b58",
    bg_visual = "#4c3743",
    bg_red = "#493b40",
    bg_green = "#3c4841",
    bg_blue = "#384b55",
    bg_yellow = "#45443c",
    bg_purple = "#463f48",
  },
  light = {
    bg_dim = "#f2efdf",
    bg0 = "#fffbef",
    bg1 = "#f8f5e4",
    bg2 = "#f2efdf",
    bg3 = "#edeada",
    bg4 = "#e8e5d5",
    bg5 = "#bec5b2",
    bg_visual = "#f0f2d4",
    bg_red = "#ffe7de",
    bg_green = "#f3f5d9",
    bg_blue = "#ecf5ed",
    bg_yellow = "#fef2d5",
    bg_purple = "#fceced",
  },
}

---@type Everforest.PaletteBackgrounds
local medium_background = {
  dark = {
    bg_dim = "#232a2e",
    bg0 = "#2d353b",
    bg1 = "#343f44",
    bg2 = "#3d484d",
    bg3 = "#475258",
    bg4 = "#4f585e",
    bg5 = "#56635f",
    bg_visual = "#543a48",
    bg_red = "#514045",
    bg_green = "#425047",
    bg_blue = "#3a515d",
    bg_yellow = "#4d4c43",
    bg_purple = "#4a444e",
  },
  light = {
    bg_dim = "#efebd4",
    bg0 = "#fdf6e3",
    bg1 = "#f4f0d9",
    bg2 = "#efebd4",
    bg3 = "#e6e2cc",
    bg4 = "#e0dcc7",
    bg5 = "#bdc3af",
    bg_visual = "#eaedc8",
    bg_red = "#fde3da",
    bg_green = "#f0f1d2",
    bg_blue = "#e9f0e9",
    bg_yellow = "#faedcd",
    bg_purple = "#fae8e2",
  },
}

---@type Everforest.PaletteBackgrounds
local soft_background = {
  dark = {
    bg_dim = "#2b3135",
    bg0 = "#353c42",
    bg1 = "#3c464b",
    bg2 = "#454f54",
    bg3 = "#4f595f",
    bg4 = "#575f65",
    bg5 = "#606b66",
    bg_visual = "#58404e",
    bg_red = "#56474c",
    bg_yellow = "#55544b",
    bg_green = "#4b584f",
    bg_blue = "#445764",
    bg_purple = "#4d4952",
  },
  light = {
    bg_dim = "#e4dfc8",
    bg0 = "#f2ead6",
    bg1 = "#e9e4cd",
    bg2 = "#e4dfc8",
    bg3 = "#dcd8c1",
    bg4 = "#d7d3bd",
    bg5 = "#bac0ad",
    bg_visual = "#e2e4c1",
    bg_red = "#f5dcd2",
    bg_yellow = "#efe4c8",
    bg_green = "#e5e6c8",
    bg_blue = "#e2e7de",
    bg_purple = "#eeded5",
  },
}

---@type table<Everforest.Backgrounds, Everforest.PaletteBase>
local base_palette = {
  light = {
    fg = "#5f6a71",
    red = "#e56058",
    orange = "#e5833e",
    yellow = "#d6a337",
    green = "#91a031",
    aqua = "#58a57f",
    blue = "#5392c1",
    purple = "#d070b6",
    grey0 = "#a8b0a1",
    grey1 = "#959f92",
    grey2 = "#859182",
    statusline1 = "#99b164",
    statusline2 = "#738088",
    statusline3 = "#d66f6c",
    none = "NONE",
  },
  dark = {
             fg = "#d1c6ad",
            red = "#d88383",
         orange = "#db9b7b",
         yellow = "#d6bd87",
          green = "#acbf87",
           aqua = "#90be96",
           blue = "#8cb9b3",
         purple = "#cd9cb5",
          grey0 = "#7c8479",
          grey1 = "#87928a",
          grey2 = "#9fa9a1",
    statusline1 = "#acbf87",
    statusline2 = "#d1c6ad",
    statusline3 = "#d88383",
    none = "NONE",
  },
}

---Generates the colour palette based on the user's config
M.generate_palette = function(options, theme)
  local background = options.background or "medium"
  local base = base_palette[theme]
  ---@type Everforest.PaletteBackground
  local background_palette

  if background == "soft" then
    background_palette = soft_background[theme]
  elseif background == "hard" then
    background_palette = hard_background[theme]
  else
    background_palette = medium_background[theme]
  end

  ---@type Everforest.Palette
  local combined_palette = vim.tbl_extend("force", base, background_palette)
  options.colours_override(combined_palette)

  return combined_palette
end

return M
