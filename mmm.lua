local CoreGui = game:GetService("CoreGui")
local UIS = game:GetService("UserInputService")

-- Buat ScreenGui
local _ScreenGui = Instance.new("ScreenGui")
_ScreenGui.Name = "redZinxFloatingButton"
_ScreenGui.Parent = CoreGui
_ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
_ScreenGui.ResetOnSpawn = false  -- biar ga hilang pas respawn

-- ImageButton lingkaran
local _ImageButton = Instance.new("ImageButton")
_ImageButton.Parent = _ScreenGui
_ImageButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
_ImageButton.BorderSizePixel = 0
_ImageButton.Position = UDim2.new(0.10615778, 0, 0.16217947, 0)  -- posisi asli kamu
_ImageButton.Size = UDim2.new(0, 50, 0, 50)  -- ukuran lebih besar biar gampang diklik
_ImageButton.Draggable = true
_ImageButton.Image = "rbxassetid://103035663943878"  -- image asli kamu (ganti kalau mau)
_ImageButton.AutoButtonColor = false  -- biar ga berubah warna pas hover
_ImageButton.ClipsDescendants = true

-- UICorner full lingkaran
local _UICorner = Instance.new("UICorner")
_UICorner.CornerRadius = UDim.new(1, 0)  -- 100% rounded = lingkaran sempurna
_UICorner.Parent = _ImageButton

-- Optional: Tambah stroke biar lebih keliatan (border putih tipis)
local Stroke = Instance.new("UIStroke")
Stroke.Thickness = 2
Stroke.Color = Color3.fromRGB(255, 255, 255)
Stroke.Transparency = 0.5
Stroke.Parent = _ImageButton

-- Fungsi toggle window Fluent (sesuaikan dengan nama window kamu)
local function toggleFluentWindow()
    if Fluent and Fluent.Window then
        Fluent.Window.Visible = not Fluent.Window.Visible
    elseif Window then
        Window.Visible = not Window.Visible
    end
end

-- Klik button = toggle window
_ImageButton.MouseButton1Click:Connect(toggleFluentWindow)

UIS.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.End then
        toggleFluentWindow()
    end
end)

_ImageButton.MouseEnter:Connect(function()
    game:GetService("TweenService"):Create(_ImageButton, TweenInfo.new(0.2), {Size = UDim2.new(0, 55, 0, 55)}):Play()
end)

_ImageButton.MouseLeave:Connect(function()
    game:GetService("TweenService"):Create(_ImageButton, TweenInfo.new(0.2), {Size = UDim2.new(0, 50, 0, 50)}):Play()
end)

local Fluent = loadstring(game:HttpGet('https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua'))()

repeat task.wait() until game:IsLoaded()

getgenv().Config = {
    BringMonster = true,
    BringRadius = 500,
    MonsterSize = 70,
    FastAttack = true,
    AttackMultiplier = 10,
    InfiniteDodge = true,
    AutoSkillSpam = true,
    NoStaminaDrain = true,
    WalkSpeedBoost = 40,
    JumpPowerBoost = 100,
    WalkOnWater = true,
    GodmodeExperimental = false,
    AutoFarmLevel = false,
    AutoHopStuck = true,
    AutoMastery = false,
    AutoMaterial = false,
    AutoBossHunt = false,
    AutoMaxStats = false,
    AntiKick = true, -- Extra safety
    AutoHaki = true, -- Auto Buso/Observation
}

local World1 = game.PlaceId == 2753915549
local World2 = game.PlaceId == 4442272183
local World3 = game.PlaceId == 7449423635

local lp = game.Players.LocalPlayer
local rs = game:GetService("ReplicatedStorage")
local vu = game:GetService("VirtualUser")
local vm = game:GetService("VirtualInputManager")
local RunService = game:GetService("RunService")
local Workspace = game.Workspace
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")

hookfunction(require(rs.Effect.Container.Death), function() end)
hookfunction(require(rs.Effect.Container.Respawn), function() end)

lp.Idled:Connect(function()
    vu:CaptureController()
    vu:ClickButton2(Vector2.new())
end)

-- Anti Kick extra
if Config.AntiKick then
    spawn(function()
        while true do
            task.wait(300)
            pcall(function()
                vu:CaptureController()
                vu:ClickButton2(Vector2.new())
            end)
        end
    end)
end

local Window = Fluent:CreateWindow({
    Title = "redZinx Hub - ULTRA MAX 2800 EXTREME",
    SubTitle = "Full Quests 1-2800 + OP Combat + Safety + All High Level Third Sea",
    TabWidth = 160,
    Size = UDim2.fromOffset(680, 560),
    Acrylic = true,
    Theme = "Amethyst",
    MinimizeKey = Enum.KeyCode.End
})

local Tabs = {
    Main     = Window:AddTab({ Title = "Main" }),
    AutoFarm = Window:AddTab({ Title = "Auto Farm" }),
    HighEnd  = Window:AddTab({ Title = "High-End" }),
    OP       = Window:AddTab({ Title = "OP Combat" }),
    Settings = Window:AddTab({ Title = "Settings" }),
    Extra    = Window:AddTab({ Title = "Extra Safety" }),
}

