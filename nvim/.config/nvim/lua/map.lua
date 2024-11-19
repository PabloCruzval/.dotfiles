local fn = vim.fn
local map = vim.keymap.set

------ Move Lines ------
map({ 'n', 'i' }, '<A-k>', '<cmd>m -2<CR>')
map({ 'n', 'i' }, '<A-j>', '<cmd>m +2<CR>')

map('v', '<A-k>', ":m '<-2<CR>gv=gv")
map('v', '<A-j>', ":m '>+1<CR>gv=gv")

------ Files ------

--- New File
map({ 'n', 'v' }, '<leader>nf', function()
    local filename = fn.input('New file: ')
    if filename ~= '' then
        vim.cmd('edit ' .. filename)
    end
end, { desc = 'Create new file' })

--- New Folder
map({ 'n', 'v' }, '<leader>nF', function()
    local dirname = fn.input('New directory: ')
    if dirname ~= '' then
        fn.mkdir(dirname, 'p')
        print('Directory created: ' .. dirname)
    else
        print('No directory name providerd')
    end
end, { desc = 'Create a new directory' })

------ Others ------
map({ 'n', 'v' }, '<leader>h', ':nohlsearch<CR>', { desc = 'Remove Search' })
map({ 'n', 'v' }, '<leader>y', '"+y', { desc = "Copy" })

------ Plugins ------
--- Git
map('n', '<leader>gp', ':Gitsigns preview_hunk<CR>', {desc = 'GitSigns Preview Hunk' })
map('n', '<leader>gr', ':Gitsigns reset_hunk<CR>', { desc = 'GitSigns Reset Hunk' })

--- Neo Tree
map('n', '<leader>e', ':Neotree filesystem reveal right <CR>')

--- Telescope
map({'n', 'v'}, '<leader>tf', '<cmd> Telescope find_files <CR>', { desc = 'Open Telescope Files' })
map({'n', 'v'}, '<leader>tc', '<cmd> Telescope commands <CR>',   { desc = 'Open Telescope Commands' })
map({'n', 'v'}, '<leader>tr', '<cmd> Telescope oldfiles <CR>',   { desc = 'Open Telescope Oldfiles' })
map({'n', 'v'}, '<leader>bb', '<cmd> Telescope buffers <CR>',   { desc = 'Open Buffers' })

--- Comment
map('n', '<leader>/', '<cmd>lua require("Comment.api").toggle.linewise.current() <CR>', { desc = "Toggle Comment" })
map('v', '<leader>/', '<ESC><cmd>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>', { desc = "Toggle Comment" })

--- Obsidian
vim.keymap.set(
  "n",
  "<leader>oc",
  "<cmd>lua require('obsidian').util.toggle_checkbox()<CR>",
  { desc = "Obsidian Check Checkbox" }
)
map("n", "<leader>ot", "<cmd>ObsidianTemplate<CR>", { desc = "Insert Obsidian Template" })
map("n", "<leader>oo", "<cmd>ObsidianOpen<CR>", { desc = "Open in Obsidian App" })
map("n", "<leader>ob", "<cmd>ObsidianBacklinks<CR>", { desc = "Show ObsidianBacklinks" })
map("n", "<leader>ol", "<cmd>ObsidianLinks<CR>", { desc = "Show ObsidianLinks" })
map("n", "<leader>on", "<cmd>ObsidianNew<CR>", { desc = "Create New Note" })
map("n", "<leader>os", "<cmd>ObsidianSearch<CR>", { desc = "Search Obsidian" })
map("n", "<leader>oq", "<cmd>ObsidianQuickSwitch<CR>", { desc = "Quick Switch" })
