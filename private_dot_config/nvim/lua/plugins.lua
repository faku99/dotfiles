local packer_bootstrap = false

-- packer.nvim configuration
local conf = {
	display = {
		open_fn = function()
			return require("packer.util").float { border = "rounded" }
		end,
	},
}

-- Check if packer.nvim is installed
local function packer_init()
	local fn = vim.fn
	local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
	if (fn.empty(fn.glob(install_path)) > 0) then
		packer_bootstrap = fn.system {
			"git",
			"clone",
			"--depth",
			"1",
			"https://github.com/wbthomason/packer.nvim",
			install_path,
		}
		vim.cmd [[packadd packer.nvim]]
	end
	vim.cmd "autocmd BufWritePost plugins.lua source <afile> | PackerCompile"
end

-- Plugins
local function plugins(use)
	use { "wbthomason/packer.nvim" }
	use { "mhartington/oceanic-next" }
	use { "ms-jpq/coq_nvim", branch = "coq" }
	use { "neovim/nvim-lspconfig" }
	use { "rhysd/vim-clang-format" }

	if (packer_bootstrap) then
		print "Restart Neovim required after installation!"
		require("packer").sync()
	end
end

packer_init()

local packer = require("packer")
packer.init(conf)
packer.startup(plugins)

local function lsp_on_attach(client, bufnr)
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- local bufopts = { noremap = true, silent = true, buffer = bufnr }
end

-- Enable clangd
local lspconfig = require("lspconfig")
lspconfig.clangd.setup{
	on_attach = lsp_on_attach,
}
