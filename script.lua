-- Load the Custom Modifiers module
local CustomModifiers = loadstring(game:HttpGet('https://raw.githubusercontent.com/iimateiYT/Custom-Modifiers/main/Source.lua'))()

-- Check if the module was loaded
if not CustomModifiers then
    warn("Custom Modifiers module failed to load.")
    return
end

-- Optional: Toggle connotations for debug messages (if needed)
CustomModifiers:ToggleConnotations(true)

-- Create a floor for the modifiers
CustomModifiers:CreateFloor({
    Title = "The Hotel", -- Floor name
    Destination = "Hotel", -- Destination of where the elevator should lead to (Hotel, Mines, Backdoor)
    Image = "rbxassetid://18992618548", -- Background image for the floor
    Font = Enum.Font.Oswald, -- Font text for the floor text
    FontColor = Color3.fromRGB(255, 222, 189), -- Font color for the floor text
    Theme = Color3.fromRGB(252, 219, 187), -- The stroke and arrow color at the floor picker
    Sort = 1, -- Sorting order for the floor
    Requires = {
        NeedAll = false, -- If it needs all the achievements below
        Achievements = { -- Achievements required to unlock the floor
            "Join", 
            "SpecialQATester"
        }
    },
    Moddable = true -- Makes modifiers visible for the floor
})

-- Create a category for the modifier
CustomModifiers:CreateCategory({
    Title = "Weird modded modifiers", -- Category name
    Sort = 0, -- Category sort order
    Floor = "Hotel", -- Category floor
    Color = Color3.fromRGB(255, 222, 189) -- Category color
})

-- Create the Time Warp modifier
CustomModifiers:CreateModifier({
    Title = "Time Warp", -- Modifier name
    Desc = "Slow down or speed up time for everyone in the game.", -- Modifier description
    Color = Color3.fromRGB(0, 191, 255), -- Modifier color
    Category = "Example Category", -- Modifier category
    Sort = 3, -- Modifier sort order
    Merge = "Combine", -- Combine modifiers option
    Bonus = 0, -- Modifier knob bonus
    Solo = false, -- Whether it's the only selectable modifier
    Penalties = {
        NoRift = false, -- Rift display
        NoProgress = true -- Progress display
    },
    Unlock = "Join", -- Achievement needed to activate the modifier
    Activation = [[ -- Custom code to execute after the loading screen
        local RunService = game:GetService("RunService")
        local Players = game:GetService("Players")
        
        local timeScale = 0.5 -- Adjust this value as needed
        RunService.Stepped:Connect(function(_, deltaTime)
            for _, player in pairs(Players:GetPlayers()) do
                if player.Character and player.Character:FindFirstChild("Humanoid") then
                    player.Character.Humanoid.WalkSpeed = 16 * timeScale
                end
            end
        end)
    ]]
})
