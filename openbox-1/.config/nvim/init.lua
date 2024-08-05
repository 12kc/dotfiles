-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "dawnfox", "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

-- Mason.nvim
require("mason").setup()

-- Initialize Which-Key
local wk = require("which-key")
wk.add({
	{ "<leader>f", group = "Telescope"},
	{ "<leader>t", group = "BetterTerm"}
})


-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = " Find files" })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = " Live Grep" })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = " Buffers" })
vim.keymap.set('n', '<leader>fc', builtin.colorscheme, { desc = " Colorscheme" })
vim.keymap.set('n', '<leader>fh', builtin.oldfiles, { desc = " Recent Files" })

-- BetterTerm config
local betterTerm = require('betterTerm')
vim.keymap.set({"n"}, "<leader>ts", betterTerm.select, { desc = " Select terminal"})
vim.keymap.set({"n", "t"}, "<C-;>", betterTerm.open, { desc = " Open terminal"})
local current = 2
vim.keymap.set(
    {"n"}, "<leader>tn",
    function()
        betterTerm.open(current)
        current = current + 1
    end,
    { desc = "New terminal"}
)

-- Autoclose
require("autoclose").setup()

-- Lualine
require('lualine').setup()

-- NvimTree 
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- optionally enable 24-bit colour
vim.opt.termguicolors = true
--
vim.keymap.set({"n"}, "<leader>e", "<cmd>Neotree<cr>", { desc = "Open Neo-Tree"} )
-- empty setup using defaults


-- Tab size
vim.opt["tabstop"] = 4
vim.opt["shiftwidth"] = 4

-- Zen Mode
vim.keymap.set({"n"}, "<leader>z", "<cmd>ZenMode<cr>", { desc = "Toggle Zen-Mode"} )

-- Colorscheme
-- For oxocarbon
-- vim.opt.background = "light" -- set this to dark or light
vim.cmd("colorscheme dawnfox")
