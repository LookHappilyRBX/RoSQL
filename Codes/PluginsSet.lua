local PluginsModule = require(script.Parent:WaitForChild("Plugin_Class"))
local GUIModule =require(script.Parent:WaitForChild("GUI_Class"))
local RoSQL = plugin:CreateToolbar("RoSQL")
local plugin = plugin or getfenv().PluginManager():CreatePlugin()
local Obj = PluginsModule.new("RoSQL",RoSQL)	
local newAction = PluginsModule.newShortcuts(Obj,math.random(1,10000),"Rosql-Add","Add a Folder Type like WorkSpace or Tables if you want to add a DB so click New , the button also isn't add ")
local newAction = PluginsModule.newShortcuts(Obj,math.random(1,10000),"Rosql-New","New a DB and isn't add so look it right ")
local TweenS = game:GetService("TweenService")
Obj.ID = "RoSQLMenu"
local Toolbar = Obj.Toolbar
local control = Obj.CreateButton(Obj,"Studio","rbxassetid://18999823728","View and use functions")		
local Settings = Obj.CreateButton(Obj,"Settings","rbxassetid://18999836825","Set Settings for RoSQL")
local GUIParts = script.Parent:WaitForChild("GUIPart")
local SQLMenuGUI = GUIParts:WaitForChild("SQLGUI"):Clone()
local Select_Class = require(script.Parent:WaitForChild("Select_Class"))
local DataStore = game:GetService("DataStoreService")
local StudioService = game:GetService("StudioService")
local Players = game:GetService("Players")
local Group = game:GetService("GroupService")
local RoSQLUserIDTables = DataStore:GetDataStore("RoSQL") 


local Menu_Class = require(script.Parent:WaitForChild("Menu_Class"))
local SQLGUI = GUIModule.new(Obj,SQLMenuGUI)
SQLGUI.Name = "RoSQL-Control"
SQLGUI.Title ="RoSQL-Control"
SQLGUI.X = 900
SQLGUI.Y = 600
SQLGUI.MinY = 900
SQLGUI.MinX = 1000
local Eunms = require(script:WaitForChild("EunmsLibrary"))
local SQLGUISET = SQLGUI.Show(SQLGUI)
local Object_Manager_Class = require(script.Parent:WaitForChild("Actor"):WaitForChild("Object_Manager_Class"))
local Obj_Unit = GUIParts:WaitForChild("ObjUnit") 
local Obj_Frame = SQLGUI.GUI:WaitForChild("Function"):WaitForChild("Main_Part"):WaitForChild("Object Manager"):WaitForChild("Object_resource_area")
local Manager = Object_Manager_Class.newManager(Obj_Frame,Obj_Unit)

local TheGameObj = Object_Manager_Class.newRoot(Manager,Eunms.Obj_Type.Game,tostring(game.GameId).."/Game")
local GlobalDataBase = Object_Manager_Class.newChildrenForRoot(Manager,TheGameObj,"GlobalData",Eunms.Obj_Type.Folder,1)
local SecurityFolder = Object_Manager_Class.newChildrenForRoot(Manager,TheGameObj,"Security",Eunms.Obj_Type.Folder,4)
local PlaceDataBase = Object_Manager_Class.newChildrenForRoot(Manager,TheGameObj,game.PlaceId.."/".."PlaceData",Eunms.Obj_Type.Place,3)
local DBPlace = Object_Manager_Class.newNode(Manager,PlaceDataBase,Eunms.Obj_Type.Folder,"AllDataBase") 
local UserFolder = Object_Manager_Class.newNode(Manager,SecurityFolder,Eunms.Obj_Type.Folder,"User") 
local RoleFolder = Object_Manager_Class.newNode(Manager,SecurityFolder,Eunms.Obj_Type.Folder,"Role") 
local EveryoneRole = Object_Manager_Class.newNode(Manager,RoleFolder,Eunms.Obj_Type.Role,"Everyone",1) 
local OwnerRole = Object_Manager_Class.newNode(Manager,RoleFolder,Eunms.Obj_Type.Role,"Owner",2) 
local AdministratorsRole = Object_Manager_Class.newNode(Manager,RoleFolder,Eunms.Obj_Type.Role,"Administrators",3) 
local StaffsRole = Object_Manager_Class.newNode(Manager,RoleFolder,Eunms.Obj_Type.Role,"Staffs",4) 
local BanUserRole = Object_Manager_Class.newNode(Manager,RoleFolder,Eunms.Obj_Type.Role,"BanUser",5) 
local NoPermissionRole = Object_Manager_Class.newNode(Manager,RoleFolder,Eunms.Obj_Type.Role,"NoPermission",6) 


