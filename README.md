local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({IntroText = "by thaibao7444",Name = "Tbao Hub | Arsenal", HidePremium = false, SaveConfig = true, ConfigFolder = ""})


Tab = Window:MakeTab({Name = "Game Arsenal", Icon = "rbxassetid://15885360708",PremiumOnly = false })

Tab: AddButton({
	Name = "Arsenal script old",
	Callback = function(value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/thaibao/main/TbaoHubArsenal"))()
end
})

Tab: AddButton({
	Name = "Arsenal script new",
	Callback = function(value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/thaibao/main/ArsenalTbaoHubNew"))()
end
})
OrionLib:Init()
