local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local LocalPlayer = Players.LocalPlayer
local VirtualUser = game:GetService("VirtualUser")


LocalPlayer.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)

local Window = Fluent:CreateWindow({
    Title = "KQHUB | SLAYERS 2",
    SubTitle = "by Fluent UI",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local Tabs = {
    Farming = Window:AddTab({ Title = "Farming", Icon = "swords" }),
    MultiFarm = Window:AddTab({ Title = "Multi Farm", Icon = "list-tree" }),
    Setting = Window:AddTab({ Title = "Setting", Icon = "settings" })
}


local TargetData = {
    ["Akazo"] = CFrame.new(-1120.5061, 1383.97339, -1760.20959, -0.230756849, 0, -0.973011434, 0, 1, 0, 0.973011434, 0, -0.230756849),
    ["Domae"] = CFrame.new(-257.8992, 1352.99988, -3451.61963, -0.162874728, -5.35437458e-11, -0.986646771, 6.56710103e-11, 1, -6.51093138e-11, 0.986646771, -7.53987497e-11, -0.162874728),
    ["Enru"] = CFrame.new(844.056091, 797.499939, 545.375244, -0.00281902542, -1.62700573e-08, -0.999996006, -1.25419453e-08, 1, -1.62347664e-08, 0.999996006, 1.24961286e-08, -0.00281902542),
    ["Flame Trainee"] = CFrame.new(-1131.32019, 1031.54871, 981.932556, 0.642139494, -2.66252886e-09, 0.766587794, 2.88887279e-08, 1, -2.07256932e-08, -0.766587794, 3.54545335e-08, 0.642139494),
    ["Giyen"] = CFrame.new(361.314819, 1020.85748, -89.3382797, -0.304015547, 0, -0.952667058, 0, 1, 0, 0.952667058, 0, -0.304015547),
    ["Gyorei"] = CFrame.new(2600.9104, 1091.49976, -760.792236, 0.999317408, -1.18944797e-07, 0.0369423144, 1.17316908e-07, 1, 4.62334064e-08, -0.0369423144, -4.18678887e-08, 0.999317408),
    ["Insect Trainee"] = CFrame.new(-1402.12939, 263.999939, 80.9826508, -0.612036645, 1.57179141e-08, 0.79082936, 5.13621288e-08, 1, 1.987482e-08, -0.79082936, 5.27827986e-08, -0.612036645),
    ["Nezura"] = CFrame.new(-1468.00073, 278.449402, 934.802063, -0.757893741, -5.55407524e-08, -0.652378023, -1.60012448e-08, 1, -6.65465549e-08, 0.652378023, -3.99963547e-08, -0.757893741),
    ["Obari"] = CFrame.new(770.661499, 1123.49951, -1045.72705, -0.331005096, 0, -0.943628907, 0, 1, 0, 0.943628907, 0, -0.331005096),
    ["Reaper"] = CFrame.new(88.3283234, 1045.49988, -567.289734, -0.318596631, 1.11831744e-08, 0.947890401, -3.47941906e-08, 1, -2.34926798e-08, -0.947890401, -4.04657676e-08, -0.318596631),
    ["Reaper Trainee Kuzan"] = CFrame.new(-1367.79602, 1367.24207, -3120.74805, 0.450653315, -0.00423643738, -0.892689109, 0.000126244966, 0.999989033, -0.00468191877, 0.892699182, 0.00199722499, 0.450648904),
    ["Rengu"] = CFrame.new(-725.892761, 967.499878, 842.490784, 0.956599414, 4.9355954e-08, -0.291406125, -4.55004958e-08, 1, 2.00071444e-08, 0.291406125, -5.87969895e-09, 0.956599414),
    ["Saneri"] = CFrame.new(-391.370575, 1095.99878, -416.499298, 0.998763442, 5.90060232e-08, 0.0497149602, -6.22307041e-08, 1, 6.33155324e-08, -0.0497149602, -6.63310331e-08, 0.998763442),
    ["Shinora"] = CFrame.new(-459.810089, 966.99762, -3.38472056, -0.480608225, 2.70692215e-08, 0.876935422, 1.05492937e-07, 1, 2.69478786e-08, -0.876935422, 1.05461865e-07, -0.480608225),
    ["Sound Trainee"] = CFrame.new(189.853607, 1351.50061, -2582.07544, 0.609708726, 0, 0.792625546, 0, 1, -0, -0.792625546, 0, 0.609708726),
    ["Stone Trainee"] = CFrame.new(2683.54468, 1075.81274, -560.090576, -0.739750147, -8.96212597e-08, 0.672881663, -2.4290594e-09, 1, 1.30519766e-07, -0.672881663, 9.49175458e-08, -0.739750147),
    ["Sumari"] = CFrame.new(449.549042, 1020.49994, -649.880798, 0.485769749, 8.28308799e-08, -0.874086797, -5.30132702e-08, 1, 6.5300874e-08, 0.874086797, 1.46170098e-08, 0.485769749),
    ["Tengai"] = CFrame.new(-133.73053, 1351.50061, -2631.66333, 0.805513799, -0, -0.59257704, 0, 1, -0, 0.59257704, 0, 0.805513799),
    ["Thunder Trainee"] = CFrame.new(2431.41089, 1075.85559, -552.079163, 0.694325686, 3.83623977e-08, 0.719660938, -6.56517969e-08, 1, 1.00343502e-08, -0.719660938, -5.42141372e-08, 0.694325686),
    ["Water Trainee Sabito"] = CFrame.new(807.656494, 1020.74243, 106.713966, 0.448417127, 0, -0.893824399, 0, 1, 0, 0.893824399, 0, 0.448417127),
    ["Wind Trainee"] = CFrame.new(-941.836365, 1383.50061, -2634.91138, -0.945233226, 0, 0.32639578, 0, 1, 0, -0.32639578, 0, -0.945233226),
    ["Yahari"] = CFrame.new(821.278137, 1021.70306, -641.791016, -0.625037193, 0, 0.780594945, 0, 1, 0, -0.780594945, 0, -0.625037193),
    ["Zentaro"] = CFrame.new(1294.90283, 823.499878, -1037.50879, 0.999598086, 1.787072e-08, 0.028349651, -1.79406108e-08, 1, 2.21098584e-09, -0.028349651, -2.71870726e-09, 0.999598086)
}

local sortedNames = {}
for name, _ in pairs(TargetData) do
    table.insert(sortedNames, name)
end
table.sort(sortedNames)

local function getTargetModel(targetName)
    local targetModel = nil
    pcall(function()
        local activeNpcs = Workspace:FindFirstChild("Humanoids")
            and Workspace.Humanoids:FindFirstChild("Regions")
            and Workspace.Humanoids.Regions:FindFirstChild("Misc")
            and Workspace.Humanoids.Regions.Misc:FindFirstChild("ActiveNpcs")
        
        if activeNpcs then
            local mainNode = activeNpcs:FindFirstChild(targetName)
            if not mainNode then
                for _, child in ipairs(activeNpcs:GetChildren()) do
                    if string.find(child.Name, targetName) or string.find(targetName, child.Name) then
                        mainNode = child
                        break
                    end
                end
            end

            if mainNode then
                local model = mainNode:FindFirstChild(targetName) or mainNode:FindFirstChildOfClass("Model") or mainNode
                local hum = model and model:FindFirstChildOfClass("Humanoid")
                if hum and hum.Health > 0 then
                    targetModel = model
                end
            end
        end
    end)
    return targetModel
end

local function pressKey(keyCode)
    VirtualInputManager:SendKeyEvent(true, keyCode, false, game)
    task.wait(0.05)
    VirtualInputManager:SendKeyEvent(false, keyCode, false, game)
end

local function pressSkillZ()
    pcall(function()
        VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Z, false, game)
        task.wait(0.05)
        VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Z, false, game)
    end)
