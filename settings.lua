data:extend({
    {
        type = "int-setting",
        name = "radicane-uranium-yield",
        setting_type = "startup",
        default_value = 2,
		allowed_values = {2, 3, 4},
        order = "aa"
    },

    {
        type = "bool-setting",
        name = "radicane-create-tile-effect",
        setting_type = "startup",
        default_value = true,
        order = "ba"
    },
	
    {
        type = "bool-setting",
        name = "radicane-spoils",
        setting_type = "startup",
        default_value = true,
        order = "bb"
    },
	
    {
        type = "bool-setting",
        name = "radicane-add-pentapod-eggs",
        setting_type = "startup",
        default_value = true,
        order = "bc"
    },
	
})