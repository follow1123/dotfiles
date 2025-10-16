local wezterm = require("wezterm")
local conf = wezterm.config_builder()

local act = wezterm.action

-- options --------------------------------------------------------------------

conf.color_scheme = "Dark+"                                     -- 主题
conf.use_fancy_tab_bar = true                                  -- tab样式
conf.font = wezterm.font("CaskaydiaCove Nerd Font")             -- 字体
conf.font_size = 12                                             -- 字体大小
conf.default_cursor_style = "BlinkingBar"                       -- 光标样式
conf.cursor_blink_rate = 700                                    -- 光标闪烁频率
conf.cursor_blink_ease_in = "Constant"                          -- 光标闪烁显示效果
conf.cursor_blink_ease_out = "Constant"                         -- 光标闪烁消失效果
conf.window_decorations = "INTEGRATED_BUTTONS|RESIZE"           -- 不显示系统自带的状态栏
conf.default_prog = { "zsh" }                                  -- 默认shell
conf.scrollback_lines = 3000                                    -- 保持3000行历史记录
conf.default_workspace = "main"                                 -- 默认工作区名称
conf.disable_default_key_bindings = true                        -- 禁用所有默认快捷键
conf.use_ime = true                                             -- 使用输入法编辑器 (IME) 处理键盘输入，关闭则无法使用fcitx输入法
conf.status_update_interval = 1000                              -- 状态栏刷新间隔
conf.check_for_updates = false                                  -- 关闭自动检查更新
conf.audible_bell = "Disabled"                                  -- 关闭铃声
conf.initial_cols = 120                                         -- 初始列
conf.initial_rows = 30                                          -- 初始行
conf.animation_fps = 60                                         -- 动画帧率
conf.tab_max_width = 30                                         -- tab最大宽度
conf.window_padding = {                                         -- 内容边距
  left = 0, right = 0,
  top = 0, bottom = 0,
}
conf.inactive_pane_hsb = {                                      -- 非活动窗口样式
  brightness = 0.6
}
conf.launch_menu = {
  { label = "PowerShell Core", args = { "pwsh" } },
  { label = "Windows PowerShell", args = { "powershell" } },
  { label = "Command Prompt", args = { "cmd" } },
  { label = "Windows Subsystem For Linux", args = { "wsl", "--cd", "~" }},
  { label = "Windows Subsystem For Linux(root)", args = { "wsl", "--cd", "~", "-u", "root" }},
}

-- 加载本地启动配置，在当前目录下的local_config.lua内
local ok, local_config = pcall(require, "local_config")
if ok then
  local local_launch_menu = local_config.launch_menu
  if local_launch_menu then
    for _, launch_menu in ipairs(local_launch_menu) do
      table.insert(conf.launch_menu, launch_menu)
    end
  end
end

local choices_launch_menu = {};
for _, value in ipairs(conf.launch_menu) do
  table.insert(choices_launch_menu, { label = value.label, id = table.concat(value.args, " ") })
end

-- 选择程序进行分屏
local function split_program(direction)
  direction = direction or "Right"
  return act.InputSelector {
    title = "Select Program To Split",
    fuzzy = true,
    choices = choices_launch_menu,
    action =  wezterm.action_callback(function(_, pane, id, label)
      if not label and not id then return end
      local args = {}
      for word in string.gmatch(id, "%S+") do
        table.insert(args, word)
      end
      pane:split { direction = direction, args = args }
    end)
  }
end

---@param key string
---@param action any
---@param mods string|nil
---@return table
local function keymap(key, action, mods)
  return { key = key, mods = mods, action = action }
end

local keys = {}

---@param key string
---@param action any
---@param mods string|string[]|nil
function keys:set(key, action, mods)
  if mods == nil then
    table.insert(self, keymap(key, action))
    return
  end
  mods = type(mods) == "table" and mods or { mods }

  for _, m in ipairs(mods) do
    ---@cast m string
    table.insert(self, keymap(key, action, m))
  end
end

-- keymaps --------------------------------------------------------------------

-- leader key
conf.leader = { key = "w", mods = "ALT", timeout_milliseconds = 1000 }

-- 按两次 Alt+w 才是 Alt+w
keys:set("w", act.SendKey { key = "w", mods = "ALT" }, "LEADER|ALT")
-- Pane keybindings
keys:set("s", act.SplitVertical { domain = "CurrentPaneDomain" }, { "LEADER", "LEADER|ALT" })
keys:set("v", act.SplitHorizontal { domain = "CurrentPaneDomain" }, { "LEADER", "LEADER|ALT" })
keys:set("S", split_program("Bottom"), "LEADER")
keys:set("V", split_program(), "LEADER")
keys:set("q", act.CloseCurrentPane { confirm = true }, { "LEADER", "LEADER|ALT" })
keys:set("c", act.CloseCurrentPane { confirm = true }, { "LEADER", "LEADER|ALT" })
keys:set("h", act.ActivatePaneDirection("Left"), { "LEADER", "LEADER|ALT" })
keys:set("l", act.ActivatePaneDirection("Right"), { "LEADER", "LEADER|ALT" })
keys:set("j", act.ActivatePaneDirection("Down"), { "LEADER", "LEADER|ALT" })
keys:set("k", act.ActivatePaneDirection("Up"), { "LEADER", "LEADER|ALT" })

