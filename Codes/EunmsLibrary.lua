local StudioS = game:GetService("StudioService")

local Eunms = {
	["UserSettingsType"] = {
		["LocaleId"] = StudioS.StudioLocaleId,
		["WhoisUser"] = StudioS:GetUserId()
		
		
	},
	["Obj_Type"] = {
		["Folder"] = {
			["ImageID"] = "rbxassetid://137483941013142",
			["Name"] = "Folder"
		},
		
		["DataBase"] = {
			["ImageID"] = "",
			["Name"] = "DataBase"
		},
		
		["NewQuery"] = {
			["ImageID"] = "",
			["Name"] = "NewQuery"
		},
		
		["GraphicalQuery"] = {
			["ImageID"] = "",
			["Name"] = "GraphicalQuery"
		},
		["Non-SQL-Queries"] = {
			["ImageID"] = "",
			["Name"] = "Non-SQL-Queries"
		},
		["Place"] = {
			["ImageID"] = "rbxassetid://78615438381721",
			["Name"] = "Place"
		},
		["Game"] = {
			["ImageID"] = "rbxassetid://98770351301056",
			["ImageID2"] = "rbxassetid://113224509911250",
			["Name"] = "Game"
		},
		["Workspace"] = {
			["ImageID"] = "",
			["Name"] = "Workspace"
		},
		["DataBaseGroup"] = {
			["ImageID"] = "rbxassetid://129111375495463",
			["Name"] = "DataBaseGroup"
		},
		["BanData"] = {
			["ImageID"] = "rbxassetid://101431635731549",
			["Name"] = "BanData"
		},
		["User"] = {
			["ImageID"] = "rbxassetid://116944857377893",
			["Name"] = "User"
		},
		["Owner"] = {
			["ImageID"] = "rbxassetid://114009177234858",
			["Name"] = "Owner"
		},
		["Role"] = {
			["ImageID"] = "rbxassetid://130162679394423",
			["Name"] = "Role"
		},
	},
	
	["SelectUI"] = {
		["Frame"] = script.Parent.Parent:WaitForChild("GUIPart"):WaitForChild("SelectObj"),
		["Unit"] = script.Parent.Parent:WaitForChild("GUIPart"):WaitForChild("SelectObj_Unit")
	},
	
	
	["GUIType"] = {
		["Parts"] = script.Parent.Parent:WaitForChild("GUIPart")
		
		
	}
	
}

return Eunms