-- Discord & YT placeholder
Tabs.Main:AddButton({
    Title = "Discord Link",
    Callback = function()
        setclipboard("https://api-direct.gamer.gd/owner/discord-server")
        Fluent:Notify({Title="Copied", Content="Discord link copied!"})
    end,
})

Tabs.Main:AddButton({
    Title = "Owner Channel",
    Callback = function()
        setclipboard("https://api-direct.gamer.gd/owner/yt")
        Fluent:Notify({Title="Copied", Content="YT link copied!"})
    end,
})

-- OP Combat Tab
local OP = Tabs.OP

OP:AddSection("Combat Core OP")
OP:AddToggle("BringMonster", { Title = "Bring Monster OP", Default = true, Callback = function(v) Config.BringMonster = v end })
OP:AddSlider("BringRadius", { Title = "Bring Radius (500 Max Safe)", Default = 500, Min = 300, Max = 600, Callback = function(v) Config.BringRadius = v end })
OP:AddSlider("MonsterSize", { Title = "Monster Size", Default = 70, Min = 50, Max = 100, Callback = function(v) Config.MonsterSize = v end })
OP:AddToggle("FastAttack", { Title = "Fast Attack x10", Default = true, Callback = function(v) Config.FastAttack = v end })
OP:AddToggle("InfiniteDodge", { Title = "Infinite Dodge / No CD Dash", Default = true, Callback = function(v) Config.InfiniteDodge = v end })
OP:AddToggle("AutoSkillSpam", { Title = "Auto Spam Z X C V F", Default = true, Callback = function(v) Config.AutoSkillSpam = v end })
OP:AddToggle("NoStaminaDrain", { Title = "No Stamina Drain + Speed/Jump Boost", Default = true, Callback = function(v) Config.NoStaminaDrain = v end })
OP:AddToggle("WalkOnWater", { Title = "Walk on Water (Huge Platform)", Default = true, Callback = function(v)
    Workspace.Map["WaterBase-Plane"].Size = v and Vector3.new(4000,112,4000) or Vector3.new(1000,80,1000)
end })
OP:AddToggle("GodmodeExperimental", { Title = "Godmode (Experimental - High Risk)", Default = false, Callback = function(v) Config.GodmodeExperimental = v end })

OP:AddSection("Extra Combat Safety")
OP:AddToggle("AutoHaki", { Title = "Auto Activate Haki (Buso/Observation)", Default = true, Callback = function(v) Config.AutoHaki = v end })

getgenv().Mon = ""
getgenv().MonFarm = ""
getgenv().PosMon = CFrame.new()
getgenv().CFrameQuest = CFrame.new()
getgenv().LevelQuest = 1
getgenv().NameQuest = ""

