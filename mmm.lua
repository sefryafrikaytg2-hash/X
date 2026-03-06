local _ScreenGui = Instance.new('ScreenGui')
local _ImageButton = Instance.new('ImageButton')
local _UICorner = Instance.new('UICorner')

_ScreenGui.Parent = game.CoreGui
_ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
_ImageButton.Parent = _ScreenGui
_ImageButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
_ImageButton.BorderSizePixel = 0
_ImageButton.Position = UDim2.new(0.10615778, 0, 0.16217947, 0)
_ImageButton.Size = UDim2.new(0, 40, 0, 40)
_ImageButton.Draggable = true
_ImageButton.Image = 'http://www.roblox.com/asset/?id= 103035663943878'
_UICorner.CornerRadius = UDim.new(1, 10)
_UICorner.Parent = _ImageButton

_ImageButton.MouseButton1Down:Connect(function()
    game:GetService('VirtualInputManager'):SendKeyEvent(true, Enum.KeyCode.End, false, game)
end)

local v4 = loadstring(game:HttpGet('https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua'))()

repeat
    wait()
until game:IsLoaded()

local v5 = v4:CreateWindow({
    Title = 'redZinx Hub',
    SubTitle = 'by TenshiDev',
    TabWidth = 157,
    Size = UDim2.fromOffset(450, 300),
    Acrylic = true,
    Theme = 'Amethyst',
    MinimizeKey = Enum.KeyCode.End,
})
local v6 = {
    Main0 = v5:AddTab({
        Title = 'Main',
    }),
    Main1 = v5:AddTab({
        Title = 'Auto Farm',
    }),
    Main2 = v5:AddTab({
        Title = 'Settings',
    }),
    Main3 = v5:AddTab({
        Title = 'Auto Fish',
    }),
    Main4 = v5:AddTab({
        Title = 'Visual',
    }),
    Main5 = v5:AddTab({
        Title = '',
    }),
    Main6 = v5:AddTab({
        Title = '',
    }),

}

