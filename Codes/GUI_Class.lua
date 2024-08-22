local ShowGUIObj = {}
ShowGUIObj.__index = ShowGUIObj
	function ShowGUIObj.new(Obj,GUI)
		local self = {}
		self.GUI = self.GUI or GUI
		self.Obj = Obj
		self.Name = math.random(1,10000)
		self.Title = ""
		self.ButtonObj = nil
		self.ToolBarObj = nil
		self.MinX = ""
		self.MinY = ""
		self.X = ""
		self.Y = ""
		self.KeepBeforebehavior = true
		setmetatable(self,ShowGUIObj)
		return self
	end
	
	function ShowGUIObj.Show(self)
	local info = DockWidgetPluginGuiInfo.new(
		Enum.InitialDockState.Float,
		self.KeepBeforebehavior,
		false,
		self.X,self.Y,
		self.MinX,self.MinY
	)
		self.ScreenGUI = self.Obj.plugin:CreateDockWidgetPluginGui(self.Name,info)
		self.ScreenGUI.Title = self.Title
		self.ScreenGUI.Enabled = false
		print(self)
		self.GUI.Parent = self.ScreenGUI
		return self.ScreenGUI
	end
	
return ShowGUIObj
