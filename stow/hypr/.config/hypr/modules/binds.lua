local terminal = "kitty"
local fileManager = "nautilus"
local browser = "brave"

local mainMod = "SUPER"

-------------------
-- APPS BINDINGS --
-------------------

hl.bind(mainMod .. " + return", hl.dsp.exec_cmd(terminal), { description = "Open Terminal" })
hl.bind(mainMod .. " + W", hl.dsp.window.close(), { description = "Close Window" })
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager), { description = "Open File Manager" })
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser), { description = "Open Browser" })
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd(terminal .. " nvim"), { description = "Open nvim" })
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd("qs ipc call launcher toggle"))
hl.bind(
	mainMod .. " + SHIFT + B",
	hl.dsp.exec_cmd(browser .. " --incognito"),
	{ description = "Open Browser Incognito" }
)
hl.bind(mainMod .. " + SHIFT + T", hl.dsp.exec_cmd(terminal .. " btop"), { description = "Open btop" })
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.exec_cmd("gnome-calculator"), { description = "Open Calculator" })
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.exec_cmd("hyprlock"), { description = "Lock Session" })
hl.bind(mainMod .. " + SHIFT + A", hl.dsp.exec_cmd("gtk-launch chatgpt"), { description = "Open ChatGPT" })
hl.bind(
	mainMod .. " + SHIFT + V",
	hl.dsp.exec_cmd("~/.config/hypr/scripts/clipboard.sh"),
	{ description = "Open Clipboard" }
)
hl.bind(
	mainMod .. " + PRINT",
	hl.dsp.exec_cmd("pkill hyprpicker || hyprpicker -a"),
	{ description = "Open Color Picker" }
)
hl.bind(mainMod .. " + CTRL + SPACE", hl.dsp.exec_cmd("qs ipc call wallpaper toggle"))
hl.bind(
	"PRINT",
	hl.dsp.exec_cmd("grim ~/Pictures/Screenshots/screenshot_$(date +'%Y-%m-%d_%H-%M-%S').png"),
	{ description = "Screenshot Full Monitor" }
)
hl.bind(
	"SHIFT + PRINT",
	hl.dsp.exec_cmd("grim -g \"$(slurp)\" ~/Pictures/Screenshots/screenshot_$(date +'%Y-%m-%d_%H-%M-%S').png"),
	{ description = "Screenshot Custom Zone" }
)

--------------------
-- OTHER BINDINGS --
--------------------

hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen(), { description = "Toggle Fullscreen" })
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }), { description = "Toggle Float" })
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.layout("togglesplit"), { description = "Toggle Split" })
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo(), { description = "Toggle Pseudo" })
hl.bind(
	mainMod .. " + O",
	hl.dsp.window.set_prop({ prop = "opaque", value = "toggle" }),
	{ description = "Toggle Window Opacity" }
)

-------------------------
-- WORKSPACES BINDINGS --
-------------------------

hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- # Laptop multimedia keys for volume and LCD brightness (with OSD)

local function vol(args)
	return hl.dsp.exec_cmd("wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ " .. args)
end

hl.bind("XF86AudioRaiseVolume", vol("3%+"), { locked = true, repeating = true, description = "Volume Up" })
hl.bind("XF86AudioLowerVolume", vol("3%-"), { locked = true, repeating = true, description = "Volume Down" })
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, description = "Mute Toggle" }
)

local function bri(args)
	return hl.dsp.exec_cmd("brightnessctl set " .. args)
end

hl.bind("XF86MonBrightnessUp", bri("5%+"), { locked = true, repeating = true, description = "Brightness Up" })
hl.bind("XF86MonBrightnessDown", bri("5%-"), { locked = true, repeating = true, description = "Brightness Down" })

-- # Log bindings
hl.bind(mainMod .. " + ESCAPE + L", hl.dsp.exec_cmd("loginctl lock-session"), { description = "Lock Session" })
hl.bind(
	mainMod .. " + ESCAPE + E",
	hl.dsp.exec_cmd("loginctl kill-session $XDG_SESSION_ID"),
	{ description = "Logout" }
)
hl.bind(mainMod .. " + ESCAPE + U", hl.dsp.exec_cmd("systemctl suspend"), { description = "Suspend" })
hl.bind(mainMod .. " + ESCAPE + H", hl.dsp.exec_cmd("systemctl hibernate"), { description = "Hibernate" })
hl.bind(mainMod .. " + ESCAPE + S", hl.dsp.exec_cmd("systemctl poweroff"), { description = "Power Off" })
hl.bind(mainMod .. " + ESCAPE + R", hl.dsp.exec_cmd("systemctl reboot"), { description = "Reboot" })
