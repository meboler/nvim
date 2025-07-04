return {
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            --"nvim-tree/nvim-web-devicons",
        },
        opts = {

        },
        config = function()
            require("nvim-tree").setup()
			require("helpers.keys").map(
				{ "n", "v" },
				"<leader>E",
				"<cmd>NvimTreeToggle<cr>",
				"Toggle file explorer"
			)
        end,
    },
}
