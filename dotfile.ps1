# 获取当前脚本所在的 文件夹 绝对路径
$scriptPath = $PSScriptRoot


function ZedConfig {
	param ([string]$option)
	$zedConfigRoot = Join-Path $env:APPDATA "Zed"
	$currentZedConfig = Join-Path $scriptPath "zed"
	$zedSettingsPath = Join-Path $zedConfigRoot 'settings.json'
	$zedKeymapPath = Join-Path $zedConfigRoot 'keymap.json'
	switch ($option) {
		"setup" {
			if (-not (Test-Path $zedConfigRoot)) {
				mkdir "$zedConfigRoot"
			}
			New-Item -ItemType SymbolicLink -Path "$zedSettingsPath" -Target "$(Join-Path $currentZedConfig 'settings.json')"
			New-Item -ItemType SymbolicLink -Path "$zedKeymapPath" -Target "$(Join-Path $currentZedConfig 'keymap.json')"
		}
		"clean" {
			Remove-Item -Force $zedSettingsPath
			Remove-Item -Force $zedKeymapPath
		}
	}
}

function FirefoxConfig {
	param ([string]$option)
	$firefoxConfigRoot = Join-Path $env:APPDATA "Mozilla\Firefox"
	if (-not (Test-Path $firefoxConfigRoot)) {
		Write-Output "Firefox config root is not exists"
		exit 1
	}
	$firefoxProfilesIni= Join-Path $firefoxConfigRoot "profiles.ini"

	$profilePath = Select-String -Path $firefoxProfilesIni -Pattern '^Default=Profiles/' |
    ForEach-Object {
        $_.Line -replace '^Default=', ''
    }
	$firefoxProfilePath = Join-Path $firefoxConfigRoot $profilePath

	if (-not (Test-Path $firefoxProfilePath)) {
		Write-Output "Firefox default config is not exists"
		exit 1
	}
	
	$firefoxUserJsPath = Join-Path $firefoxProfilePath "user.js"
	$currentFirefoxConfig = Join-Path $scriptPath "firefox"
	switch ($option) {
		"setup" {
			New-Item -ItemType SymbolicLink -Path "$firefoxUserJsPath" -Target "$(Join-Path $currentFirefoxConfig 'user.js')"
		}
		"clean" {
			Remove-Item -Force $firefoxUserJsPath
		}
	}
	 
}

function PowershellConfig {
	param ([string]$option)
	$powershellConfigRoot = Split-Path $PROFILE

	switch ($option) {
		"setup" {
			[Environment]::SetEnvironmentVariable("POWERSHELL_TELEMETRY_OPTOUT", "1", "Machine")
			[Environment]::SetEnvironmentVariable("POWERSHELL_UPDATECHECK", "Off", "Machine")

			if (-not (Test-Path $powershellConfigRoot)) {
				mkdir $powershellConfigRoot
			}
			$currentPowershellConfig = Join-Path $scriptPath "powershell"
			New-Item -ItemType SymbolicLink -Path "$PROFILE" -Target "$(Join-Path $currentPowershellConfig 'Microsoft.PowerShell_profile.ps1')"
		}
		"clean" {
			Remove-Item -Force $PROFILE
		}
	}
}

$action = $args[0]
$name = $args[1]

switch ($action) {
	"setup" {
		switch ($name) {
			"zed" { ZedConfig "setup" }
			"firefox" { FirefoxConfig "setup" }
			"powershell" { PowershellConfig "setup" }
		}
	}
	"clean" {
		switch ($name) {
			"zed" { ZedConfig "clean" }
			"firefox" { FirefoxConfig "clean" }
			"powershell" { PowershellConfig "clean" }
		}
	}
}


