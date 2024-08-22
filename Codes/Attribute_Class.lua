local RoOOP = require(script.Parent.Parent:WaitForChild("PluginsSet"):WaitForChild("RoOOP"))
local class = RoOOP.class

local Attribute = class {
	"Attribute",
	{
		["public"] = {
			
			
			
		},
		
		
		["newAttribute"] = function(self)
			print(self)
		end,
	}
}



return Attribute
