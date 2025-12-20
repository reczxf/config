-- ~/.config/nvim/lua/plugins/hop.lua
 
return {
  'smoka7/hop.nvim',
  branch = 'master', -- 推荐使用 v2 稳定版

  -- 当你启用这个插件时，它会自动运行 config 函数
  config = function()
    local hop = require('hop')
    
    -- 运行 setup 函数是必须的
    hop.setup {
      -- 你可以在这里自定义，比如提示键
      -- keys = 'etovxqpdygfblzhckisuran'
      keys = 'fjdksla;'
      -- search_limit = 20
    } 
 
   -- [重要提示] 
    -- 这里的快捷键是为 "纯 Neovim" (在终端里运行) 准备的
    -- 对于 VSCode，我们会在 VSCode 的 keybindings.json 中设置快捷键
    -- (正如我们之前讨论的)

    vim.keymap.set('n', '<leader>w', '<Cmd>HopChar1<CR>', { 
      silent = true, 
      desc = 'Hop HopChar1' 
    })    
    
  end 
}