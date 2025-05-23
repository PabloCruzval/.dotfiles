local map = vim.keymap.set

--- Telescope

map({ "n", "v" }, "<leader>tf", "<cmd> Telescope find_files <CR>", { desc = "Open Telescope Files" })
map({ "n", "v" }, "<leader>tc", "<cmd> Telescope commands <CR>", { desc = "Open Telescope Commands" })
map({ "n", "v" }, "<leader>tr", "<cmd> Telescope oldfiles <CR>", { desc = "Open Telescope Oldfiles" })
map({ "n", "v" }, "<leader>bb", "<cmd> Telescope buffers <CR>", { desc = "Open Buffers" })

--- LSP
map("n", "<leader>lh", vim.lsp.buf.hover, { desc = "LSP: Hover" })
map("n", "<leader>ld", vim.diagnostic.open_float, { desc = "LSP: Diagnostic" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP: Code Action" })
map("n", "<leader>lr", vim.lsp.buf.rename, { desc = "LSP: Rename" })

--- Debugger
vim.keymap.set("n", "<leader>do", '<cmd>lua require("dapui").open()<CR>', {})
vim.keymap.set("n", "<leader>dx", '<cmd>lua require("dapui").close()<CR>')
vim.keymap.set(
	"n",
	"<leader>dt",
	'<cmd>lua require("dap").toggle_breakpoint()<CR>',
	{ desc = "Dap: Toogle Breakpoint" }
)
vim.keymap.set("n", "<leader>dc", '<cmd>lua require("dap").continue()<CR>', { desc = "Dap: Continue" })

--- Formatting
map("n", "<leader>lf", function()
	vim.cmd("lua vim.lsp.buf.format()")
	vim.cmd("w")
end, { desc = "LSP: Format" })

--- Comment
map("n", "<leader>/", '<cmd>lua require("Comment.api").toggle.linewise.current() <CR>', { desc = "Toggle Comment" })
map(
	"v",
	"<leader>/",
	'<ESC><cmd>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>',
	{ desc = "Toggle Comment" }
)