keys:set("z", act.TogglePaneZoomState, "LEADER")
keys:set("r", act.ActivateKeyTable { name = "resize pane", one_shot = false }, { "LEADER", "LEADER|ALT" })
keys:set("R", act.ActivateKeyTable { name = "rotate pane", one_shot = false }, "LEADER")

-- Tab keybindings

keys:set("n", act.SpawnTab("CurrentPaneDomain"), { "LEADER", "LEADER|ALT" })
keys:set("o", act.ShowLauncherArgs { flags = "FUZZY|LAUNCH_MENU_ITEMS" }, { "LEADER", "LEADER|ALT" })

keys:set("Tab", act.ActivateTabRelative(-1), "CTRL|SHIFT")
keys:set("Tab", act.ActivateTabRelative(1), "CTRL")
keys:set(";", act.ActivateTabRelative(1), "CTRL")
keys:set(",", act.ActivateTabRelative(-1), "CTRL")
keys:set("Tab", act.ActivateLastTab, { "LEADER", "LEADER|ALT" })
keys:set("t", act.ShowTabNavigator, "LEADER")
keys:set("m", act.ActivateKeyTable { name = "move tab", one_shot = false }, { "LEADER", "LEADER|ALT" })

keys:set("W", act.ShowLauncherArgs { flags = "FUZZY|WORKSPACES" }, "LEADER")
keys:set("p", act.ActivateCommandPalette, "CTRL|SHIFT")
keys:set("F11", act.ToggleFullScreen)

keys:set("c", act.CopyTo("Clipboard"), "CTRL|SHIFT")
keys:set("v", act.PasteFrom("Clipboard"), "CTRL|SHIFT")

-- font size
keys:set("-", act.DecreaseFontSize, "CTRL")
keys:set("=", act.IncreaseFontSize, "CTRL")
keys:set("0", act.ResetFontSize, "CTRL")

keys:set("PageUp", act.ScrollByPage(-1), "SHIFT")
keys:set("PageDown", act.ScrollByPage(1), "SHIFT")

for i = 1, 9, 1 do
  keys:set(tostring(i), act.ActivateTab(i - 1), "LEADER")
end

conf.key_tables = {
  ["resize pane"] = {
    keymap("h", act.AdjustPaneSize { "Left", 1 }),
    keymap("j", act.AdjustPaneSize { "Down", 1 }),
    keymap("k", act.AdjustPaneSize { "Up", 1 }),
    keymap("l", act.AdjustPaneSize { "Right", 1 }),
  },
  ["rotate pane"] = {
    keymap("j", act.RotatePanes("Clockwise")),
    keymap("k", act.RotatePanes("CounterClockwise")),
  },
  ["move tab"] = {
    keymap("h", act.MoveTabRelative(-1)),
    keymap("j", act.MoveTabRelative(-1)),
    keymap("k", act.MoveTabRelative(1)),
    keymap("l", act.MoveTabRelative(1)),
  }
}

-- 添加退出键
for _, value in pairs(conf.key_tables) do
  table.insert(value, keymap("Escape", "PopKeyTable"))
  table.insert(value, keymap("[", "PopKeyTable",  "CTRL"))
  table.insert(value, keymap("Enter", "PopKeyTable"))
end

keys.set = nil

conf.keys = keys

-- mouse ----------------------------------------------------------------------

conf.mouse_bindings = {
  -- { -- 禁用鼠标左键两下选中word时复制
  --   event = { Up = { streak = 2, button = "Left" } },
  --   mods = "NONE",
  --   action = act.Nop,
  -- },
  { -- 禁用鼠标左键三下选中line时复制
    event = { Up = { streak = 3, button = "Left" } },
    mods = "NONE",
    action = act.Nop,
  },
}

-- events ---------------------------------------------------------------------

local color_red1 = "#f7768e"
local color_blue1 = "#7dcfff"
local color_purple1 = "#bb9af7"

local function basename(s)
  local a = string.gsub(s, "(.*[/\\])(.*)", "%2")
  return a:gsub("%.exe$", "")
end


wezterm.on("update-status", function(window)
  local stat = window:active_workspace()
  local stat_color = color_red1

  if window:active_key_table() then
    stat = window:active_key_table()
    stat_color = color_blue1
  end

  if window:leader_is_active() then
    stat = "LDR"
    stat_color = color_purple1
  end

  window:set_right_status(wezterm.format({
    { Foreground = { Color = stat_color } },
    { Text = stat },
    { Text = " " },
  }))
end)

wezterm.on("format-tab-title", function(tab)
  local process_name = basename(tab.active_pane.foreground_process_name)
  local title = process_name:len() > 0 and process_name or basename(tab.active_pane.title)

  local def_attr = { Attribute = { Intensity = "Bold" } }
  local cells = {
    { Text = " " },
    def_attr,
    { Text = title },
    { Text = " " }
  }

  if tab.active_pane.title:match("^Administrator: ") then
    table.insert(cells, 2, " " .. wezterm.nerdfonts.md_shield)
  end

  return cells
end)

return conf
