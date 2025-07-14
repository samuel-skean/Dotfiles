require("samuel-skean.remap")
require("samuel-skean.fourSpaceTabs")

-- Enable hybrid line numbers (absolute number on the current line,
-- relative number elsewhere):
vim.o.number = true
vim.o.relativenumber = true

-- Enable showing dots on trailing whitespace:
vim.o.listchars = "trail:·"
vim.o.list = true
