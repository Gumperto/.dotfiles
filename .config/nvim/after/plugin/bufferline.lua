local bufferline = require("bufferline")

local options = {
    options = {
        hover = {
            enabled = true,
            delay = 200,
            reveal = {'close'}
        },

        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                highlight = "Directory",
                separator = true -- use a "true" to enable the default, or set your own character
            },
            {
                filetype = "undotree",
                text = "Undotree",
                highlight = "Directory",
                separator = true
            },
        },
    },
    highlights = {
        -- Define your highlight groups here if needed
    }
}

bufferline.setup(options)

