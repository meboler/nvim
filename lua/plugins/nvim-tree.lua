-- TODO: Replace git status icons with neotree style modifiers
return {
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
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