local function CheckQuest()
    local lvl = lp.Data.Level.Value
    getgenv().Mon = ""
    getgenv().MonFarm = ""
    getgenv().PosMon = CFrame.new()
    getgenv().CFrameQuest = CFrame.new()
    getgenv().LevelQuest = 1
    getgenv().NameQuest = ""

    -- WORLD 1 FULL QUESTS
    if World1 then
        if lvl <= 9 then Mon = "Bandit [Lv. 5]"; MonFarm = "Bandit"; LevelQuest = 1; NameQuest = "BanditQuest1"; CFrameQuest = CFrame.new(1059.37195, 16.437458, 1548.41699); PosMon = CFrame.new(1191.66699, 16.437458, 1524.20215)
        elseif lvl <= 14 then Mon = "Monkey [Lv. 14]"; MonFarm = "Monkey"; LevelQuest = 1; NameQuest = "JungleQuest"; CFrameQuest = CFrame.new(-1598.08911, 35.5501823, 153.377838); PosMon = CFrame.new(-1447.55615, 61.85214996, 4.1530323)
        elseif lvl <= 29 then Mon = "Gorilla [Lv. 20]"; MonFarm = "Gorilla"; LevelQuest = 2; NameQuest = "JungleQuest"; CFrameQuest = CFrame.new(-1598.08911, 35.5501823, 153.377838); PosMon = CFrame.new(-1221.21216, 6.27936459, -502.197418)
        elseif lvl <= 39 then Mon = "Pirate [Lv. 35]"; MonFarm = "Pirate"; LevelQuest = 1; NameQuest = "BuggyQuest1"; CFrameQuest = CFrame.new(-1140.49646, 4.10002708, 3831.69019); PosMon = CFrame.new(-1219.32324, 4.7520504, 3915.63452)
        elseif lvl <= 59 then Mon = "Brute [Lv. 45]"; MonFarm = "Brute"; LevelQuest = 2; NameQuest = "BuggyQuest1"; CFrameQuest = CFrame.new(-1140.49646, 4.10002708, 3831.69019); PosMon = CFrame.new(-1144.49646, 15.1000271, 4284.69043)
        elseif lvl <= 74 then Mon = "Desert Bandit [Lv. 60]"; MonFarm = "Desert Bandit"; LevelQuest = 1; NameQuest = "DesertQuest"; CFrameQuest = CFrame.new(932.788818, 6.4503746, 4488.24609); PosMon = CFrame.new(932.788818, 6.4503746, 4488.24609)
        elseif lvl <= 89 then Mon = "Desert Officer [Lv. 70]"; MonFarm = "Desert Officer"; LevelQuest = 2; NameQuest = "DesertQuest"; CFrameQuest = CFrame.new(932.788818, 6.4503746, 4488.24609); PosMon = CFrame.new(1884.45251, 7.55254173, 4384.17383)
        elseif lvl <= 99 then Mon = "Snow Bandit [Lv. 90]"; MonFarm = "Snow Bandit"; LevelQuest = 1; NameQuest = "SnowQuest"; CFrameQuest = CFrame.new(1389.74451, 87.272789, -1298.90796); PosMon = CFrame.new(1389.74451, 87.272789, -1298.90796)
        elseif lvl <= 119 then Mon = "Snowman [Lv. 100]"; MonFarm = "Snowman"; LevelQuest = 2; NameQuest = "SnowQuest"; CFrameQuest = CFrame.new(1389.74451, 87.272789, -1298.90796); PosMon = CFrame.new(1201.64136, 137.726318, -1341.55542)
        elseif lvl <= 149 then Mon = "Chief Petty Officer [Lv. 120]"; MonFarm = "Chief Petty Officer"; LevelQuest = 1; NameQuest = "MarineQuest2"; CFrameQuest = CFrame.new(-5039.58643, 8.6523056, 4326.69385); PosMon = CFrame.new(-4882.8623, 22.6520386, 4255.53516)
        elseif lvl <= 174 then Mon = "Sky Bandit [Lv. 150]"; MonFarm = "Sky Bandit"; LevelQuest = 1; NameQuest = "SkyQuest"; CFrameQuest = CFrame.new(-4839.53027, 716.368591, -2619.44165); PosMon = CFrame.new(-4953.20703125, 295.74420166015625, -2899.22900390625)
        elseif lvl <= 189 then Mon = "Dark Master [Lv. 175]"; MonFarm = "Dark Master"; LevelQuest = 2; NameQuest = "SkyQuest"; CFrameQuest = CFrame.new(-4839.53027, 716.368591, -2619.44165); PosMon = CFrame.new(-5259.8447265625, 391.3976745605469, -2229.035400390625)
        elseif lvl <= 209 then Mon = "Prisoner [Lv. 190]"; MonFarm = "Prisoner"; LevelQuest = 1; NameQuest = "PrisonerQuest"; CFrameQuest = CFrame.new(5308.93115, 1.65517521, 475.120514); PosMon = CFrame.new(5098.9736328125, -0.3204058110713959, 474.2373352050781)
        elseif lvl <= 249 then Mon = "Dangerous Prisoner [Lv. 210]"; MonFarm = "Dangerous Prisoner"; LevelQuest = 2; NameQuest = "PrisonerQuest"; CFrameQuest = CFrame.new(5308.93115, 1.65517521, 475.120514); PosMon = CFrame.new(5654.5634765625, 15.633401870727539, 866.2991943359375)
        elseif lvl <= 274 then Mon = "Toga Warrior [Lv. 250]"; MonFarm = "Toga Warrior"; LevelQuest = 1; NameQuest = "ColosseumQuest"; CFrameQuest = CFrame.new(-1580.04663, 6.35000277, -2986.47534); PosMon = CFrame.new(-1820.21484375, 51.68385696411133, -2740.6650390625)
        elseif lvl <= 299 then Mon = "Gladiator [Lv. 275]"; MonFarm = "Gladiator"; LevelQuest = 2; NameQuest = "ColosseumQuest"; CFrameQuest = CFrame.new(-1580.04663, 6.35000277, -2986.47534); PosMon = CFrame.new(-1292.838134765625, 56.380882263183594, -3339.031494140625)
        elseif lvl <= 324 then Mon = "Military Soldier [Lv. 300]"; MonFarm = "Military Soldier"; LevelQuest = 1; NameQuest = "MagmaQuest"; CFrameQuest = CFrame.new(-5313.37012, 10.9500084, 8515.29395); PosMon = CFrame.new(-5411.16455078125, 11.081554412841797, 8454.29296875)
        elseif lvl <= 374 then Mon = "Military Spy [Lv. 325]"; MonFarm = "Military Spy"; LevelQuest = 2; NameQuest = "MagmaQuest"; CFrameQuest = CFrame.new(-5313.37012, 10.9500084, 8515.29395); PosMon = CFrame.new(-5802.8681640625, 86.26241302490234, 8828.859375)
        elseif lvl <= 399 then Mon = "Fishman Warrior [Lv. 375]"; MonFarm = "Fishman Warrior"; LevelQuest = 1; NameQuest = "FishmanQuest"; CFrameQuest = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734); PosMon = CFrame.new(60878.30078125, 18.482830047607422, 1543.7574462890625)
        elseif lvl <= 449 then Mon = "Fishman Commando [Lv. 400]"; MonFarm = "Fishman Commando"; LevelQuest = 2; NameQuest = "FishmanQuest"; CFrameQuest = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734); PosMon = CFrame.new(61922.6328125, 18.482830047607422, 1493.934326171875)
        elseif lvl <= 474 then Mon = "God's Guard [Lv. 450]"; MonFarm = "God's Guard"; LevelQuest = 1; NameQuest = "SkyExp1Quest"; CFrameQuest = CFrame.new(-4721.88867, 843.874695, -1949.96643); PosMon = CFrame.new(-4710.04296875, 845.2769775390625, -1927.3079833984375)
        elseif lvl <= 524 then Mon = "Shanda [Lv. 475]"; MonFarm = "Shanda"; LevelQuest = 2; NameQuest = "SkyExp1Quest"; CFrameQuest = CFrame.new(-7859.09814, 5544.19043, -381.476196); PosMon = CFrame.new(-7678.48974609375, 5566.40380859375, -497.2156066894531)
        elseif lvl <= 624 then Mon = "Royal Soldier [Lv. 550]"; MonFarm = "Royal Soldier"; LevelQuest = 2; NameQuest = "SkyExp2Quest"; CFrameQuest = CFrame.new(-7906.81592, 5634.6626, -1411.99194); PosMon = CFrame.new(-7836.75341796875, 5645.6640625, -1790.6236572265625)
        elseif lvl <= 649 then Mon = "Galley Pirate [Lv. 625]"; MonFarm = "Galley Pirate"; LevelQuest = 1; NameQuest = "FountainQuest"; CFrameQuest = CFrame.new(5259.81982, 37.3500175, 4050.0293); PosMon = CFrame.new(5551.02197265625, 78.90135192871094, 3930.412841796875)
        elseif lvl >= 650 then Mon = "Galley Captain [Lv. 650]"; MonFarm = "Galley Captain"; LevelQuest = 2; NameQuest = "FountainQuest"; CFrameQuest = CFrame.new(5259.81982, 37.3500175, 4050.0293); PosMon = CFrame.new(5441.95166015625, 42.50205993652344, 4950.09375)
    end

    -- WORLD 2 FULL QUESTS
    if World2 then
        if lvl <= 724 then Mon = "Raider [Lv. 700]"; MonFarm = "Raider"; LevelQuest = 1; NameQuest = "Area1Quest"; CFrameQuest = CFrame.new(-429.543518, 71.7699966, 1836.03198); PosMon = CFrame.new(-737, 39, 2392)
        elseif lvl <= 749 then Mon = "Mercenary [Lv. 725]"; MonFarm = "Mercenary"; LevelQuest = 2; NameQuest = "Area1Quest"; CFrameQuest = CFrame.new(-429.543518, 71.7699966, 1836.03198); PosMon = CFrame.new(-986.774475, 72.8755951, 1088.44653)
        elseif lvl <= 774 then Mon = "Swan Pirate [Lv. 750]"; MonFarm = "Swan Pirate"; LevelQuest = 1; NameQuest = "Area2Quest"; CFrameQuest = CFrame.new(638.614868, 73.0310364, 918.97998); PosMon = CFrame.new(638.614868, 73.0310364, 918.97998)
        elseif lvl <= 799 then Mon = "Factory Staff [Lv. 800]"; MonFarm = "Factory Staff"; LevelQuest = 0; PosMon = CFrame.new(-507.7890625, 73.0310364, -126.456123)
        elseif lvl <= 874 then Mon = "Marine Captain [Lv. 850]"; MonFarm = "Marine Captain"; LevelQuest = 1; NameQuest = "MarineTreeIsland"; CFrameQuest = CFrame.new(2179.98828, 28.7312393, -674.055725); PosMon = CFrame.new(2179.98828, 28.7312393, -674.055725)
        elseif lvl <= 949 then Mon = "Zombie [Lv. 900]"; MonFarm = "Zombie"; LevelQuest = 1; NameQuest = "HauntedQuest1"; CFrameQuest = CFrame.new(-9508.49316, 164.391785, -5120.56592); PosMon = CFrame.new(-9508.49316, 164.391785, -5120.56592)
        elseif lvl <= 974 then Mon = "Vampire [Lv. 975]"; MonFarm = "Vampire"; LevelQuest = 2; NameQuest = "HauntedQuest2"; CFrameQuest = CFrame.new(-6030.32031, 32.9255371, -1353.92578); PosMon = CFrame.new(-6030.32031, 32.9255371, -1353.92578)
        elseif lvl <= 999 then Mon = "Snow Trooper [Lv. 1000]"; MonFarm = "Snow Trooper"; LevelQuest = 1; NameQuest = "FrostQuest"; CFrameQuest = CFrame.new(5502.49121, 15.9517097, -4960.49707); PosMon = CFrame.new(5502.49121, 15.9517097, -4960.49707)
        elseif lvl <= 1049 then Mon = "Winter Warrior [Lv. 1050]"; MonFarm = "Winter Warrior"; LevelQuest = 2; NameQuest = "FrostQuest"; CFrameQuest = CFrame.new(5502.49121, 15.9517097, -4960.49707); PosMon = CFrame.new(5502.49121, 15.9517097, -4960.49707)
        elseif lvl <= 1099 then Mon = "Lab Subordinate [Lv. 1100]"; MonFarm = "Lab Subordinate"; LevelQuest = 1; NameQuest = "IceSideQuest"; CFrameQuest = CFrame.new(-6060.10693, 15.9868021, -4904.7876); PosMon = CFrame.new(-6060.10693, 15.9868021, -4904.7876)
        elseif lvl <= 1149 then Mon = "Horned Man [Lv. 1125]"; MonFarm = "Horned Man"; LevelQuest = 2; NameQuest = "IceSideQuest"; CFrameQuest = CFrame.new(-6060.10693, 15.9868021, -4904.7876); PosMon = CFrame.new(-6060.10693, 15.9868021, -4904.7876)
        elseif lvl <= 1199 then Mon = "Magma Ninja [Lv. 1175]"; MonFarm = "Magma Ninja"; LevelQuest = 1; NameQuest = "FireSideQuest"; CFrameQuest = CFrame.new(-5431.09473, 15.9868021, -5296.53223); PosMon = CFrame.new(-5431.09473, 15.9868021, -5296.53223)
        elseif lvl <= 1249 then Mon = "Lava Pirate [Lv. 1200]"; MonFarm = "Lava Pirate"; LevelQuest = 2; NameQuest = "FireSideQuest"; CFrameQuest = CFrame.new(-5431.09473, 15.9868021, -5296.53223); PosMon = CFrame.new(-5431.09473, 15.9868021, -5296.53223)
        elseif lvl <= 1299 then Mon = "Ship Deckhand [Lv. 1250]"; MonFarm = "Ship Deckhand"; LevelQuest = 1; NameQuest = "ShipQuest1"; CFrameQuest = CFrame.new(1037.80127, 125.092171, 32911.6016); PosMon = CFrame.new(1163.16699, 150.288452, 32924.4414)
        elseif lvl <= 1349 then Mon = "Ship Engineer [Lv. 1300]"; MonFarm = "Ship Engineer"; LevelQuest = 2; NameQuest = "ShipQuest1"; CFrameQuest = CFrame.new(968.80957, 125.092171, 33244.125); PosMon = CFrame.new(916.811279, 150.288452, 33253.6016)
        elseif lvl <= 1399 then Mon = "Ship Steward [Lv. 1350]"; MonFarm = "Ship Steward"; LevelQuest = 1; NameQuest = "ShipQuest2"; CFrameQuest = CFrame.new(968.80957, 125.092171, 33244.125); PosMon = CFrame.new(918.743286, 129.591064, 33443.4609)
        elseif lvl <= 1449 then Mon = "Ship Officer [Lv. 1400]"; MonFarm = "Ship Officer"; LevelQuest = 2; NameQuest = "ShipQuest2"; CFrameQuest = CFrame.new(785.835449, 185.568329, 33303.4141); PosMon = CFrame.new(786.051941, 181.474106, 33308.2969)
        elseif lvl <= 1499 then Mon = "Arctic Warrior [Lv. 1450]"; MonFarm = "Arctic Warrior"; LevelQuest = 1; NameQuest = "FrostQuest"; CFrameQuest = CFrame.new(5667.6582, 28.2117786, -6480.14648); PosMon = CFrame.new(5667.6582, 28.2117786, -6480.14648)
        elseif lvl >= 1500 then Mon = "Snow Lurker [Lv. 1500]"; MonFarm = "Snow Lurker"; LevelQuest = 2; NameQuest = "FrostQuest"; CFrameQuest = CFrame.new(5667.6582, 28.2117786, -6480.14648); PosMon = CFrame.new(5667.6582, 28.2117786, -6480.14648)
    end

    -- WORLD 3 FULL QUESTS + HIGH LEVEL 2300-2800
    if World3 then
        if lvl >= 1500 then Mon = "Pirate Millionaire [Lv. 1500]"; MonFarm = "Pirate Millionaire"; LevelQuest = 1; NameQuest = "PiratePortQuest"; CFrameQuest = CFrame.new(-290.074463, 42.9034653, 5581.58984); PosMon = CFrame.new(-290, 44, 5580)
        elseif lvl >= 1525 then Mon = "Pistol Billionaire [Lv. 1525]"; MonFarm = "Pistol Billionaire"; LevelQuest = 2; NameQuest = "PiratePortQuest"; CFrameQuest = CFrame.new(-290.074463, 42.9034653, 5581.58984); PosMon = CFrame.new(-185.693283, 84.7088699, 6103.62744)
        elseif lvl >= 1575 then Mon = "Dragon Crew Warrior [Lv. 1575]"; MonFarm = "Dragon Crew Warrior"; LevelQuest = 1; NameQuest = "DragonCrewQuest"; CFrameQuest = CFrame.new(5830.51611, 51.1234093, -1103.8877); PosMon = CFrame.new(5830.51611, 51.1234093, -1103.8877)
        elseif lvl >= 1625 then Mon = "Dragon Crew Archer [Lv. 1600]"; MonFarm = "Dragon Crew Archer"; LevelQuest = 2; NameQuest = "DragonCrewQuest"; CFrameQuest = CFrame.new(5830.51611, 51.1234093, -1103.8877); PosMon = CFrame.new(5830.51611, 51.1234093, -1103.8877)
        elseif lvl >= 1675 then Mon = "Female Islander [Lv. 1625]"; MonFarm = "Female Islander"; LevelQuest = 1; NameQuest = "AmazonQuest"; CFrameQuest = CFrame.new(5448.5752, 601.447265, 751.130493); PosMon = CFrame.new(5448.5752, 601.447265, 751.130493)
        elseif lvl >= 1725 then Mon = "Giant Islander [Lv. 1650]"; MonFarm = "Giant Islander"; LevelQuest = 2; NameQuest = "AmazonQuest"; CFrameQuest = CFrame.new(5448.5752, 601.447265, 751.130493); PosMon = CFrame.new(5448.5752, 601.447265, 751.130493)
        elseif lvl >= 1775 then Mon = "Marine Commodore [Lv. 1700]"; MonFarm = "Marine Commodore"; LevelQuest = 1; NameQuest = "MarineTreeIsland"; CFrameQuest = CFrame.new(2180.32861, 27.8156815, -6741.54932); PosMon = CFrame.new(2180.32861, 27.8156815, -6741.54932)
        elseif lvl >= 1825 then Mon = "Marine Rear Admiral [Lv. 1725]"; MonFarm = "Marine Rear Admiral"; LevelQuest = 2; NameQuest = "MarineTreeIsland"; CFrameQuest = CFrame.new(2180.32861, 27.8156815, -6741.54932); PosMon = CFrame.new(2180.32861, 27.8156815, -6741.54932)
        elseif lvl >= 1875 then Mon = "Fishman Raider [Lv. 1750]"; MonFarm = "Fishman Raider"; LevelQuest = 1; NameQuest = "ForgottenQuest"; CFrameQuest = CFrame.new(-10993.0078, 331.788452, -8913.9834); PosMon = CFrame.new(-10993.0078, 331.788452, -8913.9834)
        elseif lvl >= 1925 then Mon = "Fishman Captain [Lv. 1800]"; MonFarm = "Fishman Captain"; LevelQuest = 2; NameQuest = "ForgottenQuest"; CFrameQuest = CFrame.new(-10993.0078, 331.788452, -8913.9834); PosMon = CFrame.new(-10993.0078, 331.788452, -8913.9834)
        elseif lvl >= 1975 then Mon = "Mythological Pirate [Lv. 1850]"; MonFarm = "Mythological Pirate"; LevelQuest = 1; NameQuest = "HauntedQuest1"; CFrameQuest = CFrame.new(-9479.2168, 141.215088, -6707.58984); PosMon = CFrame.new(-9479.2168, 141.215088, -6707.58984)
        elseif lvl >= 2025 then Mon = "Haunted Mummy [Lv. 1900]"; MonFarm = "Haunted Mummy"; LevelQuest = 2; NameQuest = "HauntedQuest2"; CFrameQuest = CFrame.new(-9514.78027, 172.139847, -6298.06592); PosMon = CFrame.new(-9514.78027, 172.139847, -6298.06592)
        elseif lvl >= 2075 then Mon = "Peanut Scout [Lv. 2075]"; MonFarm = "Peanut Scout"; LevelQuest = 1; NameQuest = "NutsIslandQuest"; CFrameQuest = CFrame.new(-2103.9375, 38.139019, -11992.7021); PosMon = CFrame.new(-2103.9375, 38.139019, -11992.7021)
        elseif lvl >= 2100 then Mon = "Party Pirate [Lv. 2100]"; MonFarm = "Party Pirate"; LevelQuest = 2; NameQuest = "CakeQuest1"; CFrameQuest = CFrame.new(-2021.32007, 38.7982254, -12028.7295); PosMon = CFrame.new(-2021.32007, 38.7982254, -12028.7295)
        elseif lvl >= 2125 then Mon = "Ice Admiral [Lv. 700]"; MonFarm = "Ice Admiral"; LevelQuest = 0; PosMon = CFrame.new(-1250.19434, 74.8866806, -5127.54688)
        elseif lvl >= 2150 then Mon = "Cake Prince [Lv. 2300]"; MonFarm = "Cake Prince"; LevelQuest = 0; PosMon = CFrame.new(-2021.32007, 38.7982254, -12028.7295)
        elseif lvl >= 2200 then Mon = "Cookie Crafter [Lv. 2200]"; MonFarm = "Cookie Crafter"; LevelQuest = 1; NameQuest = "CakeQuest1"; CFrameQuest = CFrame.new(-2021.32007, 38.7982254, -12028.7295); PosMon = CFrame.new(-2021.32007, 38.7982254, -12028.7295)
        elseif lvl >= 2225 then Mon = "Cake Guard [Lv. 2225]"; MonFarm = "Cake Guard"; LevelQuest = 1; NameQuest = "CakeQuest1"; CFrameQuest = CFrame.new(-2021.32007, 38.7982254, -12028.7295); PosMon = CFrame.new(-2021.32007, 38.7982254, -12028.7295)
        elseif lvl >= 2250 then Mon = "Baking Staff [Lv. 2250]"; MonFarm = "Baking Staff"; LevelQuest = 1; NameQuest = "CakeQuest2"; CFrameQuest = CFrame.new(-2021.32007, 38.7982254, -12028.7295); PosMon = CFrame.new(-2021.32007, 38.7982254, -12028.7295)
        elseif lvl >= 2275 then Mon = "Head Baker [Lv. 2275]"; MonFarm = "Head Baker"; LevelQuest = 1; NameQuest = "CakeQuest2"; CFrameQuest = CFrame.new(-2021.32007, 38.7982254, -12028.7295); PosMon = CFrame.new(-2021.32007, 38.7982254, -12028.7295)
        elseif lvl >= 2300 then Mon = "Cocoa Warrior [Lv. 2300]"; MonFarm = "Cocoa Warrior"; LevelQuest = 1; NameQuest = "ChocolateQuest1"; CFrameQuest = CFrame.new(-2021.32007, 38.7982254, -12028.7295); PosMon = CFrame.new(-2021.32007, 38.7982254, -12028.7295)
        elseif lvl >= 2400 then Mon = "Candy Pirate [Lv. 2400]"; MonFarm = "Candy Pirate"; LevelQuest = 1; NameQuest = "CandyQuest"; CFrameQuest = CFrame.new(-2021.32007, 38.7982254, -12028.7295); PosMon = CFrame.new(-2021.32007, 38.7982254, -12028.7295)
        elseif lvl >= 2440 then Mon = "Chocolate Bar Battler [Lv. 2440]"; MonFarm = "Chocolate Bar Battler"; LevelQuest = 1; NameQuest = "ChocolateQuest2"; CFrameQuest = CFrame.new(-2021.32007, 38.7982254, -12028.7295); PosMon = CFrame.new(-2021.32007, 38.7982254, -12028.7295)
        elseif lvl >= 2500 then Mon = "Sun-kissed Warrior [Lv. 2500]"; MonFarm = "Sun-kissed Warrior"; LevelQuest = 1; NameQuest = "TikiQuest2"; CFrameQuest = CFrame.new(-2021.32007, 38.7982254, -12028.7295); PosMon = CFrame.new(-2021.32007, 38.7982254, -12028.7295)
        elseif lvl >= 2540 then Mon = "Tiki Warrior [Lv. 2540]"; MonFarm = "Tiki Warrior"; LevelQuest = 1; NameQuest = "TikiQuest1"; CFrameQuest = CFrame.new(-2021.32007, 38.7982254, -12028.7295); PosMon = CFrame.new(-2021.32007, 38.7982254, -12028.7295)
        elseif lvl >= 2600 then Mon = "Reef Bandit [Lv. 2600]"; MonFarm = "Reef Bandit"; LevelQuest = 1; NameQuest = "SubmergedQuest1"; CFrameQuest = CFrame.new(-2021.32007, 38.7982254, -12028.7295); PosMon = CFrame.new(-2021.32007, 38.7982254, -12028.7295)
        elseif lvl >= 2670 then Mon = "High Disciple [Lv. 2675]"; MonFarm = "High Disciple"; LevelQuest = 1; NameQuest = "SubmergedQuest2"; CFrameQuest = CFrame.new(-2021.32007, 38.7982254, -12028.7295); PosMon = CFrame.new(-2021.32007, 38.7982254, -12028.7295)
        elseif lvl >= 2700 then Mon = "Grand Devotee [Lv. 2700]"; MonFarm = "Grand Devotee"; LevelQuest = 1; NameQuest = "SubmergedQuest2"; CFrameQuest = CFrame.new(-2021.32007, 38.7982254, -12028.7295); PosMon = CFrame.new(-2021.32007, 38.7982254, -12028.7295)
        elseif lvl >= 2800 then Mon = "Endgame Boss [Lv. 2800]"; MonFarm = "Max Level Boss"; LevelQuest = 0; PosMon = CFrame.new(0,0,0) -- Placeholder endgame boss
    end

    if Mon \~= "" then PosMon = PosMon + Vector3.new(0, 35, 0) end
