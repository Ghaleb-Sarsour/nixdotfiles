--Leader Key
vim.g.mapleader = " "

local keymap = vim.keymap

--Splits
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) 
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) 
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })
keymap.set("n","<leader>ss","<C-w>w",{ desc = "Switch between splits"})

--TODO:
--keymap.set("n","<leader>s","<C-w>l",{ desc = "Switch to right split"})
--keymap.set("n","<leader>s","<C-w>w",{ desc = "Switch between splits"})
--keymap.set("n","<leader>ss","<C-w>j",{ desc = "Switch between splits"})
--keymap.set("n","<leader>ss","<C-w>l",{ desc = "Switch between splits"})
--Tabs
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) 
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) 
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) 
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) 
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
