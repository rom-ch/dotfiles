hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

hl.window_rule({
	name = "supress-maximize-events",
	match = { class = ".*" },
	suppress_event = "maximize",
})

hl.window_rule({
	name = "brave-no-opacity",
	match = { class = "brave-browser" },
	opacity = "1.0 override 1.0 override",
})

hl.window_rule({
	name = "zen-no-opacity",
	match = { class = "zen" },
	opacity = "1.0 override 1.0 override",
})

hl.window_rule({
	name = "mpv-no-opcaity",
	match = { class = "mpv" },
	opacity = "1.0 override 1.0 override",
})

hl.layer_rule({
	name = "wlogout-blur",
	match = { namespace = "logout_dialog" },
	blur = true,
})

hl.layer_rule({
	name = "rofi-animation",
	match = { namespace = "rofi" },
	blur = true,
	animation = "popin 95%",
})