local User = Players:GetPlayers()
for a,b in ipairs(User) do
	if game.CreatorType == Enum.CreatorType.User then
		if b:IsA("Player") and b.UserId ~= game.CreatorId then
			local UserPlayer = Object_Manager_Class.newNode(Manager,UserFolder,Eunms.Obj_Type.User,b.Name) 
		else
			local Owner = Object_Manager_Class.newNode(Manager,UserFolder,Eunms.Obj_Type.Owner,b.Name) 
		end
	else
		local GroupInfo = Group:GetGroupInfoAsync(game.CreatorId)
		local OwnerID =  GroupInfo["Owner"]["Id"]

			if b.UserId == OwnerID then
			local OwnerUser = Object_Manager_Class.newNode(Manager,UserFolder,Eunms.Obj_Type.Owner,GroupInfo["Owner"]["Name"],1)
			end
			if b.UserId ~= OwnerID then
				local UserPlayer = Object_Manager_Class.newNode(Manager,UserFolder,Eunms.Obj_Type.User,b.Name,2) 
			end
	end
end


local BanDBPlace = Object_Manager_Class.newChildrenForRoot(Manager,TheGameObj,"BanData",Eunms.Obj_Type.BanData,2)
local UserInput = game:GetService("UserInputService")
local TopBar = SQLMenuGUI:WaitForChild("TopBar"):WaitForChild("Units")
local Top_bar_Unit = GUIParts:WaitForChild("TopBarUnit")
local SelectTopBar = Select_Class.new(TopBar,Top_bar_Unit)
local FileButton = Select_Class.newButton(SelectTopBar,"File",1) 
local EditButton = Select_Class.newButton(SelectTopBar,"Edit",1) 
local ModuleButton = Select_Class.newButton(SelectTopBar,"Module",1) 
local ToolsButton = Select_Class.newButton(SelectTopBar,"Tools",1) 
local HelpButton = Select_Class.newButton(SelectTopBar,"Help",1)
local MenuUnit = GUIParts:WaitForChild("MenuUnit")
local FileMenu = GUIParts:WaitForChild("Menu"):Clone()
local ClassMenuFile = Menu_Class.new(FileMenu,MenuUnit)
local Settings_File = ClassMenuFile.newButton(ClassMenuFile,"Setting")
Settings_File.LayoutOrder = 10
local Add_File = ClassMenuFile.newButton(ClassMenuFile,"Add","CanSetShortcut")
local NewWindow_File = ClassMenuFile.newButton(ClassMenuFile,"NewWindow","CanSetShortcut")
local Open_File = ClassMenuFile.newButton(ClassMenuFile,"Open")
local Save_File = ClassMenuFile.newButton(ClassMenuFile,"Save")
local Restore_File = ClassMenuFile.newButton(ClassMenuFile,"Restore")
local Redo_File = ClassMenuFile.newButton(ClassMenuFile,"Redo")
local Project_bar = SQLGUI.GUI:WaitForChild("Function"):WaitForChild("Project_bar")
local Project_bar_uNIT = GUIParts:WaitForChild("MainFunUnit") 
local MainSelect = Select_Class.new(Project_bar,Project_bar_uNIT)
local Main = Select_Class.newButton(MainSelect,"Main",1)
local Survey = Select_Class.newButton(MainSelect,"Survey",1)
local Security = Select_Class.newButton(MainSelect,"Security",1)
local function MainButton(Button,Text,Id)
	Button:WaitForChild("TextLabel").Text = Text
	Button:WaitForChild("Icon").Image = Id or Button:WaitForChild("Icon").Image 
