local function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if (opts) then
		options = vim.tbl_extend("force", options, opts)
	end

	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Move cursor
--map("i", "<A-k>", "<Esc>ji")
--map("n", "k", "j")

--map("i", "<A-j>", "<Esc>hi")
--map("n", "j", "h")

--map("i", "<A-i>", "<Esc>ki")
--map("n", "i", "k")

--map("i", "<A-l>", "<Esc>li")
--map("n", "l", "l")

-- Move current line up
--map("n", "<S-i>", ":m-2<CR>==")
--map("i", "<A-S-i>", "<Esc>:m-2<CR>==gi")

-- Move current line down
--map("n", "<S-k>", ":m+1<CR>==")
--map("i", "<A-S-k>", "<Esc>:m+1<CR>==gi")

-- Toggle whitespace characters
map("n", "<F5>", ":set list!<CR>")
map("i", "<F5>", "<C-o>:set list!<CR>")

-- INSERT mode
--map("n", "<S-i>", "i")

-- Command mode
--map("i", "<C-S-p>", "<C-o>")
