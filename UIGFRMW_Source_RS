local module = {}

module.req = function(ServiceName)
	local Player = game.Players:FindFirstChildWhichIsA("Player")
	if Player then
		local GUI = Player:WaitForChild("PlayerGui"):FindFirstChild("GUI_Game")
		if GUI then
			local GameBase = GUI:WaitForChild("GameBase")
			local Project = GUI:WaitForChild("Project")
			--// Do Something
			for index,dll in pairs(Project:FindFirstChild("DLLs"):GetChildren()) do
				if dll then
					if dll:IsA("ModuleScript") then
						if dll.Name == ServiceName .. ".dll" then
							return require(dll)
						end
					end
				end
			end
		end
	end	
end

return module
