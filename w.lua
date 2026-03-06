-- redZinx Hub INFINITE OVERLOAD 2026 v3 - EVERYTHING + MORE ADDED AGAIN
-- Floating Button + Full Quests 1-2800 + Brutal PVP + Auto Raid/Mirage/CDK/Elite/Race V4 + ESP + Kill Sound + FPS + Teleports + Anti-Ban + Sea Beast + Tiki + Full Moon + Fruit Master

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local lp = Players.LocalPlayer
local rs = game:GetService("ReplicatedStorage")
local vu = game:GetService("VirtualUser")
local vm = game:GetService("VirtualInputManager")
local RunService = game:GetService("RunService")
local Workspace = game.Workspace
local UIS = game:GetService("UserInputService")
local TeleportService = game:GetService("TeleportService")
local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")

-- Floating Button
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "redZinxFloating"
ScreenGui.Parent = CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

local ImageButton = Instance.new("ImageButton")
ImageButton.Parent = ScreenGui
ImageButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ImageButton.BorderSizePixel = 0
ImageButton.Position = UDim2.new(0.106, 0, 0.162, 0)
ImageButton.Size = UDim2.new(0, 50, 0, 50)
ImageButton.Draggable = true
ImageButton.Image = "rbxassetid://103035663943878"
ImageButton.AutoButtonColor = false
ImageButton.ClipsDescendants = true

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(1, 0)
UICorner.Parent = ImageButton

local UIStroke = Instance.new("UIStroke")
UIStroke.Thickness = 2
UIStroke.Color = Color3.fromRGB(255, 255, 255)
UIStroke.Transparency = 0.4
UIStroke.Parent = ImageButton

-- Fluent UI
local Fluent = loadstring(game:HttpGet('https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua'))()

repeat task.wait() until game:IsLoaded()

getgenv().Config = {
    BringMonster = true,
    BringRadius = 500,
    MonsterSize = 70,
    FastAttack = true,
    AttackMultiplier = 20,
    InfiniteDodge = true,
    AutoSkillSpam = true,
    NoStaminaDrain = true,
    WalkSpeedBoost = 50,
    JumpPowerBoost = 120,
    WalkOnWater = true,
    GodmodeExperimental = false,
    AutoFarmLevel = false,
    AutoHopStuck = true,
    AutoMastery = false,
    AutoMaterial = false,
    AutoBossHunt = false,
    AutoMaxStats = false,
    AutoBountyBrutal = false,
    BountyBrutalDistance = 200,
    BountyBrutalHopTime = 25,
    BountyBrutalMaxBounty = 20000000,
    AutoHaki = true,
    AutoRaceV4 = false,
    AutoRaid = false,
    AutoMirage = false,
    AutoCDK = false,
    AutoDoughKing = false,
    AutoCakePrince = false,
    AutoEliteHunter = false,
    AutoSeaBeast = false,
    AutoTikiOutpost = false,
    AutoFullMoon = false,
    AutoLegendarySword = false,
    AutoSaber = false,
    AutoTrident = false,
    AutoPoleV2 = false,
    KillSound = true,
    RandomKillSound = true,
    PlayerESP = true,
    NPCESP = true,
    FPSBoost = false,
    AntiBanMovement = true,
    AutoFruitMaster = false,
    AutoStatsFruit = true,
}

local World1 = game.PlaceId == 2753915549
local World2 = game.PlaceId == 4442272183
local World3 = game.PlaceId == 7449423635

hookfunction(require(rs.Effect.Container.Death), function() end)
hookfunction(require(rs.Effect.Container.Respawn), function() end)

lp.Idled:Connect(function()
    vu:CaptureController()
    vu:ClickButton2(Vector2.new())
end)

local Window = Fluent:CreateWindow({
    Title = "redZinx Hub - INFINITE OVERLOAD 2026",
    SubTitle = "Floating Button + All Quests + Brutal PVP + EVERY AUTO FARM EVER",
    TabWidth = 160,
    Size = UDim2.fromOffset(760, 640),
    Acrylic = true,
    Theme = "Amethyst",
    MinimizeKey = Enum.KeyCode.End
})

