local plugin_dir = vim.fn.stdpath("data") .. "/lazy"
local lazypath = plugin_dir .. "/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
    vim.fn.system {
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",                     -- latest stable release
        lazypath,

    }
end
vim.opt.rtp:prepend(lazypath)

local plugin_specs = {
    { "nvim-tree/nvim-web-devicons", event = "VeryLazy" },
}

require("lazy").setup {
    spec = plugin_specs,
    ui = {
        border = "rounded",
        title = "Plugin Manager",
        title_pos = "center",

    },
    rocks = {
        enabled = false,

    },

}