end
MainButton(Main,"Main","rbxassetid://94135994269041")
MainButton(Survey,"Survey","rbxassetid://138779349868566")
MainButton(Security,"Security","rbxassetid://84120403526332")
ClassMenuFile.Menu.Parent = FileButton



local function MouseEnter_MenuTopBar(Frame,InputColor,Color,IsTextColor,Transparency,Transparency2)
	for a,b:TextButton in pairs(Frame:GetChildren()) do
		if b:IsA("TextButton") then
			b.MouseEnter:Connect(function()
				if not IsTextColor then
				b.BackgroundColor3 = InputColor or Color3.new(0.862745, 0.862745, 0.862745)
				b.BackgroundTransparency = Transparency or 0
				else
					b.TextColor3 = InputColor or Color3.new(1, 1, 1)
				end
			end)
			b.MouseLeave:Connect(function()
				if not IsTextColor then
				b.BackgroundColor3 = Color or Color3.new(1, 1, 1)
				b.BackgroundTransparency = Transparency2 or 0
				else
					b.TextColor3 = Color or Color3.new(0.866667, 0.866667, 0.866667)
				end
			end)
		end
	end
end


local AddButton_UI = SQLGUI.GUI:WaitForChild("Function"):WaitForChild("Main_Part"):WaitForChild("Object Manager"):WaitForChild("Control_bar"):WaitForChild("FolderAdd")
local AddButton = {
	Add_File,AddButton_UI
}
local SelctFrame = Eunms.SelectUI.Frame:Clone()
SelctFrame.Parent = SQLGUI.GUI
local SelctUi = Select_Class.new(SelctFrame,Eunms.SelectUI.Unit,true,SelctFrame:WaitForChild("SelectObjFrame"))
SelctUi.Frame.Visible = false
local Folder = Select_Class.newButton(SelctUi,"",0)
Folder:WaitForChild("ImageLabel").Image = Eunms.Obj_Type.Folder.ImageID
Folder:WaitForChild("TextLabel").Text = Eunms.Obj_Type.Folder.Name


local function SelcMenu(Button,Eunms,fun)
	Button.MouseButton1Down:Connect(function(x,y)
		Object_Manager_Class.newObj(Manager,Eunms)
		return fun(x,y)
	end)
end

SelcMenu(Folder,Eunms.Obj_Type.Folder,function()
	
end)

for a,b in pairs(AddButton) do
	Link = b.MouseButton1Down:Connect(function(x,y)
		local Mouse:PluginMouse = Obj.Mouse
		print(Mouse.X,Mouse.Y)
		SelctUi.Frame.Position = UDim2.new(0,x,0,y)
		SelctUi.Frame.Visible = not SelctUi.Frame.Visible
		SelctUi.Frame:WaitForChild("ImageButton").MouseButton1Down:Connect(function()
			SelctUi.Frame.Visible = false
		end)
	end)
end



MouseEnter_MenuTopBar(ClassMenuFile.Menu)
MouseEnter_MenuTopBar(SelectTopBar.Frame,Color3.new(0, 0.733333, 1),Color3.new(0, 0, 0),true)

FileButton.MouseButton1Down:Connect(function()
	ClassMenuFile.Menu.Size = UDim2.new(2.223, 0,0, 0)
	ClassMenuFile.Menu.Visible = not ClassMenuFile.Menu.Visible
	local TweenInfoAnimation = TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out)
	if ClassMenuFile.Menu.Visible == true then
		local UpTwen = TweenS:Create(ClassMenuFile.Menu,TweenInfoAnimation,{ Size = UDim2.new(2.223, 0,0.959, 0) }) 
		UpTwen:Play()
	elseif ClassMenuFile.Menu.Visible == false then
		local DownTwen = TweenS:Create(ClassMenuFile.Menu,TweenInfoAnimation,{ Size = UDim2.new(2.223, 0,0, 0) }) 
		DownTwen:Play()
		task.wait(0.5)
	end
end)

local IsDowning = {}
SQLMenuGUI:Clone().Parent = game.StarterGui

control.Click(control,function()
	SQLGUISET.Enabled = not SQLGUISET.Enabled
end)




















