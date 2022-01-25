local actions = require("telescope.actions")
require('telescope').setup{
	defaults = {
		mappings = {
			i = {
				["<A-p>"] = actions.close,
				["<esc>"] = actions.close
			}
		}
	},
	pickers = {
		find_files = {
		}
	},
	extensions = {
	}
}
