local player = game:service'Players'.LocalPlayer
local character = player.Character or  player.CharacterAdded:Wait()
local mouse = player:GetMouse()
local UIS = game:service'UserInputService'
local screenGui = player.PlayerGui:WaitForChild('ScreenGui')
local textLabel = screenGui:WaitForChild('TextLabel')
local light = Instance.new('SpotLight', character.Head)
local jeff = game:service'Workspace':WaitForChild('j'):WaitForChild('Jeff.')
local tminion = game:service'Workspace'['POOPOO minion'].Model.Torso.Head
light.Brightness = 5
light.Range = 5
light.Enabled = false
_G.Flashlight = false
_G.LightEnabled = false
_G.Bathroom = false
_G.jeffDisabled = true
_G.minion = false
local inputBegan = function(input)
	if input.KeyCode == Enum.KeyCode.F then
		if mouse.Target ~= nil then
			if mouse.Target:FindFirstChild('interact') ~= nil then
				local inter = require(mouse.Target.interact)
				print('Hello')
				inter.Interact()
			end
		end
	elseif input.KeyCode == Enum.KeyCode.G then
		if _G.Flashlight then
			_G.LightEnabled = not _G.LightEnabled
			light.Enabled = _G.LightEnabled
		end
	end
end

game:service'RunService'.RenderStepped:Connect(function()
	
	
	if _G.jeffDisabled then
		local ray = Ray.new(character.Head.Position, game:service'Workspace'.Camera.CFrame.LookVector)
		local part, position = workspace:FindPartOnRay(ray)
		if part ~= nil then
			print(part)
			if part.Name == 'jeft' then
				_G.jeffDisabled = false
				jeff.JeffTheKillerMain.Disabled = false
				game:service'SoundService':WaitForChild('JumpScare1'):Play()
				game:service'SoundService':WaitForChild('Scary'):Play()
				
				player.PlayerGui:WaitForChild('Objective'):WaitForChild('Frame'):WaitForChild('TextLabel').Text = 'OMG monster? You know it is kil if you touch monster. Escape home!!!'
			end
		end
	end
	
	if _G.minion then
		game:service'Workspace'['POOPOO minion'].Model.Torso.Head.CFrame = CFrame.new(tminion.Position, character.Torso.Position)
	end
	
	player.PlayerGui.ScreenGui.TextLabel.Position = UDim2.new(0, mouse.X + 100, 0, mouse.Y)
	
	if mouse.Target ~= nil then
		if mouse.Target:FindFirstChild('interact') ~= nil then
			player.PlayerGui.SelectionBox.Adornee = mouse.Target
			local inter = require(mouse.Target.interact)
			
			textLabel.Text = '[F] '..inter.Tip
		else
			player.PlayerGui.SelectionBox.Adornee = nil
			textLabel.Text = ''
		end
	else
		player.PlayerGui.SelectionBox.Adornee = nil
		textLabel.Text = ''
	end
end)



UIS.InputBegan:Connect(inputBegan)
