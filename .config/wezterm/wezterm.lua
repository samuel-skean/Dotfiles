-- TODONOW(sskean2): Why are wrapped links clickable in macOS vim 9.1 on VSCode but nowhere else in the terminal that I can see? Related: look into escape codes for links in the terminal.
local wezterm = require 'wezterm'

local config = wezterm.config_builder()

-- macOS brain moment.
-- CONSIDER: making this dependent on the OS.
-- It may only work on macOS anyway, I have no trivial way to check its behavior on other machines at the moment.
config.quit_when_all_windows_are_closed = false

-- TODO: Is there a way to tell if I ever exceed this?
config.scrollback_lines = 1000000

-- Bell:
config.audible_bell = 'Disabled'
config.visual_bell = {
    fade_in_duration_ms = 75,
    fade_out_duration_ms = 75,
    --    target = 'CursorColor', -- CursorColor seems to only intermittently work.
}

config.colors = {
    visual_bell = '#202020'
}

-- Disable "most ligatures" (https://wezterm.org/config/font-shaping.html#advanced-font-shaping-options):
config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }

-- Leave pane open on program exit:
config.exit_behavior = 'Hold'

-- Makes my "insert mode" (line-shaped) cursor slightly thicker. Can make text harder to read.
--
-- Also makes the cursor outline slightly thicker on an unfocused window,
-- which was not the intent, but go off I guess.
config.cursor_thickness = '0.08cell'

-- # Keybinds:
-- I always refer to the key [known in wezterm configs as 'SUPER', 'CMD', or 'WIN'](https://wezterm.org/config/keys.html#configuring-key-assignments) by its brand-agnostic name 'SUPER'.

-- Do not omit timeout_milliseconds - it defaults to 1000, but I want to make its existence explicit.
config.leader = {
    key = 'b', -- to match the letter in default tmux prefix
    mods = 'SUPER',
    timeout_milliseconds = 1000,
}

-- From https://wezterm.org/config/lua/pane/move_to_new_window.html, but with the keybinding modified.
config.keys = {
    {
        key = 'l',
        mods = 'SUPER',
        action = wezterm.action.ShowLauncher,
    },
    {
        key = 'n', -- in honor of CMD+n being the default shortcut to introduce a new window in many macOS apps
        mods = 'LEADER',
        action = wezterm.action_callback(function(win, pane)
            local tab, window = pane:move_to_new_window()
        end),
    },
}

-- Always prompt before closing tabs? Not what I want,
-- but tabs invoked by the built-in ssh close without prompting without this.
--
-- Nah, I'm 90% sure this is just broken. Even with this returning true, as of this writing, it allows me to kill tabs using the built-in ssh domains.
-- wezterm.on('mux-is-process-stateful', function (proc)
--  print("Hi!") -- When this code is active, 'Hi' is logged to wezterm's stderr on closing a "normal" local tab, but not when closing a tab managed by the built-in ssh with 'scheme' 'SSH:'.
--   return true
-- end)

return config

-- Records of my current complaints with WezTerm:
-- # Not mac-assed, cursor problems (conversation with Jacob):
-- Me:
-- > I’m a little disappointed in WezTerm, but I want to give its remote multiplexer daemon feature a try because I don’t much like tmux.
-- Jacob:
-- > What were you expecting/hoping for from WezTerm exactly that it didn't provide?
-- Me:
-- > Mouse-draggable tabs, responding to control-click just like right click on the UI, a UI tab bar that isn’t laggy, and a consistently working visual bell that changes only the cursor (that last thing is not something I know how to get anywhere else, but it’s advertised in the docs but mysteriously only works intermittently).
-- Open question - how configurable are these issues? Specifically the first 2.
--
-- # Integrated ssh jank (an initial message from me):
-- > Specifically, ‘SUPER+W’ kills panes using the built-in ssh without prompting me. Such prompting does occur for “local” panes when running an ssh command. Documentation of relevant config doesn’t directly mention the built-in ssh functionality and this prompting together. I have been unable to configure it to prompt me.
-- > This matters especially to me because I don’t want normal termination of the process to close the pane, but I do want a keyboard-driven way to close panes.
-- > I have a theory as to why - WezTerm probably doesn’t really know what processes I’m running on the remote end, so it can’t apply the same logic to detect whether it should let me kill it sans confirmation.
-- > At the very least, this is a documentation error.
