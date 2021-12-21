local Tool = script.Parent

local Mouse = game.Players.LocalPlayer:GetMouse()

Mouse.Button1Down:Connect(function()
	if Mouse.Target ~= nil then
		local ex = Instance.new('Explosion', Mouse.Target)
		ex.BlastRadius = 5
		ex.ExplosionType = Enum.ExplosionType.NoCraters
		ex.Position = ex.Parent.Position
		if Mouse.Target.Parent.Parent.Parent.Name == 'POOPOO minion' then
			game:service'Workspace'['POOPOO minion'].Model.Torso.Humanoid.Health = game:service'Workspace'['POOPOO minion'].Model.Torso.Humanoid.Health - math.random(1, 3) 
		end
	end
end)
