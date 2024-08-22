local Class = {}
local UserInputS = game:GetService("UserInputService")
Class.__index = Class
	function Class.new(KeyCode:{["KeyCodeString"] : Enum.KeyCode },fun)
		print("sb")
	if KeyCode[1] == "Shift" then
		KeyCode[1] = "LeftShift"
	end
		while true do
			task.wait(1)
			if UserInputS:IsKeyDown(Enum.KeyCode[KeyCode[1]]) then
			for a,b in ipairs(UserInputS:GetKeysPressed()) do
					if b == Enum.KeyCode.N then
						return fun()
					end
				end
			end
		end
	end
return Class	











