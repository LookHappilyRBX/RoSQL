local Select_Class = {}
Select_Class.__index = 	Select_Class
	function Select_Class.new(Frame,button,YestoFrame2,Frame2)	
		local self = {}
		setmetatable(self,Select_Class)
		self.Frame = Frame 
		self.Frame2 = Frame2 or nil
		self.Button = button
		self.YestoFrame2 = YestoFrame2 or false
		return self
	end
	
function Select_Class.newButton(self,Text,Transparency,ImageID)
		local Frame = self.Frame
		local Button:ImageButton = self.Button:Clone()
		Transparency = Transparency or 0
		Button.BackgroundTransparency = Transparency
		if not self.YestoFrame2 then
			Button.Parent = Frame
		elseif self.YestoFrame2 then
			Button.Parent = self.Frame2
		end		
		Button.Name = Text
		if Button:IsA("ImageButton") then
		Button.Image = Button.Image or ImageID
		else
			print(Button.Text)
			Button.Text = Text
		end
		return Button
	end
	
return Select_Class