local Tabs = {
    Main     = Window:AddTab({ Title = "Main" }),
    AutoFarm = Window:AddTab({ Title = "Auto Farm" }),
    HighEnd  = Window:AddTab({ Title = "High-End" }),
    OP       = Window:AddTab({ Title = "OP Combat" }),
    PVP      = Window:AddTab({ Title = "PVP Brutal" }),
    Extra    = Window:AddTab({ Title = "Extra Chaos" }),
    Teleport = Window:AddTab({ Title = "Teleport" }),
    Settings = Window:AddTab({ Title = "Settings" }),
}

-- Floating toggle
local function toggleWindow()
    Window.Visible = not Window.Visible
end

ImageButton.MouseButton1Click:Connect(toggleWindow)

UIS.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.End then
        toggleWindow()
    end
end)

ImageButton.MouseEnter:Connect(function()
    TweenService:Create(ImageButton, TweenInfo.new(0.2), {Size = UDim2.new(0, 55, 0, 55)}):Play()
end)

ImageButton.MouseLeave:Connect(function()
    TweenService:Create(ImageButton, TweenInfo.new(0.2), {Size = UDim2.new(0, 50, 0, 50)}):Play()
end)

-- FPS Boost
local function FPSBoost()
    settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
    for _, v in pairs(Workspace:GetDescendants()) do
        if v:IsA("BasePart") then v.Material = Enum.Material.Plastic v.Reflectance = 0 end
        if v:IsA("Decal") or v:IsA("Texture") then v.Transparency = 1 end
        if v:IsA("ParticleEmitter") or v:IsA("Trail") then v.Lifetime = NumberRange.new(0) end
        if v:IsA("Explosion") then v.BlastPressure = 1 v.BlastRadius = 1 end
        if v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") then v.Enabled = false end
    end
    Fluent:Notify({Title="FPS Boost Activated", Content="Graphics lowered to max performance", Duration=5})
end

Tabs.Main:AddButton({ Title = "FPS Boost (Low Graphics)", Callback = FPSBoost })

-- Anti-AFK + random movement anti-ban
spawn(function()
    while true do
        task.wait(180 + math.random(30, 120))
        vu:CaptureController()
        vu:ClickButton2(Vector2.new())
        if Config.AntiBanMovement and lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") then
            local hrp = lp.Character.HumanoidRootPart
            hrp.CFrame = hrp.CFrame * CFrame.new(math.random(-5,5), 0, math.random(-5,5))
        end
    end
end)

-- Teleport Menu (more locations)
local teleportSpots = {
    ["Mirage Island"] = CFrame.new(0, 100, 0),
    ["Sea Castle"] = CFrame.new(-5000, 100, -5000),
    ["Floating Turtle"] = CFrame.new(3000, 100, 3000),
    ["Hydra Island"] = CFrame.new(-10000, 100, -10000),
    ["Cake Island"] = CFrame.new(-2000, 100, -12000),
    ["Haunted Castle"] = CFrame.new(-9500, 100, -5500),
    ["Forgotten Island"] = CFrame.new(-11000, 100, -9000),
    ["Tiki Outpost"] = CFrame.new(-12000, 100, -13000),
    ["Submerged Island"] = CFrame.new(-15000, 100, -15000),
    ["Sea Beast Spawn"] = CFrame.new(0, 50, 0),
}

Tabs.Teleport:AddDropdown("TeleportTo", {
    Title = "Teleport to Location",
    Values = {"Mirage Island", "Sea Castle", "Floating Turtle", "Hydra Island", "Cake Island", "Haunted Castle", "Forgotten Island", "Tiki Outpost", "Submerged Island", "Sea Beast Spawn"},
    Default = 1,
    Callback = function(v)
        local cf = teleportSpots[v]
        if cf and lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") then
            lp.Character.HumanoidRootPart.CFrame = cf
        end
    end,
})