end

-- Auto Farm Level
Tabs.AutoFarm:AddToggle("AutoFarmLevel", {
    Title = "Auto Farm Level",
    Default = false,
    Callback = function(v)
        Config.AutoFarmLevel = v
        if v then CheckQuest() end
    end,
})

Tabs.AutoFarm:AddToggle("AutoHopStuck", {
    Title = "Auto Hop Stuck/No Monster",
    Default = true,
    Callback = function(v) Config.AutoHopStuck = v end,
})

spawn(function()
    while true do
        task.wait(0.3)
        if not Config.AutoFarmLevel then continue end
        pcall(function()
            CheckQuest()
            local hrp = lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")
            if not hrp then return end

            if (hrp.Position - CFrameQuest.Position).Magnitude > 1500 then
                hrp.CFrame = CFrameQuest * CFrame.new(0, 60, 0)
                task.wait(0.8)
            end

            if lp.Data.QuestProgress.Value == 0 and NameQuest \~= "" then
                rs.Remotes.CommF_:InvokeServer("StartQuest", NameQuest, LevelQuest)
            end

            for _, enemy in pairs(Workspace.Enemies:GetChildren()) do
                if enemy.Name == MonFarm and enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 then
                    local root = enemy:FindFirstChild("HumanoidRootPart")
                    if root then
                        if Config.BringMonster then root.CFrame = PosMon end
                        hrp.CFrame = root.CFrame * CFrame.new(0, 35, 0)
                    end
                end
            end
        end)
    end
end)

