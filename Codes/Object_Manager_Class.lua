local Class = {}
--I used B+ Tree
local Eunms = require(script.Parent.Parent:WaitForChild("PluginsSet"):WaitForChild("EunmsLibrary"))
local Attribute_Class = require(script.Parent:WaitForChild("Attribute_Class"))
local function Mouse(CloneUnit)
	CloneUnit:WaitForChild("Frame").MouseEnter:Connect(function()
		CloneUnit:WaitForChild("Frame").BackgroundColor3 = Color3.new(0.0313725, 0.662745, 1)
		CloneUnit:WaitForChild("Frame").BackgroundTransparency = 0.9
	end)

	CloneUnit:WaitForChild("Frame").MouseLeave:Connect(function()
		CloneUnit:WaitForChild("Frame").BackgroundTransparency = 1
		CloneUnit:WaitForChild("Frame").BackgroundColor3 = Color3.new(0, 0.835294, 1)
	end)

end
Class.__index = Class
	
	function Class.newManager(Frame,Unit)
		local self = {}
		self.Tree = {}
		setmetatable(self,Class)
		self.MaxFile = nil
		self.CanParentAndChildren = true
		self.Frame = Frame
		self.Unit = Unit
		return self
	end
	
	function Class.newRoot(self,EunmsType,Name)
		local EunmName = EunmsType.Name
		local ImageID = EunmsType.ImageID
		self.Name = Name
		self.Tree[Name] = {}
		local CloneUnit:ImageButton = self.Unit:Clone()
		local Text = CloneUnit:WaitForChild("Frame"):WaitForChild("ObjName")
		local Icon = CloneUnit:WaitForChild("Frame"):WaitForChild("Icon")
		Text.Text = Name
		Icon.Image = ImageID
		local Button:ImageButton = CloneUnit:WaitForChild("Frame"):WaitForChild("Open_Close")
		Button.Rotation = 90
		local Childern:Frame = CloneUnit:WaitForChild("ChildrenUnit")
		Button.MouseButton1Down:Connect(function()
			Childern.Visible = not Childern.Visible
			if not Childern.Visible then
				Button.Rotation = 0
			else	
				Button.Rotation = 90
			end
		end)
		CloneUnit.Parent = self.Frame
		Mouse(CloneUnit)
	local Attribute = Attribute_Class.new()
	print(Attribute)
		return CloneUnit
	end
	
	function Class.newChildrenForRoot(self,Unit,Name,EunmsType,Level)
		local Name2 = EunmsType.Name
		local ImageID = EunmsType.ImageID
		local Childern:Frame = Unit:WaitForChild("ChildrenUnit")
		local ChildernUnit = Eunms.GUIType.Parts:WaitForChild("ChildObjUnit"):Clone()
		ChildernUnit.Parent = Childern
		Unit:WaitForChild("Frame"):WaitForChild("Open_Close").Visible = true
		ChildernUnit:WaitForChild("Frame"):WaitForChild("Icon").Image = ImageID
		ChildernUnit:WaitForChild("Frame"):WaitForChild("ObjName").Text = Name
		ChildernUnit.LayoutOrder = Level or ChildernUnit.LayoutOrder
		ChildernUnit.Name = Name
		Childern.Visible = true
		self.Tree[self.Name][Name] = {}
		print(self.Tree)
		Mouse(ChildernUnit)
		local Open = ChildernUnit:WaitForChild("Frame"):WaitForChild("Open_Close")
		local ChildInChildUint = ChildernUnit:WaitForChild("ChildrenUnit")
		Open.MouseButton1Down:Connect(function()
			print("sb")
			ChildInChildUint.Visible = not ChildInChildUint.Visible
			if ChildInChildUint.Visible then
				Open.Rotation = 90
			else
				Open.Rotation = 0
			end
		end)
		
		return ChildernUnit
	end
	
	
	function Class.newNode(self,ParentUnit:Frame,Eunms,Name,Level)
		local ImageID = Eunms.ImageID
		local Frame = ParentUnit:WaitForChild("ChildrenUnit")
		local Unit = self.Unit:Clone()
		Unit.Parent = Frame
		Unit.Name = Name
		Unit.LayoutOrder = Level or Unit.LayoutOrder
		Unit:WaitForChild("Frame"):WaitForChild("Icon").Image = ImageID
		Unit:WaitForChild("Frame"):WaitForChild("ObjName").Text = Name
		local Open2:ImageButton = ParentUnit:WaitForChild("Frame"):WaitForChild("Open_Close")
		Open2.Visible = true
		local co = coroutine.create(function()
			local Open:ImageButton = Unit:WaitForChild("Frame"):WaitForChild("Open_Close")
			local Frame2 = Unit:WaitForChild("ChildrenUnit")
			Open.Visible = false
			Open.MouseButton1Down:Connect(function()
				print("sb")
			Frame2.Visible = not Frame2.Visible
			if Frame2.Visible then
				Open.Rotation = 90
			else
				Open.Rotation = 0
				end
			end)
		end)
		coroutine.resume(co)
		Mouse(Unit)
		local function AddTreeNode(Tree,Name,name2)
			for a,b in pairs(Tree) do
				if a ~= Name and type(b) == "table" then
					AddTreeNode(b,Name,name2)
				else
					b[name2] = {}
					return 
				end
			end
		end
		AddTreeNode(self.Tree,ParentUnit.Name,Name)
		return Unit
	end
	
	
return Class