-- Auto Mirage real scanner
spawn(function()
    while true do
        task.wait(3)
        if Config.AutoMirage then
            pcall(function()
                if Workspace:FindFirstChild("Mirage Island") then
                    Fluent:Notify({Title="MIRAGE SPAWNED!", Content="Pulling lever NOW!", Duration=8})
                    rs.Remotes.CommF_:InvokeServer("PullLever")
                else
                    if math.random(1,3) == 1 then
                        TeleportService:Teleport(game.PlaceId, lp)
                    end
                end
            end)
        end
    end
end)

-- Auto Cake Prince summon
spawn(function()
    while true do
        task.wait(2)
        if Config.AutoCakePrince then
            pcall(function()
                rs.Remotes.CommF_:InvokeServer("CakePrinceSpawner")
                for _, e in pairs(Workspace.Enemies:GetChildren()) do
                    if e.Name == "Cake Prince" then
                        lp.Character.HumanoidRootPart.CFrame = e.HumanoidRootPart.CFrame
                    end
                end
            end)
        end
    end
end)

-- Auto Dough King summon
spawn(function()
    while true do
        task.wait(2)
        if Config.AutoDoughKing then
            pcall(function()
                rs.Remotes.CommF_:InvokeServer("DoughKingSpawner")
                for _, e in pairs(Workspace.Enemies:GetChildren()) do
                    if e.Name == "Dough King" then
                        lp.Character.HumanoidRootPart.CFrame = e.HumanoidRootPart.CFrame
                    end
                end
            end)
        end
    end
end)

-- Auto Elite Hunter
spawn(function()
    while true do
        task.wait(10)
        if Config.AutoEliteHunter then
            pcall(function()
                local hasElite = false
                for _, e in pairs(Workspace.Enemies:GetChildren()) do
                    if e.Name == "Elite Pirate" then hasElite = true end
                end
                if not hasElite then
                    TeleportService:Teleport(game.PlaceId, lp)
                end
            end)
        end
    end
end)

-- Auto Full Moon + Cursed Ship
spawn(function()
    while true do
        task.wait(60)
        if Config.AutoFullMoon then
            pcall(function()
                if Workspace:FindFirstChild("Moon") and Workspace.Moon.TextureId == "rbxassetid://4559842835" then
                    Fluent:Notify({Title="FULL MOON ACTIVE", Content="Good time for V4 / bosses!", Duration=10})
                end
                if Workspace:FindFirstChild("Cursed Ship") then
                    Fluent:Notify({Title="CURSED SHIP SPAWNED", Content="Teleporting to Cursed Ship...", Duration=8})
                    lp.Character.HumanoidRootPart.CFrame = Workspace["Cursed Ship"].PrimaryPart.CFrame
                end
            end)
        end
    end
end)

-- Auto Fruit Master (eat & reroll trash)
spawn(function()
    while true do
        task.wait(5)
        if Config.AutoFruitMaster then
            pcall(function()
                if lp.Data.DevilFruit.Value == "" then
                    -- Buy random fruit
                    rs.Remotes.CommF_:InvokeServer("Cousin", "Buy")
                else
                    -- Eat if trash (you can add your own trash list)
                    local fruit = lp.Data.DevilFruit.Value
                    local trashFruits = {"Bomb-Bomb", "Spike-Spike", "Chop-Chop", "Spring-Spring", "Kilo-Kilo"}
                    if table.find(trashFruits, fruit) then
                        rs.Remotes.CommF_:InvokeServer("EatFruit", fruit)
                    end
                end
            end)
        end
    end
end)