spawn(function()
    while true do
        task.wait(15)
        if Config.AutoFarmLevel and Config.AutoHopStuck then
            pcall(function()
                local hasTarget = false
                for _, e in pairs(Workspace.Enemies:GetChildren()) do
                    if e.Name == MonFarm and e:FindFirstChild("Humanoid") and e.Humanoid.Health > 0 then
                        hasTarget = true
                        break
                    end
                end
                if not hasTarget then
                    Fluent:Notify({Title="Hop Server", Content="No monster detected - Hopping now!"})
                    TeleportService:Teleport(game.PlaceId, lp)
                end
            end)
        end
    end
end)

lp.Data.Level.Changed:Connect(function() if Config.AutoFarmLevel then CheckQuest() end end)

-- High-End Tab
local HE = Tabs.HighEnd

HE:AddToggle("AutoMastery", { Title = "Auto Farm Mastery Fast", Default = false, Callback = function(v) Config.AutoMastery = v end })
HE:AddToggle("AutoMaterial", { Title = "Auto Farm Material (All Types)", Default = false, Callback = function(v) Config.AutoMaterial = v end })
HE:AddToggle("AutoBossHunt", { Title = "Auto Hunt Boss (All Endgame)", Default = false, Callback = function(v) Config.AutoBossHunt = v end })
HE:AddToggle("AutoMaxStats", { Title = "Auto Max Stats Points (Fruit)", Default = false, Callback = function(v) Config.AutoMaxStats = v end })

