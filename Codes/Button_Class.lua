local Button_Class = {}
Button_Class.__index = Button_Class
function Button_Class.new(obj)
	local self = {}
	self.Name = self.Name
	self.ImageID = self.ImageID
	self.Tips = self.Tips 
	setmetatable(self,Button_Class)
	return self
end

function Button_Class.Create(self,PluginObj)
	local Toolbar = PluginObj.Toolbar
	self.Button = self.Button or Toolbar:CreateButton(math.random(1,10000),self.Tips,self.ImageID,self.Name)
	return self.Button
end

function Button_Class.Click(self,funcitonCallback)
	self.Button.Click:Connect(function(x,y)
		return funcitonCallback(x,y)
	end)
end

return Button_Class