v6.Main0:AddButton({
    Title = 'Discord',
    Description = 'TH\u{cd}CH HACK GAME',
    Callback = function()
        setclipboard('https://discord.com/invite/6Zv652ntHK')
    end,
})
v6.Main0:AddButton({
    Title = 'Youtuber',
    Description = 'ZEUSz Roblox',
    Callback = function()
        setclipboard('https://youtube.com/@zeuszrobloxx?si=MJ3FeiDIYfdIJe7o')
    end,
})
v6.Main0:AddButton({
    Title = 'Youtuber',
    Description = 'T TEAM',
    Callback = function()
        setclipboard('https://youtube.com/@zeuszrobloxx?si=MJ3FeiDIYfdIJe7o')
    end,
})
v6.Main1:AddButton({
    Title = 'BANANA PREMIUM',
    Description = '',
    Callback = function()
        repeat
            wait()
        until game:IsLoaded() and game.Players.LocalPlayer

        getgenv().Key = 'b71b5d0983696537d9fecf28'

        loadstring(game:HttpGet('https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/BananaHub.lua'))()
    end,
})
v6.Main1:AddButton({
    Title = 'MARU PREMIUM',
    Description = '',
    Callback = function()
        getgenv().Key = 'MARU-BR0M2-HVS46-IO2E-TCO9C-PB8B'
        getgenv().id = '808150168658378752'

        loadstring(game:HttpGet('https://raw.githubusercontent.com/xshiba/MaruBitkub/main/Mobile.lua'))()
    end,
})
v6.Main1:AddButton({
    Title = 'HOHO HUB PREMIUM',
    Description = '',
    Callback = function()
        getgenv().BETA_VERSION = true
    end,
})
v6.Main1:AddButton({
    Title = 'W_AZURE PREMIUM',
    Description = '',
    Callback = function()
        getgenv().BETA_VERSION = true

        loadstring(game:HttpGet('https://raw.githubusercontent.com/tlredz/Scripts/refs/heads/main/main.luau'))({
            JoinTeam = 'Pirates',
            Translator = true,
        })
    end,
})
v6.Main2:AddButton({
    Title = 'KAITUN BANANA',
    Description = '',
    Callback = function()
        repeat
            wait()
        until game:IsLoaded() and game.Players.LocalPlayer

        getgenv().Key = 'b71b5d0983696537d9fecf28'

        local v7 = getgenv()
        local v8 = {
            ['Hide UI'] = false,
        }
        local v9 = {
            Enabled = false,
            ['Delay Reset'] = 3,
        }
        local v10 = {
            Fruit = {
                Enabled = true,
                ['All Fruit'] = true,
                ['Select Fruit'] = {
                    Enabled = false,
                    Fruit = {},
                },
            },
        }

        v9['Item Dont Reset'] = v10
        v8['Reset Teleport'] = v9
        v8['White Screen'] = false
        v8['Lock Fps'] = {
            Enabled = false,
            FPS = 20,
        }
        v8['Get Items'] = {
            Saber = true,
            Godhuman = true,
            ['Skull Guitar'] = true,
            ['Mirror Fractal'] = true,
            ['Cursed Dual Katana'] = true,
            ['Upgrade Race V2-V3'] = true,
            ['Auto Pull Lever'] = true,
            ['Shark Anchor'] = true,
        }
        v8['Get Rare Items'] = {
            Rengoku = false,
            ['Dragon Trident'] = false,
            ['Pole (1st Form)'] = false,
            ['Gravity Blade'] = false,
        }
        v8['Farm Fragments'] = {
            Enabled = false,
            Fragment = 50000,
        }
        v8['Auto Chat'] = {
            Enabled = false,
            Text = '',
        }
        v8['Auto Summon Rip Indra'] = true
        v8['Select Hop'] = {
            ['Hop Server If Have Player Near'] = false,
            ['Hop Find Rip Indra Get Valkyrie Helm or Get Tushita'] = true,
            ['Hop Find Dough King Get Mirror Fractal'] = false,
            ['Hop Find Raids Castle [CDK]'] = true,
            ['Hop Find Cake Queen [CDK]'] = true,
            ['Hop Find Soul Reaper [CDK]'] = true,
            ['Hop Find Darkbeard [SG]'] = true,
            ['Hop Find Mirage [ Pull Lever ]'] = false,
        }
        v8['Farm Mastery'] = {
            Melee = false,
            Sword = false,
        }
        v8['Buy Haki'] = {
            Enhancement = false,
            Skyjump = true,
            ['Flash Step'] = true,
            Observation = true,
        }
        v8['Sniper Fruit Shop'] = {
            Enabled = true,
            Fruit = {
                'Leopard-Leopard',
                'Kitsune-Kitsune',
                'Dragon-Dragon',
                'Yeti-Yeti',
                'Gas-Gas',
            },
        }
        v8['Lock Fruit'] = {}
        v8.Webhook = {
            Enabled = false,
            WebhookUrl = '',
        }
        v7.SettingFarm = v8

        loadstring(game:HttpGet('https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/BananaCat-kaitunBF.lua'))()
    end,
})
v6.Main2:AddButton({
    Title = 'KAITUN MARU',
    Description = '',
    Callback = function()
        getgenv().Key = 'MARU-BR0M2-HVS46-IO2E-TCO9C-PB8B'
        getgenv().id = '808150168658378752'

        loadstring(game:HttpGet('https://raw.githubusercontent.com/xshiba/MaruBitkub/main/Mobile.lua'))()
    end,
})
v6.Main3:AddButton({
    Title = 'AUTO BOUNTY BANANA',
    Description = '',
    Callback = function()
        repeat
            wait()
        until game:IsLoaded() and game.Players.LocalPlayer

        getgenv().Key = 'b71b5d0983696537d9fecf28'

        loadstring(game:HttpGet('https://raw.githubusercontent.com/obiiyeuem/vthangsitink/refs/heads/main/BloxFruitPVP.lua'))()
    end,
})
v6.Main4:AddButton({
    Title = 'GAG BANANA',
    Description = '',
    Callback = function()
        repeat
            wait()
        until game:IsLoaded() and game.Players.LocalPlayer

        getgenv().Key = 'b71b5d0983696537d9fecf28'

        loadstring(game:HttpGet('https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/BananaHub.lua'))()
    end,
})
