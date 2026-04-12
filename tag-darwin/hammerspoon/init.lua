-- Hammerspoon configuration
hs.alert.show("Hammerspoon loaded")

-- Chord: ctrl+s -> <key> for launching apps/shortcuts
local launchMode = hs.hotkey.modal.new("ctrl", "s")
local chrome = "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
local open = "/usr/bin/open"

local function chromeApp(url, profile)
	hs.task
		.new(chrome, nil, {
			"--new-window",
			"--app=" .. url,
			"--profile-directory=" .. profile,
		})
		:start()
end

local function terminal(cmd)
	hs.task
		.new(open, nil, {
			"-n",
			"-a",
			"kitty.app",
			"--args",
			"--single-instance",
			"--config",
			os.getenv("HOME") .. "/.config/kitty/standalone-window.conf",
			cmd,
		})
		:start()
end

launchMode:bind("", "escape", function()
	launchMode:exit()
end)

-- Exit automatically after 2 seconds if no key pressed
function launchMode:entered()
	self.timer = hs.timer.doAfter(2, function()
		self:exit()
	end)
end

function launchMode:exited()
	if self.timer then
		self.timer:stop()
	end
end

-- ctrl+s -> r: reload Hammerspoon
launchMode:bind("", "r", function()
	launchMode:exit()
	hs.reload()
end)

-- ctrl+s -> m: Fastmail
launchMode:bind("", "m", function()
	launchMode:exit()
	chromeApp("https://app.fastmail.com/mail/Inbox/?u=80a64040", "Profile 2")
end)

-- ctrl+s -> c: Calendar
launchMode:bind("", "c", function()
	launchMode:exit()
	chromeApp("https://calendar.google.com", "Profile 1")
end)

-- ctrl+s -> g: Gmail
launchMode:bind("", "g", function()
	launchMode:exit()
	chromeApp("https://mail.google.com", "Profile 1")
end)

-- ctrl+s -> t: btop in kitty
launchMode:bind("", "t", function()
	launchMode:exit()
	terminal("btop")
end)
