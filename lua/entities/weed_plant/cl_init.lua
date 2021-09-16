include('shared.lua')

local color_white = Color(255, 255, 255)
local color_black = Color(0, 0, 0)

function ENT:Draw()
	self.Entity:DrawModel()
	
	local pos = self:GetPos()
	local ang = self:GetAngles()
	local distance = pos:Distance(LocalPlayer():GetPos())
	
	if distance > 400 then return end
	color_white.a = 400 - distance
	color_black.a = 400 - distance

	ang:RotateAroundAxis(ang:Up(), 90)
	ang:RotateAroundAxis(ang:Forward(), 90)
	cam.Start3D2D(self:GetPos() + ang:Right() * -50, ang, 0.1)
		draw.SimpleTextOutlined(self:GetStage() == 0 and "Plant pot" or self:GetStage() == 8 and "Ready to harvest!" or "Growing...", "GModToolName", 0, 0, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 1, color_black)
	cam.End3D2D()	

	ang:RotateAroundAxis(ang:Up(), 180)
	ang:RotateAroundAxis(ang:Forward(), 180)
	cam.Start3D2D(self:GetPos() + ang:Right() * -50, ang, 0.1)
		draw.SimpleTextOutlined(self:GetStage() == 0 and "Plant pot" or self:GetStage() == 8 and "Ready to harvest!" or "Growing...", "GModToolName", 0, 0, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 1, color_black)
	cam.End3D2D()	
end