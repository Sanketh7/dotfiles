-- basic options
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'

vim.opt.smartcase = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv('HOME') .. '/.vim/undodir'
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8

vim.opt.updatetime = 50

vim.opt.termguicolors = true

-- basic remaps
vim.g.mapleader = ' '
vim.keymap.set('i', 'jk', '<Esc>')
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

vim.keymap.set('n', 'Q', '<nop>')

vim.keymap.set('n',  '<leader>sv', '<C-w>v') -- split vertically
vim.keymap.set('n',  '<leader>sh', '<C-w>s') -- split horizontally
vim.keymap.set('n',  '<leader>se', '<C-w>=') -- make split windows equal in height

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])

-- plugins
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local install_plugins = false

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	print('Installing packer...')
	local packer_url = 'https://github.com/wbthomason/packer.nvim'
	vim.fn.system({'git', 'clone', '--depth', '1', packer_url, install_path})
	print('Done.')

	vim.cmd('packadd packer.nvim')
	install_plugins = true
end

require('packer').startup(function(use)
	-- Package manager
	use 'wbthomason/packer.nvim'

	-- Theme inspired by Atom
	use 'joshdick/onedark.vim'

	-- Status line
	use 'nvim-lualine/lualine.nvim'

	-- TreeSitter
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

	-- Telescope
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	-- Harpoon
	use 'theprimeagen/harpoon'

	-- UndoTree
	use 'mbbill/undotree'

	-- Vim Fugitive
	use 'tpope/vim-fugitive'

	-- LSP
	use {
		'VonHeikemen/lsp-zero.nvim',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-buffer'},
			{'hrsh7th/cmp-path'},
			{'saadparwaiz1/cmp_luasnip'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'hrsh7th/cmp-nvim-lua'},

			-- Snippets
			{'L3MON4D3/LuaSnip'},
			{'rafamadriz/friendly-snippets'},
		}
	}

    -- AutoPair
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    --  Window navigation
    use { "alexghergh/nvim-tmux-navigation" }

    -- Comments
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

	if install_plugins then
		require('packer').sync()
	end
end)
if install_plugins then
	return
end

