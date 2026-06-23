-- $activeBorderColor = rgba(89b4faee) rgba(F5C2E7ee) 25deg
hl.config({
	general = {
		gaps_in = 5,
		gaps_out = 10,

		border_size = 2,

		col = {
			-- active_border = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
			active_border = { colors = { "rgba(89b4faee)", "rgba(F5C2E7ee)" }, angle = 25 },
			inactive_border = "rgba(595959aa)",
		},

		-- Set to true to enable resizing windows by clicking and dragging on borders and gaps
		resize_on_border = false,

		-- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
		allow_tearing = false,

		layout = "dwindle",
	},

	decoration = {
		rounding = 4,
		rounding_power = 4,

		-- Change transparency of focused and unfocused windows
		active_opacity = 0.85,
		inactive_opacity = 0.7,

		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = 0xee1a1a1a,
		},

		blur = {
			enabled = true,
			size = 3,
			passes = 5,
			vibrancy = 0.1696,
		},
	},
})