end


local function safeTweenTo(targetCFrame)
    local character = LocalPlayer.Character
    if not character or not character:FindFirstChild("HumanoidRootPart") then return end
    local rootPart = character.HumanoidRootPart
    
    local distance = (rootPart.Position - targetCFrame.Position).Magnitude
    
    local travelTime = math.clamp(distance / 400, 0.15, 0.8)
    
    local tweenInfo = TweenInfo.new(travelTime, Enum.EasingStyle.Linear)
    local tween = TweenService:Create(rootPart, tweenInfo, {CFrame = targetCFrame})
    tween:Play()
    
    local completed = false
    local conn
    conn = tween.Completed:Connect(function()
        completed = true
        if conn then conn:Disconnect() end
    end)
    
    local startTime = tick()
    while not completed and (tick() - startTime) < (travelTime + 0.1) do
        task.wait()
    end
end


local selectedFarmTarget = sortedNames[1]
local autoFarmEnabled = false
local lastToggleTime = tick()
local isDodgeState = false
local isTeleported = false
local lastMonsterPosition = nil
local farmState = "Fighting"
local lootingStartTime = 0


local multiFarmEnabled = false
local selectedMultiTargets = {}
local multiTargetQueue = {}
local currentQueueIndex = 1
local multiFarmState = "Checking"
local multiLastToggle = tick()
local multiDodgeState = false
local multiMonsterPos = nil
local multiLootTimer = 0
local activeLockedTarget = nil


