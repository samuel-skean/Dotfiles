require("samuelskean.remap")
require("samuelskean.fourSpaceTabs")

-- Enable hybrid line numbers (absolute number on the current line,
-- relative number elsewhere):
vim.wo.number = true
vim.wo.relativenumber = true

-- Enable showing dots on trailing whitespace:
vim.wo.listchars = "trail:·"
vim.wo.list = true
