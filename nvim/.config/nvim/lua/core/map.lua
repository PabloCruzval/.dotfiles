local fn = vim.fn
local map = vim.keymap.set

--- Move one line ---
map({'n','i'}, "<A-k>", "<cmd>m -2<CR>")
map({'n','i'}, "<A-j>", "<cmd>m +1<CR>")

--- Move many lines ---
map('v', "<A-k>", "<cmd>m <-2<CR>gv=gv")
map('v', "<A-j>", "<cmd>m >+1<CR>gv=gv")
map('n', "<leader>e", ":e . <CR>")

--- Clear search
map({'n','v'}, "<leader>h", ":nohlsearch<CR>")