local FarmDropdown = Tabs.Farming:AddDropdown("AutoFarmDropdown", {
    Title = "Select Farm Target",
    Values = sortedNames,
    Multi = false,
    Default = 1,
})

FarmDropdown:OnChanged(function(Value)
    selectedFarmTarget = Value
    isTeleported = false
    isDodgeState = false
    farmState = "Fighting"
end)

local AutoFarmToggle = Tabs.Farming:AddToggle("AutoFarmToggle", {
    Title = "Auto Farm + Auto Loot + Press Z",
    Description = "ฟาร์มปกติ พร้อมระบบกันเตะและหันหน้าล็อกเป้าหมาย",
    Default = false
})

AutoFarmToggle:OnChanged(function(Value)
    autoFarmEnabled = Value
    if Value then
        multiFarmEnabled = false 
    else
        isTeleported = false
        isDodgeState = false
        farmState = "Fighting"
    end
end)

local MultiDropdown = Tabs.MultiFarm:AddDropdown("MultiFarmDropdown", {
    Title = "Select Multi Targets",
    Values = sortedNames,
    Multi = true,
    Default = {},
})

MultiDropdown:OnChanged(function(Values)
    selectedMultiTargets = Values
    multiTargetQueue = {}
    for name, isSelected in pairs(Values) do
        if isSelected then
            table.insert(multiTargetQueue, name)
        end
    end
    currentQueueIndex = 1
    multiFarmState = "Checking"
    activeLockedTarget = nil
end)

local MultiFarmToggle = Tabs.MultiFarm:AddToggle("MultiFarmToggle", {
    Title = "Enable Multi Farm Loop + Press Z",
    Description = "Tween หาเป้าหมายแบบปลอดภัยไม่โดนเตะ / วาร์ปตีสลับเด้งสูง 300",
    Default = false
})

MultiFarmToggle:OnChanged(function(Value)
    multiFarmEnabled = Value
    if Value then
        autoFarmEnabled = false 
        multiTargetQueue = {}
        for name, isSelected in pairs(selectedMultiTargets) do
            if isSelected then
                table.insert(multiTargetQueue, name)
            end
        end
        currentQueueIndex = 1
        multiFarmState = "Checking"
        activeLockedTarget = nil
    else
        multiFarmState = "Checking"
        activeLockedTarget = nil
    end
end)


