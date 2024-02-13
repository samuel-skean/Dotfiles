require("samuelskean.remap")
require("samuelskean.fourSpaceTabs")
require("samuelskean.autocmd-test")

-- Enable hybrid line numbers (absolute number on the current line,
-- relative number elsewhere):
vim.o.number = true
vim.o.relativenumber = true

-- Enable showing dots on trailing whitespace:
vim.o.listchars = "trail:·"
vim.o.list = true

