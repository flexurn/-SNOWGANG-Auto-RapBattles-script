-- if Method == 'FireServer' then

local L_1 = Instance.new("ScreenGui")
local L_2 = Instance.new("Frame")
local L_4 = Instance.new("TextButton")
local L_3 = Instance.new("TextButton")
local L_5 = Instance.new("TextButton")

L_1.Name = "L_1"
L_1.Parent = game.CoreGui

local function Notify(title, text, icon, time) game.StarterGui:SetCore("SendNotification",{Title = title;Text = text;Icon = icon;Duration = time;}) end

L_2.Name = "L_2"
L_2.Parent = L_1
L_2.BackgroundColor3 = Color3.fromRGB(255, 19, 42)
L_2.BackgroundTransparency = 0.300
L_2.Position = UDim2.new(0.294154614, 0, 0.162097737, 0)
L_2.Size = UDim2.new(0, 469, 0, 245)
L_2.Active = true
L_2.Draggable = true

L_3.Name = "L_3"
L_3.Parent = L_2
L_3.BackgroundColor3 = Color3.fromRGB(255, 19, 42)
L_3.BackgroundTransparency = 0.300
L_3.Position = UDim2.new(0.35394457, 0, 0.0530612245, 0)
L_3.Size = UDim2.new(0, 137, 0, 19)
L_3.Font = Enum.Font.SourceSans
L_3.Text = "Fling"
L_3.TextColor3 = Color3.fromRGB(0, 0, 0)
L_3.TextSize = 14.000

L_4.Name = "L_4"
L_4.Parent = L_2
L_4.BackgroundColor3 = Color3.fromRGB(255, 19, 42)
L_4.BackgroundTransparency = 0.300
L_4.Position = UDim2.new(0.0234541576, 0, 0.0530612282, 0)
L_4.Size = UDim2.new(0, 137, 0, 19)
L_4.Font = Enum.Font.SourceSans
L_4.Text = "VoteSpam"
L_4.TextColor3 = Color3.fromRGB(0, 0, 0)
L_4.TextSize = 14.000

L_5.Name = "L_5"
L_5.Parent = L_2
L_5.BackgroundColor3 = Color3.fromRGB(255, 19, 42)
L_5.BackgroundTransparency = 0.300
L_5.Position = UDim2.new(0.678038359, 0, 0.0530612245, 0)
L_5.Size = UDim2.new(0, 137, 0, 19)
L_5.Font = Enum.Font.SourceSans
L_5.Text = "AutoSpam"
L_5.TextColor3 = Color3.fromRGB(0, 0, 0)
L_5.TextSize = 14.000

L_3.MouseButton1Down:connect(function()
	local ch = game.Players.LocalPlayer.Character
	local prt=Instance.new("Model", workspace)
	local z1 =  Instance.new("Part", prt)
	z1.Name="Torso"
	z1.CanCollide = false
	z1.Anchored = true
	local z2  =Instance.new("Part", prt)
	z2.Name="Head"
	z2.Anchored = true
	z2.CanCollide = false
	local z3 =Instance.new("Humanoid", prt)
	z3.Name="Humanoid"
	z1.Position = Vector3.new(0,9999,0)
	z2.Position = Vector3.new(0,9991,0)
	game.Players.LocalPlayer.Character=prt
	wait(5)
	game.Players.LocalPlayer.Character=ch
	wait(6)


	local plr = game.Players.LocalPlayer
	mouse = plr:GetMouse()

	local Hum = Instance.new("Humanoid")
	Hum.Parent = game.Players.LocalPlayer.Character


	local root =  game.Players.LocalPlayer.Character.HumanoidRootPart


	for i,v in pairs(plr.Character:GetChildren()) do

		if v ~= root and  v.Name ~= "Humanoid" then

			v:Destroy()

		end


	end
	-- improved this bitch ass fling
	workspace.CurrentCamera.CameraSubject = root

	local se = Instance.new("SelectionBox",root)
	se.Adornee = root


	game:GetService('RunService').Stepped:connect(function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CanCollide = false
	end)
	game:GetService('RunService').RenderStepped:connect(function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CanCollide = false
	end)


	power = 999999

	power = power*10

	---
	wait(.1)
	local flacreset = Instance.new("BodyThrust")
	flacreset.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
	flacreset.Force = Vector3.new(power,0,power)
	flacreset.Location = game.Players.LocalPlayer.Character.HumanoidRootPart.Position 




	local plr = game.Players.LocalPlayer
	local torso = root
	local flying = true
	local deb = true
	local ctrl = {f = 0, b = 0, l = 0, r = 0}
	local lastctrl = {f = 0, b = 0, l = 0, r = 0}
	local maxspeed = 120
	local speed = 15

	groot = root

	function Fly()
		local bg = Instance.new("BodyGyro", torso)
		bg.P = 9e4
		bg.maxTorque = Vector3.new(0, 0, 0)
		bg.cframe = torso.CFrame
		local bv = Instance.new("BodyVelocity", torso)
		bv.velocity = Vector3.new(0,0,0)
		bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
		repeat wait()

			if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
				speed = speed+.2
				if speed > maxspeed then
					speed = maxspeed
				end
			elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
				speed = speed-1
				if speed < 0 then
					speed = 0
				end
			end
			if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
				bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
				lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
			elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
				bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
			else
				bv.velocity = Vector3.new(0,0.1,0)
			end

		until not flying
		ctrl = {f = 0, b = 0, l = 0, r = 0}
		lastctrl = {f = 0, b = 0, l = 0, r = 0}
		speed = 0
		bg:Destroy()
		bv:Destroy()

	end
	mouse.KeyDown:connect(function(key)
		if key:lower() == "e" then
			if flying then flying = false
			else
				flying = true
				Fly()
			end
		elseif key:lower() == "w" then
			ctrl.f = 1
		elseif key:lower() == "s" then
			ctrl.b = -1
		elseif key:lower() == "a" then
			ctrl.l = -1
		elseif key:lower() == "d" then
			ctrl.r = 1
		end
	end)
	mouse.KeyUp:connect(function(key)
		if key:lower() == "w" then
			ctrl.f = 0
		elseif key:lower() == "s" then
			ctrl.b = 0
		elseif key:lower() == "a" then
			ctrl.l = 0
		elseif key:lower() == "d" then
			ctrl.r = 0
		elseif key:lower() == "r" then

		end
	end)
	Fly()

	local ch = game.Players.LocalPlayer.Character
	local prt=Instance.new("Model", workspace)
	local z1 =  Instance.new("Part", prt)
	z1.Name="Torso"
	z1.CanCollide = false
	z1.Anchored = true
	local z2  =Instance.new("Part", prt)
	z2.Name="Head"
	z2.Anchored = true
	z2.CanCollide = false
	local z3 =Instance.new("Humanoid", prt)
	z3.Name="Humanoid"
	z1.Position = Vector3.new(0,9999,0)
	z2.Position = Vector3.new(0,9991,0)
	game.Players.LocalPlayer.Character=prt
	wait(5)
	game.Players.LocalPlayer.Character=ch
	local poop = nil
	repeat wait() poop = game.Players.LocalPlayer.Character:FindFirstChild("Head") until poop ~= nil
	wait(1)
	game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(saved)
end)

