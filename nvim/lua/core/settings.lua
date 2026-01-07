-- ~/.config/nvim/lua/core/settings.lua

-- 检查 g:vscode 变量是否存在，用于区分 VSCode 扩展和原生 Neovim
local is_vscode = vim.g.vscode ~= nil


  vim.notify("Running inside VSCode Neovim extension.", vim.log.levels.INFO)
  vim.api.nvim_set_keymap('n', 'zR', ":call VSCodeNotify('editor.unfoldAll')<CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', 'zM', ":call VSCodeNotify('editor.foldAll')<CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', 'zo', ":call VSCodeNotify('editor.unfold')<CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', 'zc', ":call VSCodeNotify('editor.fold')<CR>", { noremap = true, silent = true })  
  vim.api.nvim_set_keymap('n', 'gtd', ":call VSCodeNotify('editor.action.goToTypeDefinition')<CR>", { noremap = true, silent = true })   
  vim.api.nvim_set_keymap('n', 'gO', ":call VSCodeNotify('workbench.action.quickOpen')<CR>", { noremap = true, silent = true })    
  vim.api.nvim_set_keymap('n', 'go', ":call VSCodeNotify('workbench.action.gotoSymbol')<CR>", { noremap = true, silent = true }) 
  vim.api.nvim_set_keymap('n', 'H', ":call VSCodeNotify('workbench.action.nextEditor')<CR>", { noremap = true, silent = true }) 
   vim.api.nvim_set_keymap('n', 'L', ":call VSCodeNotify('workbench.action.previousEditor')<CR>", { noremap = true, silent = true }) 
   -- 选项设置workbench.action.gotoSymbolworkbench.action.gotoSymbol
vim.opt.ignorecase = true    
vim.opt.smartcase = true     
vim.opt.scrolloff = 5 -- 将值设置为您想要的数字
-- 设置 leader 键
-- jaklsdaj

-- 定义映射选项
local opts = { noremap = true, silent = true } 

-- 键位映射
-- vim.keymap.set('n', 'J', '<Nop>', opts)

if vim.g.vscode then
    -- vim.keymap.set('n', 'L', vsc('workbench.action.nextEditor'))
    -- vim.keymap.set('n', 'H', vsc('workbench.action.previousEditor'))  
    -- 定义快捷键 'vv' 快速触发 VSCode 的智能扩展选中
    vim.keymap.set('n', 'vv', [[<Cmd>call VSCodeNotify('editor.action.smartSelect.expand')<CR>]], { silent = true })
    vim.keymap.set('v', 'vv', [[<Cmd>call VSCodeNotify('editor.action.smartSelect.expand')<CR>]], { silent = true })
    
    -- 定义快捷键 'vV' (Shift+v) 快速触发缩小选中范围
    vim.keymap.set('v', 'vV', [[<Cmd>call VSCodeNotify('editor.action.smartSelect.shrink')<CR>]], { silent = true })
end

-- 输入法自动切换功能
local function switch_to_english()
    vim.fn.system('fcitx5-remote -c')  -- 切换到英文
  end
  
local function restore_input_method()
    -- 可选：保存之前的输入法状态并恢复
end
  
  -- 自动切换配置
vim.api.nvim_create_autocmd({ "InsertLeave", "CmdlineLeave" }, {
callback = switch_to_english,
desc = "切换到英文输入法"
})
vim.opt.foldmethod = 'indent'  