spawn(function()
    while true do
        task.wait(0.2)
        pcall(function()
            if Config.AutoMastery or Config.AutoMaterial or Config.AutoBossHunt then
                for _, enemy in pairs(Workspace.Enemies:GetChildren()) do
                    local nameLower = enemy.Name:lower()
                    if (Config.AutoBossHunt and (nameLower:find("king") or nameLower:find("prince") or nameLower:find("admiral") or nameLower:find("boss") or nameLower:find("cake") or nameLower:find("dough"))) or
                       (Config.AutoMastery and enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0) or
                       (Config.AutoMaterial and (nameLower:find("magma") or nameLower:find("factory") or nameLower:find("millionaire") or nameLower:find("fishman") or nameLower:find("cocoa") or nameLower:find("candy") or nameLower:find("chocolate"))) then
                        local root = enemy:FindFirstChild("HumanoidRootPart")
                        if root then
                            lp.Character.HumanoidRootPart.CFrame = root.CFrame * CFrame.new(0, 40, 0)
                            if Config.BringMonster then root.CFrame = PosMon end
                        end
                    end
                end
            end

            if Config.AutoMaxStats and lp.Data.Points.Value > 0 then
                rs.Remotes.CommF_:InvokeServer("AddPoint", "Demon Fruit", lp.Data.Points.Value)
            end

            if Config.AutoHaki then
                rs.Remotes.CommF_:InvokeServer("BuyHaki", "Buso")
                rs.Remotes.CommF_:InvokeServer("KenTalk", "Buy")
            end
        end)
    end
end)