RunService.Heartbeat:Connect(function()
  
    if autoFarmEnabled then
        local character = LocalPlayer.Character
        if not character or not character:FindFirstChild("HumanoidRootPart") then return end
        local rootPart = character.HumanoidRootPart

        local baseCFrame = TargetData[selectedFarmTarget]
        if not baseCFrame then return end

        if not isTeleported then
            safeTweenTo(baseCFrame)
            isTeleported = true
            task.wait(0.5)
            return
        end

        if farmState == "Fighting" then
            local targetModel = getTargetModel(selectedFarmTarget)
            local targetHRP = targetModel and (targetModel:FindFirstChild("HumanoidRootPart") or targetModel.PrimaryPart)
            local humanoid = targetModel and targetModel:FindFirstChildOfClass("Humanoid")

            if targetHRP then
                lastMonsterPosition = targetHRP.Position
                if humanoid and humanoid.Health <= 0 then
                    farmState = "Looting"
                    lootingStartTime = tick()
                    return
                end

                local requiredTime = isDodgeState and 1.0 or 1.7
                if tick() - lastToggleTime >= requiredTime then
                    isDodgeState = not isDodgeState
                    lastToggleTime = tick()
                end

                if isDodgeState then
                    rootPart.CFrame = targetHRP.CFrame * CFrame.new(0, 300, 0)
                else
                    rootPart.CFrame = CFrame.new((targetHRP.CFrame * CFrame.new(0, 0, 3)).Position, targetHRP.Position)
                    
                    pcall(function()
                        VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 1)
                        task.wait(0.05)
                        VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 1)
                    end)
                    pressSkillZ()
                end
            else
                farmState = "Looting"
                lootingStartTime = tick()
            end
        elseif farmState == "Looting" then
            if tick() - lootingStartTime > 7 then
                farmState = "Fighting"
                isDodgeState = false
                return
            end

            pressKey(Enum.KeyCode.T)
            task.wait(0.2)

            local lootDrops = Workspace:FindFirstChild("LootDrops")
            local itemsLeft = false
            if lootDrops then
                for _, drop in ipairs(lootDrops:GetChildren()) do
                    local dropPart = drop:IsA("Model") and (drop.PrimaryPart or drop:FindFirstChild("HumanoidRootPart") or drop:FindFirstChildWhichIsA("BasePart")) or drop
                    if dropPart and dropPart:IsA("BasePart") then
                        if lastMonsterPosition and (dropPart.Position - lastMonsterPosition).Magnitude <= 80 then
                            itemsLeft = true
                            rootPart.CFrame = dropPart.CFrame
                            pressKey(Enum.KeyCode.T)
                            task.wait(0.15)
                        end
                    end
                end
            end

            if not itemsLeft or (tick() - lootingStartTime > 5) then
                farmState = "Fighting"
                isDodgeState = false
            end
        end

    
    elseif multiFarmEnabled then
        if #multiTargetQueue == 0 then return end

        local character = LocalPlayer.Character
        if not character or not character:FindFirstChild("HumanoidRootPart") then return end
        local rootPart = character.HumanoidRootPart

        if currentQueueIndex > #multiTargetQueue then
            currentQueueIndex = 1
        end

        if not activeLockedTarget then
            activeLockedTarget = multiTargetQueue[currentQueueIndex]
            multiFarmState = "Checking"
        end

        if multiFarmState == "Checking" then
            local baseCFrame = TargetData[activeLockedTarget]
            if not baseCFrame then
                activeLockedTarget = nil
                currentQueueIndex = currentQueueIndex + 1
                return
            end

           
            safeTweenTo(baseCFrame)
            task.wait(0.2)

            local targetModel = getTargetModel(activeLockedTarget)
            local targetHRP = targetModel and (targetModel:FindFirstChild("HumanoidRootPart") or targetModel.PrimaryPart)
            local humanoid = targetModel and targetModel:FindFirstChildOfClass("Humanoid")

            if targetHRP and humanoid and humanoid.Health > 0 then
                multiFarmState = "Fighting"
                multiDodgeState = false
                multiLastToggle = tick()
            else
                activeLockedTarget = nil
                currentQueueIndex = currentQueueIndex + 1
            end

        elseif multiFarmState == "Fighting" then
            local targetModel = getTargetModel(activeLockedTarget)
            local targetHRP = targetModel and (targetModel:FindFirstChild("HumanoidRootPart") or targetModel.PrimaryPart)
            local humanoid = targetModel and targetModel:FindFirstChildOfClass("Humanoid")

            if targetHRP and humanoid and humanoid.Health > 0 then
                multiMonsterPos = targetHRP.Position

                local multiRequiredTime = multiDodgeState and 1.0 or 1.7
                if tick() - multiLastToggle >= multiRequiredTime then
                    multiDodgeState = not multiDodgeState
                    multiLastToggle = tick()
                end

                if multiDodgeState then
                    rootPart.CFrame = targetHRP.CFrame * CFrame.new(0, 300, 0)
                else
                    rootPart.CFrame = CFrame.new((targetHRP.CFrame * CFrame.new(0, 0, 3)).Position, targetHRP.Position)

                    pcall(function()
                        VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 1)
                        task.wait(0.05)
                        VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 1)
                    end)
                    pressSkillZ()
                end
            else
                multiFarmState = "Looting"
                multiLootTimer = tick()
            end

        elseif multiFarmState == "Looting" then
            if tick() - multiLootTimer > 4 then
                activeLockedTarget = nil
                currentQueueIndex = currentQueueIndex + 1
                multiDodgeState = false
                multiFarmState = "Checking"
                return
            end

            pressKey(Enum.KeyCode.T)
            task.wait(0.2)

            local lootDrops = Workspace:FindFirstChild("LootDrops")
            local multiItemsLeft = false
            if lootDrops then
                for _, drop in ipairs(lootDrops:GetChildren()) do
                    local dropPart = drop:IsA("Model") and (drop.PrimaryPart or drop:FindFirstChild("HumanoidRootPart") or drop:FindFirstChildWhichIsA("BasePart")) or drop
                    if dropPart and dropPart:IsA("BasePart") then
                        if multiMonsterPos and (dropPart.Position - multiMonsterPos).Magnitude <= 80 then
                            multiItemsLeft = true
                            rootPart.CFrame = dropPart.CFrame
                            pressKey(Enum.KeyCode.T)
                            task.wait(0.15)
                        end
                    end
                end
            end

            if not multiItemsLeft or (tick() - multiLootTimer > 3) then
                activeLockedTarget = nil
                currentQueueIndex = currentQueueIndex + 1
                multiDodgeState = false
                multiFarmState = "Checking"
            end
        end
    end
end)

InterfaceManager:SetLibrary(Fluent)
SaveManager:SetLibrary(Fluent)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({})
InterfaceManager:BuildInterfaceSection(Tabs.Setting)
SaveManager:BuildConfigSection(Tabs.Setting)

Window:SelectTab(1)

Fluent:Notify({
    Title = "KQHUB",
    Content = "Safe Anti-Kick Tween System Loaded!",
    Duration = 5
})

SaveManager:LoadAutoloadConfig()
