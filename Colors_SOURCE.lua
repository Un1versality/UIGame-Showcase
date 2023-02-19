--// ROBLOX FRAMEWORK SETUP
local UIGFRMW = require(game:GetService("ReplicatedStorage"):WaitForChild("UIGameFramework"):FindFirstChild("UIGFRMW"))
local GameBase = script.Parent.Parent.Parent.GameBase

--// SERVICES
local PlayerService = UIGFRMW.req("PlayerService")
local CollisionService = UIGFRMW.req("CollisionService")
local TerrainService = UIGFRMW.req("TerrainService")
local UserInputService = game:GetService("UserInputService")
local GUIService = GameBase:FindFirstChild("GameGUIService")

--// PLAYER INFO
local Player = PlayerService.Player()

--// CHANGING
GUIService.Yellow.MouseButton1Down:Connect(function()
	Player.BackgroundColor3 = Color3.fromRGB(255, 248, 39)
end)

GUIService.Red.MouseButton1Down:Connect(function()
	Player.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
end)