L_4.MouseButton1Down:connect(function()
	local L_1 = Instance.new("ScreenGui")
	local L_3 = Instance.new("TextButton")
	local L_2 = Instance.new("TextButton")

	L_1.Name = "L_1"
	L_1.Parent = game.CoreGui

	L_2.Name = "L_2"
	L_2.Parent = L_1
	L_2.BackgroundColor3 = Color3.fromRGB(255, 19, 42)
	L_2.BackgroundTransparency = 0.300
	L_2.Position = UDim2.new(0.908517301, 0, 0.949940503, 0)
	L_2.Size = UDim2.new(0, 162, 0, 20)
	L_2.Font = Enum.Font.SourceSans
	L_2.Text = "flacresetlabel"
	L_2.TextColor3 = Color3.fromRGB(0, 0, 0)
	L_2.TextSize = 14.000


	L_3.Name = "L_3"
	L_3.Parent = L_1
	L_3.BackgroundColor3 = Color3.fromRGB(255, 19, 42)
	L_3.BackgroundTransparency = 0.300
	L_3.Position = UDim2.new(0.816952109, 0, 0.949940443, 0)
	L_3.Size = UDim2.new(0, 162, 0, 20)
	L_3.Font = Enum.Font.SourceSans
	L_3.Text = "flacreselabel"
	L_3.TextColor3 = Color3.fromRGB(0, 0, 0)
	L_3.TextSize = 14.000

	L_2.MouseButton1Down:connect(function()
		for i = 0,1 do 
			game.Workspace.Votes:FireServer(false,"p1")
			game:GetService("RunService").Heartbeat:Wait()
		end
	end)

	L_3.MouseButton1Down:connect(function()
		for i = 0,1 do 
			game.Workspace.Votes:FireServer(false,"p2")
			game:GetService("RunService").Heartbeat:Wait()
		end
	end)

	while true do
		L_2.Text = game.Workspace.RapBattles.Rappers.player2.Value
		L_3.Text = game.Workspace.RapBattles.Rappers.player1.Value
		wait(0.1)
	end
end)

L_5.MouseButton1Down:connect(function()
	game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer('I be a savage, uh',"All")
	wait(19)
	game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer('I don’t mess with people who are so average, uh', "All")
	wait(20)
	game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("My girl a bad girl, uh", "All")
	wait(50)
	game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Saying she not in love with all my habits, uh", "All")
	wait(20)
	game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Stay with the poke like cactus, uh", "All")
	wait(17)
	game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Stay with the dreams like mattress, uh", "All")
end)
Notify("Bloody X", "Revamped This Script! 9/4/2021 3:55 AM", "rbxassetid://7358667291", 5)
