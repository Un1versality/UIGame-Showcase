--// ROBLOX FRAMEWORK SETUP
local UIGFRMW = require(game:GetService("ReplicatedStorage"):WaitForChild("UIGameFramework"):FindFirstChild("UIGFRMW"))

--// SERVICES
local PlayerService = UIGFRMW.req("PlayerService")
local CollisionService = UIGFRMW.req("CollisionService")
local TerrainService = UIGFRMW.req("TerrainService")
local UserInputService = game:GetService("UserInputService")
local EnemyService = UIGFRMW.req("EnemyService")
local StructuresService = UIGFRMW.req("StructuresService")

--// MODULES
local JumpModule = UIGFRMW.req("Jump")

--// PLAYER INFO
local Player = PlayerService.Player()
local HoldingW = false
local HoldingS = false
local Jumping = false

--// COLLISIONS
local GameCollisionGroup = CollisionService.createCollisionGroup()
local EnemyCollisionGroup = CollisionService.createCollisionGroup()
local StructureCollisionGroup = CollisionService.createCollisionGroup()
local GameHitter = Player
local TerrainColliders = TerrainService.GetTerrain()
local EnemyColliders = EnemyService.GetEnemies()
local StructureColliders = StructuresService.GetStructures()

local GameHitterCollision = GameCollisionGroup:addCollider(GameHitter,true)
for index,terrain_collider in ipairs(TerrainColliders) do
	GameCollisionGroup:addCollider(terrain_collider,true)
end
for index,enemy in ipairs(EnemyColliders) do
	EnemyCollisionGroup:addCollider(enemy,true)
end
for index,structure in ipairs(EnemyColliders) do
	StructureCollisionGroup:addCollider(structure,true)
end

--// UIS
UserInputService.InputBegan:Connect(function(Input,gameProcessed)
	
	if Player:FindFirstChild("Humanoid").PlayerHealth.Value <= 0 then
		return
	end
	
	if Input.KeyCode == Enum.KeyCode.W then
		HoldingW = true
	elseif Input.KeyCode == Enum.KeyCode.S then
		HoldingS = true
	elseif Input.KeyCode == Enum.KeyCode.Space and Jumping == false then
		local Jump1 = JumpModule.JumpUp(GameHitter)
		Jumping = true
		if Jump1 == false then
			repeat
				wait()
			until Jump1 == true
		end
		local Jump2 = JumpModule.JumpDown(GameHitter, TerrainColliders, GameCollisionGroup)
		if Jump2 ~= true and Jump2 ~= nil then
			repeat
				wait()
			until Jump2 == true or Jump2 == nil
		end
		Jumping = false
	end
end)

UserInputService.InputEnded:Connect(function(Input,gameProcessed)
	if Input.KeyCode == Enum.KeyCode.W then
		HoldingW = false
	elseif Input.KeyCode == Enum.KeyCode.S then
		HoldingS = false
	end
end)

--// LOOP(s)

--// WALKING
coroutine.wrap(function()
	while true do
		wait()
		if Player:FindFirstChild("Humanoid").PlayerHealth.Value <= 0 then
			return
		end
		if HoldingW then
			GameHitter.Position += UDim2.new(0,9,0,0)
		end
		if not HoldingW then
			
		end
		
		if HoldingS then
			GameHitter.Position -= UDim2.new(0,9,0,0)
		end
		if not HoldingS then
			
		end
		
	end
end)()

--// TERRAIN COLLIDERS (INSIDE TERRAIN)
coroutine.wrap(function()
	while true do
		wait()
		--if not Jumping then
			for index,terrain_collider in ipairs(TerrainColliders) do
				if GameCollisionGroup.isColliding(GameHitter,terrain_collider) == true then
					repeat
						GameHitter.Position += UDim2.new(0,0,0,-2)
					until GameCollisionGroup.isColliding(GameHitter,terrain_collider) == false
				end
			end
		end
	--end
end)()

--// STRUCTURE COLLIDERS
coroutine.wrap(function()
	while true do
		wait()
		--if not Jumping then
		for index,structure_collider in ipairs(StructureColliders) do
			if GameCollisionGroup.isColliding(GameHitter,structure_collider) == true and structure_collider:FindFirstChild("Behind").Value == false then
				repeat
					GameHitter.Position += UDim2.new(0,0,0,-2)
				until GameCollisionGroup.isColliding(GameHitter,structure_collider) == false
			end
		end
	end
	--end
end)()

--// PREVENT GOING THROUGH ENEMIES
coroutine.wrap(function()
	while true do
		wait()
		--if not Jumping then
		for index,enemy in ipairs(EnemyColliders) do
			if GameCollisionGroup.isColliding(GameHitter,enemy) == true then
				repeat
					GameHitter.Position += UDim2.new(0,-2,0,0)
					if Player:FindFirstChild("Humanoid").PlayerHealth.Value >= 0.01 then
						Player:FindFirstChild("Humanoid").PlayerHealth.Value -= 25
					end
				until GameCollisionGroup.isColliding(GameHitter,enemy) == false
			end
		end
	end
	--end
end)()

--// ENEMY COLLIDERS
coroutine.wrap(function()
	while true do
		wait()
		
		for index,enemy in ipairs(EnemyColliders) do
			if GameCollisionGroup.isColliding(GameHitter,enemy) == false then
				repeat
					wait()
				until GameCollisionGroup.isColliding(GameHitter,enemy) == true
				if Player:FindFirstChild("Humanoid").PlayerHealth.Value >= 0.01 then
					Player:FindFirstChild("Humanoid").PlayerHealth.Value -= 25
				end
			end
		end
	end
end)()

Player:FindFirstChild("Humanoid").PlayerHealth.Changed:Connect(function(NewValue)
	if Player:FindFirstChild("Humanoid").PlayerHealth.Value < 0 then
		Player:FindFirstChild("Humanoid").PlayerHealth.Value = 0
	end
	if NewValue <= 0 then
		game:GetService("TweenService"):Create(GameHitter,TweenInfo.new(1),{BackgroundColor3 = Color3.fromRGB(15, 15, 15)}):Play()
	end
end)
