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
	use { "ms-jpq/coq.artifacts", branch = "artifacts" }
	use { "ms-jpq/coq.thirdparty", branch = "3p" }
	use { "neovim/nvim-lspconfig" }
	use { "rhysd/vim-clang-format" }
	use { "tanvirtin/vgit.nvim", requires = { "nvim-lua/plenary.nvim" } }

	if (packer_bootstrap) then
		print "Restart Neovim required after installation!"
		require("packer").sync()
	end
end

packer_init()

local packer = require("packer")
packer.init(conf)
packer.startup(plugins)

-- Automatically start COQ
vim.g.coq_settings = {
	auto_start = "shut-up"
}
local coq = require("coq")

-- Enable clangd
local lsp = require("lspconfig")
lsp.clangd.setup{coq.lsp_ensure_capabilities()}

-- VGit
local vgit = require("vgit")
vgit.setup()
