function ResetConsoleLogMacro()
  local esc = vim.api.nvim_replace_termcodes("<Esc>", true, true, true)
  vim.fn.setreg("l", 'yoconsole.log("' .. esc .. "pa:" .. esc .. "la, " .. esc .. "pl")
end

ResetConsoleLogMacro()
vim.api.nvim_create_user_command("ResetLogMacro", ResetConsoleLogMacro, {})

function LineNumberColor()
  vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#51B3EC", bold = true })
  vim.api.nvim_set_hl(0, "LineNr", { fg = "white", bold = true })
  vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#FB508F", bold = true })
end

LineNumberColor()
vim.api.nvim_create_user_command("LineNumberColor", LineNumberColor, {})