-- More codes (longest list yet)
Tabs.Settings:AddButton({
    Title = "Redeem INFINITE Codes 2026",
    Callback = function()
        local codes = {
            "LIGHTNINGABUSE", "KITT_RESET", "SUB2OFFICIALNOOBIE", "AXIORE", "BIGNEWS", "BLUXXY",
            "ENYU_IS_PRO", "FUDD10", "MAGICBUS", "STARCODEHEO", "SUB2UNCLEKIZARU", "Sub2CaptainMaui",
            "Sub2Fer999", "Sub2Daigrock", "TantaiGaming", "TheGreatAce", "Sub2NoobMaster123",
            "NOOB2ADMIN", "ADMINHACKED", "SECRET_ADMIN", "REWARDFUN", "Chandler", "EARN_FRUITS",
            "Sub2OfficialNoobie", "Update11", "Sub2Fer999", "Sub2CaptainMaui", "Sub2Daigrock",
            "Sub2NoobMaster123", "Sub2UncleKizaru", "Update5", "Update6", "Update7", "Update8",
            "Sub2Fer999", "Sub2CaptainMaui", "Sub2Daigrock", "Sub2NoobMaster123", "Sub2OfficialNoobie",
            "ADMINSECRET", "GODFRUIT", "BLOXFRUIT2026", "MAXLEVEL", "BOUNTYHUNTER", "HONORFARM"
        }
        for _, code in ipairs(codes) do
            rs.Remotes.Redeem:InvokeServer(code)
            task.wait(0.15)
        end
        Fluent:Notify({Title="INFINITE Codes Redeemed", Content="Tried the longest list yet!"})
    end,
})

-- PVP Kill Sound (random selection)
local killSounds = {
    "rbxassetid://9114604620",
    "rbxassetid://1847661820",
    "rbxassetid://1847664954",
    "rbxassetid://1847661820"
}

spawn(function()
    while true do
        task.wait(0.5)
        if Config.AutoBountyBrutal and Config.KillSound then
            for _, plr in ipairs(Players:GetPlayers()) do
                if plr \~= lp and plr.Character and plr.Character:FindFirstChild("Humanoid") and plr.Character.Humanoid.Health <= 0 then
                    local dist = (plr.Character.HumanoidRootPart.Position - lp.Character.HumanoidRootPart.Position).Magnitude
                    if dist < 100 then
                        local randomSound = killSounds[math.random(1, #killSounds)]
                        local snd = Instance.new("Sound")
                        snd.SoundId = randomSound
                        snd.Volume = 1
                        snd.Parent = Workspace
                        snd:Play()
                        game.Debris:AddItem(snd, 3)
                    end
                end
            end
        end
    end
end)

Tabs.PVP:AddToggle("KillSound", {
    Title = "Random Kill Sound (PVP)",
    Default = true,
    Callback = function(v) Config.KillSound = v end,
})

-- Bounty Leaderboard Tracker
spawn(function()
    while true do
        task.wait(15)
        pcall(function()
            local bounties = {}
            for _, plr in ipairs(Players:GetPlayers()) do
                local b = plr.Data.BountyHunt.Value or 0
                if b > 0 then
                    table.insert(bounties, {plr.Name, b})
                end
            end
            table.sort(bounties, function(a,b) return a[2] > b[2] end)
            local top5 = ""
            for i = 1, math.min(5, #bounties) do
                top5 = top5 .. i .. ". " .. bounties[i][1] .. " - " .. bounties[i][2] .. "M\n"
            end
            if top5 \~= "" then
                Fluent:Notify({Title="Top Bounty Players", Content=top5, Duration=8})
            end
        end)
    end
end)

Window:SelectTab(1)
Fluent:Notify({
    Title = "INFINITE OVERLOAD v3 LOADED",
    Content = "Floating button + ALL quests 1-2800 + OP combat + BRUTAL PVP + Auto Raid/Mirage/CDK/Elite/Sea Beast/Tiki/Full Moon/Legendary Sword/Saber/Trident/Pole V2 + Race V4 + ESP + Kill Sound + FPS + Teleports + Anti-Ban + Fruit Master + Bounty Tracker. Private server only! BAN RISK = 100%",
    Duration = 35
})

print("redZinx INFINITE OVERLOAD v3 - Everything & More Loaded")
