// 关闭打开 about:config 时的警告
user_pref("browser.aboutConfig.showWarning", false);

// 关闭浏览器严格隐私保护功能（开启后可能导致 alt 配合的所有快捷键都无法使用）
user_pref("privacy.resistFingerprinting", false);

// 禁用检查默认浏览器
user_pref("browser.shell.checkDefaultBrowser", false);
// 禁用 pocket 功能
user_pref("extensions.pocket.enabled", false);

user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons", false);
user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features", false);

// 内存占用过高时释放部分 tab 的内存
user_pref("browser.tabs.unloadOnLowMemory", true);
// 外观 -----------------------------------------------------------------------

// ui 紧凑模式
user_pref("browser.uidensity", 1);

// 关闭全屏时的延时
user_pref("full-screen-api.transition-duration.enter", "0 0"); // default=200 200
user_pref("full-screen-api.transition-duration.leave", "0 0"); // default=200 200

// 禁用全屏时的提示
user_pref("full-screen-api.warning.delay", -1); // default=500
user_pref("full-screen-api.warning.timeout", 0); // default=3000

// 按键 -----------------------------------------------------------------------
// 禁用 alt 键显示顶部的菜单栏
user_pref("ui.key.menuAccessKeyFocuses", false);
// alt 加部分键也会显示顶部的菜单栏，改为 0 禁用
user_pref("ui.key.menuAccessKey", 0);

// 禁用遥测 -------------------------------------------------------------------

/* 0332: disable telemetry
 * The "unified" pref affects the behavior of the "enabled" pref
 * - If "unified" is false then "enabled" controls the telemetry module
 * - If "unified" is true then "enabled" only controls whether to record extended data
 * [NOTE] "toolkit.telemetry.enabled" is now LOCKED to reflect prerelease (true) or release builds (false) [2]
 * [1] https://firefox-source-docs.mozilla.org/toolkit/components/telemetry/telemetry/internals/preferences.html
 * [2] https://medium.com/georg-fritzsche/data-preference-changes-in-firefox-58-2d5df9c428b5 ***/
user_pref("toolkit.telemetry.unified", false);
user_pref("toolkit.telemetry.enabled", false); // see [NOTE]
user_pref("toolkit.telemetry.server", "data:,");
user_pref("toolkit.telemetry.archive.enabled", false);
user_pref("toolkit.telemetry.newProfilePing.enabled", false); // [FF55+]
user_pref("toolkit.telemetry.shutdownPingSender.enabled", false); // [FF55+]
user_pref("toolkit.telemetry.updatePing.enabled", false); // [FF56+]
user_pref("toolkit.telemetry.bhrPing.enabled", false); // [FF57+] Background Hang Reporter
user_pref("toolkit.telemetry.firstShutdownPing.enabled", false); // [FF57+]
/* 0333: disable Telemetry Coverage
 * [1] https://blog.mozilla.org/data/2018/08/20/effectively-measuring-search-in-firefox/ ***/
user_pref("toolkit.telemetry.coverage.opt-out", true); // [HIDDEN PREF]
user_pref("toolkit.coverage.opt-out", true); // [FF64+] [HIDDEN PREF]
user_pref("toolkit.coverage.endpoint.base", "");