-- Settings Tab
Tabs.Settings:AddButton({
    Title = "Reddem All Codes",
    Callback = function()
        local codes = {
            "LIGHTNINGABUSE", "KITT_RESET", "SUB2OFFICIALNOOBIE", "AXIORE", "BIGNEWS", "BLUXXY",
            "ENYU_IS_PRO", "FUDD10", "MAGICBUS", "STARCODEHEO", "SUB2UNCLEKIZARU", "Sub2CaptainMaui",
            "Sub2Fer999", "Sub2Daigrock", "TantaiGaming", "TheGreatAce", "Sub2NoobMaster123",
            "NOOB2ADMIN", "ADMINHACKED", "SECRET_ADMIN", "REWARDFUN", "Chandler"
        }
        for _, code in ipairs(codes) do
            rs.Remotes.Redeem:InvokeServer(code)
            task.wait(0.3)
        end
        Fluent:Notify({Title="Codes Redeemed", Content="All 2026 codes tried!"})
    end,
})

-- Extra Safety Tab
local Extra = Tabs.Extra

Extra:AddParagraph("Safety Features", "Anti-Kick active, Auto Haki on, Hop if stuck, Godmode experimental (use at own risk)")

Extra:AddToggle("AntiKickExtra", { Title = "Extra Anti-Kick (Idle Click)", Default = true, Callback = function(v)
    Config.AntiKick = v
end })

Extra:AddButton({
    Title = "Rejoin Server",
    Callback = function()
        TeleportService:Teleport(game.PlaceId, lp)
    end,
})

Extra:AddButton({
    Title = "Hop Server",
    Callback = function()
        TeleportService:Teleport(game.PlaceId, lp)
    end,
})

Window:SelectTab(1)
Fluent:Notify({
    Title = "redZinx Hub | Script Loaded! ",
    Content = "by TenshiDev!",
    Duration = 20
})

print("redZinx Ultra Extreme Loaded - Happy max level grinding!")
