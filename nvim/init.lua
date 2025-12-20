-- ~/.config/nvim/init.lua


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
vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct under any eventual lazy loading
vim.opt.rtp:prepend(lazypath)

-- 1. 加载插件配置 (plugins/init.lua)
require("lazy").setup("plugins")
require("core.settings")
-- 2. 加载核心用户配置 (例如：core/settings.lua)
-- 假设您的用户配置都放在 lua/core/settings.lua 中
