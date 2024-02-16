local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/RedzLibV5/main/Source.Lua"))()
local Window = redzlib:MakeWindow({
  Title = "redz Hub : Blox Fruits",
  SubTitle = "by redz9999",
  SaveFolder = "redz Hub | Blox Fruits.lua"
})

local AFKOptions = {}

local Discord = Window:MakeTab({"Discord", "Info"})
Discord:AddDiscordInvite({
  Name = "redz Hub | Community",
  Description = "Join our discord community to receive information about the next update",
  Logo = "rbxassetid://15298567397",
  Invite = "https://discord.gg/7aR7kNVt4g"
})
local MainFarm = Window:MakeTab({"Farm", "Home"})
if Sea3 then
  local AutoSea = Window:MakeTab({"Sea", "Waves"})
  AutoSea:AddSection({"Kitsune"})
  local KILabel = AutoSea:AddParagraph({"Kitsune Island : not spawn"})
  AutoSea:AddToggle({Name = "Auto Kitsune Island",Callback = function(Value)
    getgenv().AutoKitsuneIsland = Value;AutoKitsuneIsland()
  end})
  AutoSea:AddToggle({Name = "Auto Trade Azure Ember",Callback = function(Value)
    getgenv().TradeAzureEmber = Value
    task.spawn(function()
      local Modules = ReplicatedStorage:WaitForChild("Modules", 9e9)
      local Net = Modules:WaitForChild("Net", 9e9)
      local KitsuneRemote = Net:WaitForChild("RF/KitsuneStatuePray", 9e9)
      
      while getgenv().TradeAzureEmber do task.wait(1)
        KitsuneRemote:InvokeServer()
      end
    end)
  end})
  task.spawn(function()
    local Map = workspace:WaitForChild("Map", 9e9)
    task.spawn(function()
      while task.wait() do
        if Map:FindFirstChild("KitsuneIsland") then
          local plrPP = Player.Character and Player.Character.PrimaryPart
          if plrPP then
            Distance = tostring(math.floor((plrPP.Position - Map.KitsuneIsland.WorldPivot.p).Magnitude / 3))
          end
        end
      end
    end)
    
    while task.wait() do
      if Map:FindFirstChild("KitsuneIsland") then
        KILabel:SetTitle("Kitsune Island : Spawned | Distance : " .. Distance)
      else
        KILabel:SetTitle("Kitsune Island : not Spawn")
      end
    end
  end)
  AutoSea:AddSection({"Sea"})
  AutoSea:AddToggle({Name = "Auto Farm Sea",Callback = function(Value)
    getgenv().AutoFarmSea = Value;AutoFarmSea()
  end})
  AutoSea:AddButton({Name = "Buy New Boat",Callback = function()
    BuyNewBoat()
  end})
  AutoSea:AddSection({"Material"})
  AutoSea:AddToggle({"Auto Wood Planks", false, function(Value)
    getgenv().AutoWoodPlanks = Value
    task.spawn(function()
      local Map = workspace:WaitForChild("Map", 9e9)
      local BoatCastle = Map:WaitForChild("Boat Castle", 9e9)
      
      local function TreeModel()
        for _,Model in pairs(BoatCastle["IslandModel"]:GetChildren()) do
          if Model.Name == "Model" and Model:FindFirstChild("Tree") then
            return Model
          end
        end
      end
      
      local function GetTree()
        local Tree = TreeModel()
        if Tree then
          local Nearest = math.huge
          local selected
          for _,tree in pairs(Tree:GetChildren()) do
            local plrPP = Player.Character and Player.Character.PrimaryPart
            if tree and tree.PrimaryPart and tree.PrimaryPart.Anchored then
              if plrPP and (plrPP.Position - tree.PrimaryPart.Position).Magnitude < Nearest then
                Nearest = (plrPP.Position - tree.PrimaryPart.Position).Magnitude
                selected = tree
              end
            end
          end
          return selected
        end
      end
      
      local RandomEquip = ""
      task.spawn(function()
        while getgenv().AutoWoodPlanks do
          if VerifyToolTip("Melee") then
            RandomEquip = "Melee"task.wait(2)
          end
          if VerifyToolTip("Blox Fruit") then
            RandomEquip = "Blox Fruit"task.wait(3)
          end
          if VerifyToolTip("Sword") then
            RandomEquip = "Sword"task.wait(2)
          end
          if VerifyToolTip("Gun") then
            RandomEquip = "Gun"task.wait(2)
          end
        end
      end)
      
      while getgenv().AutoWoodPlanks do task.wait()
        local Tree = GetTree()EquipToolTip(RandomEquip)
        
        if Tree and Tree.PrimaryPart then
          PlayerTP(Tree.PrimaryPart.CFrame)
          local plrPP = Player.Character and Player.Character.PrimaryPart
          if plrPP and (plrPP.Position - Tree.PrimaryPart.Position).Magnitude < 10 then
            if getgenv().SeaSkillZ then
              KeyboardPress("Z")
            end
            if getgenv().SeaSkillX then
              KeyboardPress("X")
            end
            if getgenv().SeaSkillC then
              KeyboardPress("C")
            end
            if getgenv().SeaSkillV then
              KeyboardPress("V")
            end
            if getgenv().SeaSkillF then
              KeyboardPress("F")
            end
            if getgenv().SeaAimBotSkill then
              AimBotPart(Tree.PrimaryPart)
            end
          end
        end
      end
    end)
  end})
  AutoSea:AddSection({"Panic Mode"})
  AutoSea:AddSlider({Name = "Select Health",Min = 20,Max = 70,Default = 25,Callback = function(Value)
    getgenv().HealthPanic = Value
  end})
  AutoSea:AddToggle({"Panic Mode", true, function(Value)
    getgenv().PanicMode = Value
  end, "Sea/PanicMode"})
  AutoSea:AddSection({"Farm Select"})
  AutoSea:AddParagraph({"Fish"})
  AutoSea:AddToggle({Name = "Terrorshark", Flag = "Sea/TerrorShark", Default = true,Callback = function(Value)
    getgenv().Terrorshark = Value
  end})
  AutoSea:AddToggle({Name = "Piranha", Flag = "Sea/Piranha", Default = true,Callback = function(Value)
    getgenv().Piranha = Value
  end})
  AutoSea:AddToggle({Name = "Fish Crew Member", Flag = "Sea/FishCrewMember", Default = true,Callback = function(Value)
    getgenv().FishCrewMember = Value
  end})
  AutoSea:AddToggle({Name = "Shark", Flag = "Sea/Shark", Default = true,Callback = function(Value)
    getgenv().Shark = Value
  end})
  AutoSea:AddParagraph({"Boats"})
  AutoSea:AddToggle({Name = "Pirate Brigade", Flag = "Sea/PirateBrigade", Default = true,Callback = function(Value)
    getgenv().PirateBrigade = Value
  end})
  AutoSea:AddToggle({Name = "Pirate Grand Brigade", Flag = "Sea/PirateGrandBrigade", Default = true,Callback = function(Value)
    getgenv().PirateGrandBrigade = Value
  end})
  AutoSea:AddToggle({Name = "Fish Boat", Flag = "Sea/FishBoat", Default = true,Callback = function(Value)
    getgenv().FishBoat = Value
  end})
  --[[AddTextLabel(AutoSea, {"Sea Beast"})
  AutoSea:AddToggle({Name = "Sea Beast",Default = true,Callback = function(Value)
    getgenv().SeaBeast = Value
  end})
  AutoSea:AddToggle({Name = "Triple Sea Beast",Default = true,Callback = function(Value)
    getgenv().SeaBeastTriple = Value
  end})]]
  AutoSea:AddSection({"Skill"})
  AutoSea:AddToggle({Name = "AimBot Skill Enemie", Flag = "Mastery/Aimbot", Default = true,Callback = function(Value)
    getgenv().SeaAimBotSkill = Value
  end})
  AutoSea:AddToggle({Name = "Skill Z", Flag = "Mastery/Z", Default = true,Callback = function(Value)
    getgenv().SeaSkillZ = Value
  end})
  AutoSea:AddToggle({Name = "Skill X", Flag = "Mastery/X", Default = true,Callback = function(Value)
    getgenv().SeaSkillX = Value
  end})
  AutoSea:AddToggle({Name = "Skill C", Flag = "Mastery/C", Default = true,Callback = function(Value)
    getgenv().SeaSkillC = Value
  end})
  AutoSea:AddToggle({Name = "Skill V", Flag = "Mastery/V", Default = true,Callback = function(Value)
    getgenv().SeaSkillV = Value
  end})
  AutoSea:AddToggle({Name = "Skill F", Flag = "Mastery/F", Callback = function(Value)
    getgenv().SeaSkillF = Value
  end})
  AutoSea:AddSection({"NPCs"})
  AutoSea:AddToggle({Name = "Teleport To Shark Hunter",Callback = function(Value)
    getgenv().NPCtween = Value
    task.spawn(function()
      while getgenv().NPCtween do task.wait()
        PlayerTP(CFrame.new(-16526, 108, 752))
      end
    end)
  end})
  AutoSea:AddToggle({Name = "Teleport To Beast Hunter",Callback = function(Value)
    getgenv().NPCtween = Value
    task.spawn(function()
      while getgenv().NPCtween do task.wait()
        PlayerTP(CFrame.new(-16281, 73, 263))
      end
    end)
  end})
  AutoSea:AddToggle({Name = "Teleport To Spy",Callback = function(Value)
    getgenv().NPCtween = Value
    task.spawn(function()
      while getgenv().NPCtween do task.wait()
        PlayerTP(CFrame.new(-16471, 528, 539))
      end
    end)
  end})
  AutoSea:AddSection({"Configs"})
  AutoSea:AddDropdown({
    Name = "Tween Sea Level",
    Options = {"1", "2", "3", "4", "5", "6", "inf"},
    Default = {"6"},
    Flag = "Sea/SeaLevel",
    Callback = function(Value)
      getgenv().SeaLevelTP = Value
    end
  })
  AutoSea:AddSlider({
    Name = "Boat Tween Speed",
    Min = 100,
    Max = 300,
    Increase = 10,
    Default = 250,
    Flag = "Sea/BoatSpeed",
    Callback = function(Value)
      getgenv().SeaBoatSpeed = Value
    end
  })
end
if Sea3 and IsOwner then
  local MirageTab = Window:MakeTab({"Race V4", ""})
  
  MirageTab:AddToggle({"Auto Pull Lever", false, function(Value)
    
  end})
  
  MirageTab:AddToggle({"Auto Stone Puzzle", false, function(Value)
    
  end})
  
  MirageTab:AddSection({"Auto Mirage"})
  
  MirageTab:AddToggle({"Auto Find Mirage", false, function(Value)
    
  end})
  
  MirageTab:AddToggle({"Auto Gear Puzzle", false, function(Value)
    getgenv().AutoMiragePuzzle = Value
    
    local function GetGear()
      
    end
    
    local function LookToMoon()
      local MoonDirection = Lighting:GetMoonDirection()
      local LookToPos = Camera.CFrame.p + moonDir * 100
      Camera.CFrame = CFrame.lookAt(Camera.CFrame.p, LookToPos0)
    end
    
    local Connection = RunService.Heartbeat:Connect(LookToMoon)
    while getgenv().AutoMiragePuzzle do task.wait()end
    if Connection then
      Connection:Disconnect()
    end
  end})
  
  MirageTab:AddSection({"Auto Race"})
  
  MirageTab:AddToggle({"Auto Finish Trial", false, function(Value)
    getgenv().AutoFinishTrial = Value
    task.spawn(function()
      local PlayerRace
      task.spawn(function()
        while getgenv().AutoFinishTrial do task.wait()
          PlayerRace = Player.Data.Race.Value
        end
      end)
      
      while getgenv().AutoFinishTrial do task.wait()
        if PlayerRace and typeof(PlayerRace) == "string" then
          if PlayerRace == "Cyborg" then
            PlayerTP(CFrame.new(28654, 14898, -30))
          elseif PlayerRace == "Ghoul" then
            KillAura()
          elseif PlayerRace == "Human" then
            KillAura()
          elseif PlayerRace == "Mink" then
            for _,part in pairs(workspace:GetDescendants()) do
              if part.Name == "StartPoint" then
                PlayerTP(part.CFrame)
              end
            end
          elseif PlayerRace == "Skypiea" then
            pcall(function()
              for _,part in pairs(workspace.Map.SkyTrial.Model:GetDescendants()) do
                if part.Name ==  "snowisland_Cylinder.081" then
                  PlayerTP(part.CFrame)
                end
              end
            end)
          end
        end
      end
    end)
  end})
end
local QuestsTabs = Window:MakeTab({"Quests/Items", "Swords"})
local FruitAndRaid = Window:MakeTab({"Fruit/Raid", "Cherry"})
--[[local Informacoes = Window:MakeTab({"Info", "Search"})
Informacoes:AddSection({"Player"})
local Nerd = Informacoes:AddParagraph({"Nerd < Accessories Info >"})
task.spawn(function()
  while task.wait() do
    Nerd:SetDesc(FireRemote("Nerd"))
  end
end)]]
if PlayerLevel.Value < MaxLavel then
  local StatsTab = Window:MakeTab({"Stats", "signal"})
  local PointsSlider, Melee, Defense, Sword, Gun, DemonFruit = 1
  
  local function AutoStats()
    local function AddStats(Stats)
      if Player.Data.Points.Value >= 1 then
        local Points = math.clamp(PointsSlider, 1, Player.Data.Points.Value)
			  FireRemote("AddPoint", Stats, Points)
			end
    end
    
    while getgenv().AutoStats do task.wait()
      if Melee then
        AddStats("Melee")
      end
      if Defense then
        AddStats("Defense")
      end
      if Sword then
        AddStats("Sword")
      end
      if Gun then
        AddStats("Gun")
      end
      if DemonFruit then
        AddStats("Demon Fruit")
      end
    end
  end
  
  StatsTab:AddToggle({
    Name = "Auto Stats",
    Flag = "Stats/AutoStats",
    Callback = function(Value)
      getgenv().AutoStats = Value
      AutoStats()
    end
  })
  
  StatsTab:AddSlider({
    Name = "Select Points",
    Flag = "Stats/SelectPoints",
    Min = 1,
    Max = 100,
    Increase = 1,
    Default = 1,
    Callback = function(Value)
      PointsSlider = Value
    end
  })
  
  StatsTab:AddSection({"Select Stats"})
  
  StatsTab:AddToggle({Name = "Melee", Flag = "Stats/SelectMelee", Callback = function(Value)
    Melee = Value
  end})
  StatsTab:AddToggle({Name = "Defense", Flag = "Stats/SelectDefense", Callback = function(Value)
    Defense = Value
  end})
  StatsTab:AddToggle({Name = "Sword", Flag = "Stats/SelectSword", Callback = function(Value)
    Sword = Value
  end})
  StatsTab:AddToggle({Name = "Gun", Flag = "Stats/SelectGun", Callback = function(Value)
    Gun = Value
  end})
  StatsTab:AddToggle({Name = "Demon Fruit", Flag = "Stats/SelectDemonFruit", Callback = function(Value)
    DemonFruit = Value
  end})
end
local Teleport = Window:MakeTab({"Teleport", "Locate"})
local Visual = Window:MakeTab({"Visual", "User"})
local Shop = Window:MakeTab({"Shop", "ShoppingCart"})
local Misc = Window:MakeTab({"Misc", "Settings"})

MainFarm:AddDropdown({
  Name = "Farm Tool",
  Options = {"Melee", "Sword", "Blox Fruit"},
  Default = {"Melee"},
  Flag = "Main/FarmTool",
  Callback = function(Value)
    getgenv().FarmTool = Value
  end
})

if PlayerLevel.Value >= MaxLavel and Sea3 then
  MainFarm:AddToggle({
    Name = "Start Multi Farm < BETA >",
    Callback = function(Value)
      table.foreach(AFKOptions, function(_,Val)
        task.spawn(function()
          Val:Set(Value)
        end)
      end)
    end
  })
end

MainFarm:AddSection({"Farm"})

MainFarm:AddToggle({"Auto Farm Level", false, function(Value)
  getgenv().AutoFarm_Level = Value;AutoFarm_Level()
end, Description = "Lavel Farm"})

MainFarm:AddToggle({"Auto Farm Nearest", false, function(Value)
  getgenv().AutoFarmNearest = Value;AutoFarmNearest()
end})

if Sea3 then
  table.insert(AFKOptions, MainFarm:AddToggle({"Auto Pirates Sea", false, function(Value)
    getgenv().AutoPiratesSea = Value;AutoPiratesSea()
  end}))
elseif Sea2 then
  MainFarm:AddToggle({"Auto Factory", false, function(Value)
    getgenv().AutoFactory = Value;AutoFactory()
  end})
end

--[[MainFarm:AddSection({"Christmas"})

local TimeLabel = MainFarm:AddLabel({"Text", "Time for next gift : nil"})

task.spawn(function()
  local Counter = workspace:WaitForChild("Countdown", 9e9)
  local SurfaceGui = Counter:WaitForChild("SurfaceGui", 9e9)
  local TextLabel = SurfaceGui:WaitForChild("TextLabel", 9e9)
  
  while task.wait() do
    TimeLabel:SetTitle("Time to Next gift : " .. TextLabel.Text)
    
    if TextLabel.Text ~= "STARTING!" then
      local TimerL, Timer = TextLabel.Text:split(":"), 0
      if tonumber(TimerL[2]) >= 1 then
        Timer = tonumber(TimerL[2]) * 60
      end
      Timer = Timer + tonumber(TimerL[3])
      
      getgenv().TimeToGift = Timer
    else
      getgenv().TimeToGift = 0
    end
  end
end)

if PlayerLevel.Value >= MaxLavel and Sea3 then
  MainFarm:AddToggle({"Auto Farm Candy", false, function(Value)
    getgenv().AutoCandy = Value
    task.spawn(function()
      local Enemies1 = workspace:WaitForChild("Enemies", 9e9)
      local Enemies2 = ReplicatedStorage
      
      local function GetProxyNPC()
        local Distance = math.huge
        local NPC = nil
        local plrChar = Player and Player.Character and Player.Character.PrimaryPart
        
        for _,npc in pairs(Enemies1:GetChildren()) do
          if npc.Name == "Isle Champion" or npc.Name == "Sun-kissed Warrior" or npc.Name == "Island Boy" or npc.Name == "Isle Outlaw" then
            if plrChar and npc and npc:FindFirstChild("HumanoidRootPart") and (plrChar.Position - npc.HumanoidRootPart.Position).Magnitude <= Distance then
              Distance = (plrChar.Position - npc.HumanoidRootPart.Position).Magnitude
              NPC = npc
            end
          end
        end
        for _,npc in pairs(Enemies2:GetChildren()) do
          if npc.Name == "Isle Champion" or npc.Name == "Sun-kissed Warrior" or npc.Name == "Island Boy" or npc.Name == "Isle Outlaw" then
            if plrChar and npc and npc:FindFirstChild("HumanoidRootPart") and (plrChar.Position - npc.HumanoidRootPart.Position).Magnitude <= Distance then
              Distance = (plrChar.Position - npc.HumanoidRootPart.Position).Magnitude
              NPC = npc
            end
          end
        end
        return NPC
      end
      
      while getgenv().AutoCandy do task.wait()
        if Configure("Candy") then
        else
          local Enemie = GetProxyNPC()
          if Enemie then
            PlayerTP(Enemie.HumanoidRootPart.CFrame + getgenv().FarmPos)
            pcall(function()PlayerClick()ActiveHaki()EquipTool()BringNPC(Enemie, true)end)
          end
        end
      end
    end)
  end})
end

MainFarm:AddToggle({"Auto Gift", false, function(Value)
  getgenv().AutoGift = Value
  task.spawn(function()
    local function GetGift()
      for _,part in pairs(workspace["_WorldOrigin"]:GetChildren()) do
        if part.Name == "Present" then
          if part:FindFirstChild("Box") and part.Box:FindFirstChild("ProximityPrompt") then
            return part, part.Box.ProximityPrompt
          end
        end
      end
    end
    
    while getgenv().AutoGift do task.wait()
      local Gift, Prompt = GetGift()
      
      if Gift and Gift.PrimaryPart then
        PlayerTP(Gift.PrimaryPart.CFrame)
        if Prompt then
          fireproximityprompt(Prompt)
        end
      elseif getgenv().TimeToGift < 90 then
        if Sea3 then
          PlayerTP(CFrame.new(-1076, 14, -14437))
        elseif Sea2 then
          PlayerTP(CFrame.new(-5219, 15, 1532))
        elseif Sea1 then
          PlayerTP(CFrame.new(1007, 15, -3805))
        end
      end
    end
  end)
end})]]

if Sea3 then
  MainFarm:AddSection({"Bone"})
  
  table.insert(AFKOptions, MainFarm:AddToggle({
    Name = "Auto Farm Bone",
    Callback = function(Value)
      getgenv().AutoFarmBone = Value
      AutoFarmBone()
    end
  }))
  
  table.insert(AFKOptions, MainFarm:AddToggle({
    Name = "Auto Hallow Scythe",
    Callback = function(Value)
      getgenv().AutoSoulReaper = Value
      AutoSoulReaper()
    end
  }))
  
  table.insert(AFKOptions, MainFarm:AddToggle({
    Name = "Auto Trade Bone",
    Callback = function(Value)
      getgenv().AutoTradeBone = Value
      while getgenv().AutoTradeBone do task.wait()
        FireRemote("Bones", "Buy", 1, 1)
      end
    end
  }))
  
elseif Sea2 then
  
  MainFarm:AddSection({"Ectoplasm"})
  
  MainFarm:AddToggle({
    Name = "Auto Farm Ectoplasm",
    Callback = function(Value)
      getgenv().AutoFarmEctoplasm = Value
      AutoFarmEctoplasm()
    end
  })
end

MainFarm:AddSection({"Chest"})

MainFarm:AddToggle({
  Name = "Auto Chest < Tween >",
  Callback = function(Value)
    getgenv().AutoChestTween = Value
    AutoChestTween()
  end
})

MainFarm:AddToggle({
  Name = "Auto Chest < Bypass >",
  Callback = function(Value)
    getgenv().AutoChestBypass = Value
    AutoChestBypass()
  end
})

MainFarm:AddSection({"Bosses"})

MainFarm:AddButton({
  Name = "Update Boss List",
  Callback = function()
    pcall(function()UpdateBossList()end)
  end
})

local BossList = MainFarm:AddDropdown({
  Name = "Boss List",
  Callback = function(Value)
    getgenv().BossSelected = Value
  end
})

function UpdateBossList()
  local NewOptions = {}
  for ___,NameBoss in pairs(BossListT) do
    if VerifyNPC(NameBoss) then
      table.insert(NewOptions, NameBoss)
    end
  end
  BossList:Set(NewOptions, true)
end
UpdateBossList()

MainFarm:AddToggle({
  Name = "Auto Farm Boss Selected",
  Callback = function(Value)
    getgenv().AutoFarmBossSelected = Value
    AutoFarmBossSelected()
  end
})

MainFarm:AddToggle({
  Name = "Auto Farm All Boss",
  Callback = function(Value)
    getgenv().KillAllBosses = Value
    KillAllBosses()
  end
})

MainFarm:AddToggle({
  Name = "Take Quest",
  Default = true,
  Callback = function(Value)
    getgenv().TakeQuestBoss = Value
  end
})

MainFarm:AddButton({
  Name = "Server HOP",
  Callback = function()
    ServerHop()
  end
})

MainFarm:AddSection({"Material"})

local MaterialList = {}

if Sea1 then
  MaterialList = {
    "Angel Wings",
    "Leather + Scrap Metal",
    "Magma Ore",
    "Fish Tail"
  }
elseif Sea2 then
  MaterialList = {
    "Leather + Scrap Metal",
    "Magma Ore",
    "Mystic Droplet",
    "Radiactive Material",
    "Vampire Fang"
  }
elseif Sea3 then
  MaterialList = {
    "Leather + Scrap Metal",
    "Fish Tail",
    "Gunpowder",
    "Mini Tusk",
    "Conjured Cocoa",
    "Dragon Scale"
  }
end

MainFarm:AddDropdown({
  Name = "Material List",
  Options = MaterialList,
  Flag = "Material/Selected",
  Callback = function(Value)
    getgenv().MaterialSelected = Value
  end
})

MainFarm:AddToggle({
  Name = "Auto Farm Material",
  Callback = function(Value)
    getgenv().AutoFarmMaterial = Value
    AutoFarmMaterial()
  end
})

MainFarm:AddSection({"Mastery"})

MainFarm:AddSlider({
  Name = "Select Health",
  Min = 10,
  Max = 100,
  Default = 25,
  Callback = function(Value)
    getgenv().HealthSkill = Value
  end
})

MainFarm:AddDropdown({
  Name = "Select Tool",
  Options = {"Blox Fruit"},
  Default = {"Blox Fruit"},
  Callback = function(Value)
    getgenv().ToolMastery = Value
  end
})

MainFarm:AddToggle({
  Name = "Auto Farm Mastery",
  Callback = function(Value)
    getgenv().AutoFarmMastery = Value
    AutoFarmMastery()
  end
})

MainFarm:AddSection({"Skill"})

MainFarm:AddToggle({
  Name = "AimBot Skill Enemie",
  Flag = "Sea/Aimbot",
  Default = true,
  Callback = function(Value)
    getgenv().AimBotSkill = Value
  end
})

MainFarm:AddToggle({
  Name = "Skill Z",
  Flag = "Sea/Z",
  Default = true,
  Callback = function(Value)
    getgenv().SkillZ = Value
  end
})

MainFarm:AddToggle({
  Name = "Skill X",
  Flag = "Sea/X",
  Default = true,
  Callback = function(Value)
    getgenv().SkillX = Value
  end
})

MainFarm:AddToggle({
  Name = "Skill C",
  Flag = "Sea/C",
  Default = true,
  Callback = function(Value)
    getgenv().SkillC = Value
  end
})

MainFarm:AddToggle({
  Name = "Skill V",
  Flag = "Sea/V",
  Default = true,
  Callback = function(Value)
    getgenv().SkillV = Value
  end
})

MainFarm:AddToggle({
  Name = "Skill F",
  Flag = "Sea/F",
  Callback = function(Value)
    getgenv().SkillF = Value
  end
})

FruitAndRaid:AddSection({"Fruits"})

local Fruit_BlackList = {}

FruitAndRaid:AddToggle({
  Name = "Auto Store Fruits",
  Flag = "Fruits/AutoStore",
  Callback = function(Value)
    getgenv().AutoStoreFruits = Value
    task.spawn(function()
      local Remote = ReplicatedStorage:WaitForChild("Remotes", 9e9):WaitForChild("CommF_", 9e9)
      
      while getgenv().AutoStoreFruits do task.wait()
        local plrBag = Player.Backpack
        local plrChar = Player.Character
        if plrChar then
          for _,Fruit in pairs(plrChar:GetChildren()) do
            if not table.find(Fruit_BlackList, Fruit.Name) and Fruit:IsA("Tool") and Fruit:FindFirstChild("Fruit") then
              if Remote:InvokeServer("StoreFruit", Get_Fruit(Fruit.Name), Fruit) ~= true then
                table.insert(Fruit_BlackList, Fruit.Name)
              end
            end
          end
        end
        for _,Fruit in pairs(plrBag:GetChildren()) do
          if not table.find(Fruit_BlackList, Fruit.Name) and Fruit:IsA("Tool") and Fruit:FindFirstChild("Fruit") then
            if Remote:InvokeServer("StoreFruit", Get_Fruit(Fruit.Name), Fruit) ~= true then
              table.insert(Fruit_BlackList, Fruit.Name)
            end
          end
        end
      end
    end)
  end
})

table.insert(AFKOptions, FruitAndRaid:AddToggle({
  Name = "Teleport to Fruits",
  Flag = "Fruits/Teleport",
  Callback = function(Value)
    getgenv().TeleportToFruit = Value
    task.spawn(function()
      while getgenv().TeleportToFruit do task.wait()
        if Configure("Fruit") then getgenv().TeleportingToFruit = false
        else
          local Fruit = FruitFind()
          if Fruit then
            PlayerTP(Fruit.CFrame)
            getgenv().TeleportingToFruit = true
          else
            getgenv().TeleportingToFruit = false
          end
        end
      end
    end)
  end
}))

FruitAndRaid:AddToggle({
  Name = "Auto Random Fruit",
  Flag = "Fruits/AutoRandom",
  Callback = function(Value)
    getgenv().AutoRandomFruit = Value
    task.spawn(function()
      while getgenv().AutoRandomFruit do task.wait(1)
        FireRemote("Cousin", "Buy")
      end
    end)
  end
})

FruitAndRaid:AddSection({"Raid"})
if Sea1 then FruitAndRaid:AddParagraph({"Only on Sea 2 and 3"})
elseif Sea2 or Sea3 then
  Raids_Chip = {}
  local Raids = require(ReplicatedStorage.Raids)
  
  table.foreach(Raids.advancedRaids, function(a, b)table.insert(Raids_Chip, b)end)
  table.foreach(Raids.raids, function(a, b)table.insert(Raids_Chip, b)end)
  
  FruitAndRaid:AddDropdown({
    Name = "Select Raid",
    Options = Raids_Chip,
    Flag = "Raid/SelectedChip",
    Callback = function(Value)
      getgenv().SelectRaidChip = Value
    end
  })
  
  FruitAndRaid:AddToggle({
    Name = "Auto Farm Raid",
    Callback = function(Value)
      getgenv().AutoFarmRaid = Value
      task.spawn(function()
        local Islands = workspace:WaitForChild("_WorldOrigin", 9e9):WaitForChild("Locations", 9e9)
        
        local function GetIsland(Island)
          local plrChar = Player and Player.Character
          local plrPP = plrChar and plrChar.PrimaryPart
          
          for _,island in pairs(Islands:GetChildren()) do
            if island and island.Name == Island and plrPP and (island.Position - plrPP.Position).Magnitude < 3000 then
              return island
            end
          end
        end
        
        task.spawn(function()
          while getgenv().AutoFarmRaid do task.wait(0.5)
            if Configure("Raid") then
            else
              FireRemote("Awakener", "Check")FireRemote("Awakener", "Awaken")
            end
          end
        end)
        
        task.spawn(function()
          while getgenv().AutoFarmRaid do task.wait(0.5)
            if getgenv().SelectRaidChip == "Rumble" then
              FireRemote("ThunderGodTalk", true)
              FireRemote("ThunderGodTalk")
            end
          end
        end)
        
        task.spawn(function()
          while getgenv().AutoFarmRaid do task.wait()
            if Configure("Raid") then
              getgenv().FarmingRaid = false
            else
              if Player.PlayerGui.Main.Timer.Visible then EquipTool()
                local Island1 = GetIsland("Island 1")
                local Island2 = GetIsland("Island 2")
                local Island3 = GetIsland("Island 3")
                local Island4 = GetIsland("Island 4")
                local Island5 = GetIsland("Island 5")
                
                if Island5 then
                  getgenv().FarmingRaid = true
                  PlayerTP(Island5.CFrame + Vector3.new(0, 70, 0))
                elseif Island4 then
                  getgenv().FarmingRaid = true
                  PlayerTP(Island4.CFrame + Vector3.new(0, 70, 0))
                elseif Island3 then
                  getgenv().FarmingRaid = true
                  PlayerTP(Island3.CFrame + Vector3.new(0, 70, 0))
                elseif Island2 then
                  getgenv().FarmingRaid = true
                  PlayerTP(Island2.CFrame + Vector3.new(0, 70, 0))
                elseif Island1 then
                  getgenv().FarmingRaid = true
                  PlayerTP(Island1.CFrame + Vector3.new(0, 70, 0))
                else
                  getgenv().FarmingRaid = false
                end
              else
                getgenv().FarmingRaid = false
              end
            end
          end
        end)
        
        while getgenv().AutoFarmRaid do task.wait()
          if Configure("Raid") then
          else
            if not Player.PlayerGui.Main.Timer.Visible and VerifyTool("Special Microchip") then
              if not GetIsland("Island 1")
              and not GetIsland("Island 2")
              and not GetIsland("Island 3")
              and not GetIsland("Island 4")
              and not GetIsland("Island 5") then
                pcall(function()
                  if Sea2 then
                    fireclickdetector(workspace.Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
                    repeat task.wait()until GetIsland("Island 1")task.wait(1)
                  elseif Sea3 then
                    fireclickdetector(workspace.Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
                    repeat task.wait()until GetIsland("Island 1")task.wait(1)
                  end
                end)
              end
            end
          end
        end
      end)
      getgenv().AutoKillAura = Value
      AutoKillAura()
    end
  })
  
  FruitAndRaid:AddToggle({"Auto Buy Chip", false, function(Value)
    getgenv().AutoBuyChip = Value
    task.spawn(function()
      while getgenv().AutoBuyChip do task.wait()
        if not VerifyTool("Special Microchip") then
          FireRemote("RaidsNpc", "Select", getgenv().SelectRaidChip)task.wait(1)
        end
      end
    end)
  end})
end

if Sea1 then
  QuestsTabs:AddSection({"Second Sea"})
  
  QuestsTabs:AddToggle({
    Name = "Auto Second Sea",
    Callback = function(Value)
      getgenv().AutoSecondSea = Value
      AutoSecondSea()
    end
  })
  
  QuestsTabs:AddSection({"Saber"})
  
  QuestsTabs:AddToggle({
    Name = "Auto Unlock Saber < Level +200 >",
    Callback = function(Value)
      getgenv().AutoUnlockSaber = Value
      AutoUnlockSaber()
    end
  })
  
  QuestsTabs:AddSection({"God Boss"})
  
  QuestsTabs:AddToggle({
    Name = "Auto Pole V1",
    Callback = function(Value)
      getgenv().AutoEnelBossPole = Value
      AutoEnelBossPole()
    end
  })
  
  QuestsTabs:AddSection({"The Saw"})
  
  QuestsTabs:AddToggle({
    Name = "Auto Saw Sword",
    Callback = function(Value)
      getgenv().AutoSawBoss = Value
      AutoSawBoss()
    end
  })
  
elseif Sea2 then
  QuestsTabs:AddSection({"Third Sea"})
  
  QuestsTabs:AddToggle({
    Name = "Auto Third Sea",
    Callback = function(Value)
      getgenv().AutoThirdSea = Value
      AutoThirdSea()
    end
  })
  
  QuestsTabs:AddToggle({
    Name = "Auto Kill Don Swan",
    Callback = function(Value)
      getgenv().AutoKillDonSwan = Value
      AutoKillDonSwan()
    end
  })
  
  QuestsTabs:AddToggle({
    Name = "Auto Don Swan Hop",
    Callback = function(Value)
      getgenv().AutoDonSwanHop = Value
    end
  })
  
  QuestsTabs:AddSection({"Bartilo Quest"})
  
  QuestsTabs:AddToggle({
    Name = "Auto Bartilo Quest",
    Callback = function(Value)
      getgenv().AutoBartiloQuest = Value
      AutoBartiloQuest()
    end
  })
  
  QuestsTabs:AddSection({"Rengoku"})
  
  QuestsTabs:AddToggle({
    Name = "Auto Rengoku",
    Callback = function(Value)
      getgenv().AutoRengoku = Value
      AutoRengoku()
    end
  })
  
  QuestsTabs:AddToggle({
    Name = "Auto Rengoku Hop",
    Callback = function(Value)
      getgenv().AutoRengokuHop = Value
    end
  })
  
  QuestsTabs:AddSection({"Legendary Sword"})
  
  QuestsTabs:AddToggle({"Auto Buy Legendary Sword", false, function(Value)
    getgenv().AutoLegendarySword = Value
    task.spawn(function()
      while getgenv().AutoLegendarySword do task.wait(0.5)
        FireRemote("LegendarySwordDealer", "1")
        FireRemote("LegendarySwordDealer", "2")
        FireRemote("LegendarySwordDealer", "3")
      end
    end)
  end, "Buy/LegendarySword",})
  
  QuestsTabs:AddToggle({
    Name = "Auto Buy True Triple Katana",
    Flag = "Buy/TTK",
    Callback = function(Value)
      getgenv().AutoTTK = Value
      task.spawn(function()
        while getgenv().AutoTTK do task.wait()
          FireRemote("MysteriousMan", "1")
          FireRemote("MysteriousMan", "2")
        end
      end)
    end
  })
  
  QuestsTabs:AddSection({"Race"})
  
  QuestsTabs:AddToggle({
    Name = "Auto Evo Race V2",
    Callback = function(Value)
      getgenv().AutoRaceV2 = Value
      AutoRaceV2()
    end
  })
  
  QuestsTabs:AddSection({"Cursed Captain"})
  
  QuestsTabs:AddToggle({
    Name = "Auto Cursed Captain",
    Callback = function(Value)
      getgenv().AutoCursedCaptain = Value
      AutoCursedCaptain()
    end
  })
  
  QuestsTabs:AddSection({"Dark Beard"})
  
  QuestsTabs:AddToggle({
    Name = "Auto Dark Beard",
    Callback = function(Value)
      getgenv().AutoDarkbeard = Value
      AutoDarkbeard()
    end
  })
  
  QuestsTabs:AddSection({"Law"})
  
  QuestsTabs:AddToggle({
    Name = "Auto Buy Law Chip",
    Callback = function(Value)
      getgenv().AutoBuyLawChip = Value
      task.spawn(function()
        while getgenv().AutoBuyLawChip do task.wait()
          if not VerifyNPC("Order") and not VerifyTool("Microchip") then
					  FireRemote("BlackbeardReward", "Microchip", "2")
					end
        end
      end)
    end
  })
  
  QuestsTabs:AddToggle({
    Name = "Auto Start Law Raid",
    Callback = function(Value)
      getgenv().AutoStartLawRaid = Value
      task.spawn(function()
        while getgenv().AutoStartLawRaid do task.wait()
          if not VerifyNPC("Order") and VerifyTool("Microchip") then
            pcall(function()
					    fireclickdetector(workspace.Map.CircleIsland.RaidSummon.Button.Main.ClickDetector)
					  end)
					end
        end
      end)
    end
  })
  
  QuestsTabs:AddToggle({
    Name = "Auto Kill Law Boss",
    Callback = function(Value)
      getgenv().AutoKillLawBoss = Value
      AutoKillLawBoss()
    end
  })
  
elseif Sea3 then
  QuestsTabs:AddSection({"Elite Hunter"})
  
  local LabelElite = QuestsTabs:AddParagraph({"Elite Stats : not Spawn"})
  local LabelElit3 = QuestsTabs:AddParagraph({"Elite Hunter progress : 0"})
  
  task.spawn(function()
    while task.wait() do
      if VerifyNPC("Urban") or VerifyNPC("Deandre") or VerifyNPC("Diablo") then
        LabelElite:SetTitle("Elite Stats : Spawned")
      else
        LabelElite:SetTitle("Elite Stats : not Spawn")
      end
    end
  end)
  
  if not IsOwner then
    task.spawn(function()
      while task.wait(1) do
        LabelElit3:SetTitle("Elite Hunter progress : " .. FireRemote("EliteHunter", "Progress"))
      end
    end)
  end
  
  table.insert(AFKOptions, QuestsTabs:AddToggle({
    Name = "Auto Elite Hunter",
    Callback = function(Value)
      getgenv().AutoEliteHunter = Value
      AutoEliteHunter()
    end
  }))
  
  table.insert(AFKOptions, QuestsTabs:AddToggle({
    Name = "Auto Collect Yama < Need 30 >",
    Flag = "Collect/Yama",
    Callback = function(Value)
      getgenv().AutoCollectYama = Value
      task.spawn(function()
        while getgenv().AutoCollectYama do task.wait()
          pcall(function()
            if FireRemote("EliteHunter", "Progress") >= 30 then
              fireclickdetector(workspace.Map.Waterfall.SealedKatana.Handle.ClickDetector)
            end
          end)
        end
      end)
    end
  }))
  
  QuestsTabs:AddToggle({
    Name = "Auto Elite Hunter Hop",
    Callback = function(Value)
      getgenv().AutoEliteHunterHop = Value
    end
  })
  
  QuestsTabs:AddSection({"Tushita"})
  
  local LabelRipIndra = QuestsTabs:AddParagraph({"Rip Indra Stats : not Spawn"})
  
  task.spawn(function()
    while task.wait(0.5) do
      if VerifyNPC("rip_indra True Form") then
        LabelRipIndra:SetTitle("Rip Indra Stats : Spawned")
      else
        LabelRipIndra:SetTitle("Rip Indra Stats : not Spawn")
      end
    end
  end)
  
  QuestsTabs:AddToggle({
    Name = "Auto Tushita",
    Callback = function(Value)
      getgenv().AutoTushita = Value
      task.spawn(function()
        local Map = workspace:WaitForChild("Map", 9e9)
        local Turtle = Map:WaitForChild("Turtle", 9e9)
        local QuestTorches = Turtle:WaitForChild("QuestTorches", 9e9)
        
        local Active1 = false
        local Active2 = false
        local Active3 = false
        local Active4 = false
        local Active5 = false
        
        while getgenv().AutoTushita do task.wait()
          if not Turtle:FindFirstChild("TushitaGate") then
            local Enemie = Enemies:FindFirstChild("Longma")
            
            if Enemie and Enemie:FindFirstChild("HumanoidRootPart") then
              PlayerTP(Enemie.HumanoidRootPart.CFrame + getgenv().FarmPos)
              pcall(function()PlayerClick()ActiveHaki()EquipTool()end)
            else
              PlayerTP(CFrame.new(-10218, 333, -9444))
            end
          elseif VerifyNPC("rip_indra True Form") then
            if not VerifyTool("Holy Torch") then
              PlayerTP(CFrame.new(5152, 142, 912))
            else
              local Torch1 = QuestTorches:FindFirstChild("Torch1")
              local Torch2 = QuestTorches:FindFirstChild("Torch2")
              local Torch3 = QuestTorches:FindFirstChild("Torch3")
              local Torch4 = QuestTorches:FindFirstChild("Torch4")
              local Torch5 = QuestTorches:FindFirstChild("Torch5")
              
              local args1 = Torch1 and Torch1:FindFirstChild("Particles")
              and Torch1.Particles:FindFirstChild("PointLight") and not Torch1.Particles.PointLight.Enabled
              local args2 = Torch2 and Torch2:FindFirstChild("Particles")
              and Torch2.Particles:FindFirstChild("PointLight") and not Torch2.Particles.PointLight.Enabled
              local args3 = Torch3 and Torch3:FindFirstChild("Particles")
              and Torch3.Particles:FindFirstChild("PointLight") and not Torch3.Particles.PointLight.Enabled
              local args4 = Torch4 and Torch4:FindFirstChild("Particles")
              and Torch4.Particles:FindFirstChild("PointLight") and not Torch4.Particles.PointLight.Enabled
              local args5 = Torch5 and Torch5:FindFirstChild("Particles")
              and Torch5.Particles:FindFirstChild("PointLight") and not Torch5.Particles.PointLight.Enabled
              
              if not Active1 and args1 then
                PlayerTP(Torch1.CFrame)
              elseif not Active2 and args2 then
                PlayerTP(Torch2.CFrame)Active1 = true
              elseif not Active3 and args3 then
                PlayerTP(Torch3.CFrame)Active2 = true
              elseif not Active4 and args4 then
                PlayerTP(Torch4.CFrame)Active3 = true
              elseif not Active5 and args5 then
                PlayerTP(Torch5.CFrame)Active4 = true
              else
                Active5 = true
              end
            end
          else
            if VerifyTool("God's Chalice") then
              EquipToolName("God's Chalice")
              PlayerTP(CFrame.new(-5561, 314, -2663))
            else
              local NPC = "EliteBossVerify"QuestVisible()
              
              if VerifyQuest("Diablo") then
                NPC = "Diablo"
              elseif VerifyQuest("Deandre") then
                NPC = "Deandre"
              elseif VerifyQuest("Urban") then
                NPC = "Urban"
              else
                task.spawn(function()FireRemote("EliteHunter")end)
              end
              
              local EliteBoss = GetEnemies({NPC})
              
              if EliteBoss and EliteBoss:FindFirstChild("HumanoidRootPart") then
                PlayerTP(EliteBoss.HumanoidRootPart.CFrame + getgenv().FarmPos)
                pcall(function()PlayerClick()ActiveHaki()EquipTool()end)
              elseif not VerifyNPC("Deandre") and not VerifyNPC("Diablo") and not VerifyNPC("Urban") then
                if getgenv().AutoTushitaHop then
                  ServerHop()
                end
              end
            end
          end
        end
      end)
    end
  })
  
  QuestsTabs:AddToggle({
    Name = "Auto Tushita Hop",
    Callback = function(Value)
      getgenv().AutoTushitaHop = Value
    end
  })
  
  QuestsTabs:AddSection({"Cake Prince + Dough King"}) 
  
  local CakeLabel = QuestsTabs:AddParagraph({"Stats : 0"})
  
  if not IsOwner then
    task.spawn(function()
      while task.wait(1) do
        if VerifyNPC("Dough King") then
          CakeLabel:SetTitle("Stats : Spawned | Dough King")
        elseif VerifyNPC("Cake Prince") then
          CakeLabel:SetTitle("Stats : Spawned | Cake Prince")
        else
          local EnemiesCake = FireRemote("CakePrinceSpawner", true)
          CakeLabel:SetTitle("Stats : " .. string.gsub(tostring(EnemiesCake), "%D", ""))
        end
      end
    end)
  end
  
  local CakePrinceToggle = QuestsTabs:AddToggle({"Auto Cake Prince", false, function(Value)
    getgenv().AutoCakePrince = Value
    AutoCakePrince()
  end})
  
  local DoughKingToggle = QuestsTabs:AddToggle({"Auto Dough King", false, function(Value)
    getgenv().AutoDoughKing = Value
    AutoDoughKing()
  end})
  
  CakePrinceToggle:Callback(function()DoughKingToggle:Set(false)end)
  DoughKingToggle:Callback(function()CakePrinceToggle:Set(false)end)
  
  QuestsTabs:AddSection({"Rip Indra"})
  
  local ActiveButtonToggle = QuestsTabs:AddToggle({"Auto Active Button Haki Color", false, function(Value)
    getgenv().RipIndraLegendaryHaki = Value
    task.spawn(function()
      while getgenv().RipIndraLegendaryHaki do task.wait()
        local plrChar = Player and Player.Character and Player.Character.PrimaryPart
        if (plrChar.Position - Vector3.new(-5415, 314, -2212)).Magnitude < 5 then
          FireRemote("activateColor", "Pure Red")
        elseif (plrChar.Position - Vector3.new(-4972, 336, -3720)).Magnitude < 5 then
          FireRemote("activateColor", "Snow White")
        elseif (plrChar.Position - Vector3.new(-5420, 1089, -2667)).Magnitude < 5 then
          FireRemote("activateColor", "Winter Sky")
        end
      end
    end)
    
    task.spawn(function()
      while getgenv().RipIndraLegendaryHaki do task.wait()
        if not getgenv().AutoFarm_Level and not getgenv().AutoFarmBone and not getgenv().AutoCakePrince then
          if GetButton() then
            PlayerTP(GetButton().CFrame)
          elseif not GetButton() and not getgenv().AutoRipIndra then
            PlayerTP(CFrame.new(-5119, 315, -2964))
          end
        end
      end
    end)
  end})
  
  local RipIndraToggle = QuestsTabs:AddToggle({"Auto Rip Indra", false, function(Value)
    getgenv().AutoRipIndra = Value
    AutoRipIndra()
  end})
  
  RipIndraToggle:Callback(function()ActiveButtonToggle:Set(false)end)
  ActiveButtonToggle:Callback(function()RipIndraToggle:Set(false)end)
  
  --[[QuestsTabs:AddSection({"Ken Haki"})
  
  QuestsTabs:AddToggle({
    Name = "Auto Ken Haki V2",
    Callback = function(Value)
      getgenv().AutoKenV2 = Value
      AutoKenV2()
    end
  })]]
  
  QuestsTabs:AddSection({"Musketeer Hat"})
  
  QuestsTabs:AddToggle({
    Name = "Auto Musketeer Hat",
    Callback = function(Value)
      getgenv().AutoMusketeerHat = Value
      AutoMusketeerHat()
    end
  })
  
  QuestsTabs:AddButton({
    Name = "Server HOP",
    Callback = function()
      ServerHop()
    end
  })
end

if Sea2 or Sea3 then
  QuestsTabs:AddSection({"Fighting Style"})
  
  QuestsTabs:AddToggle({
    Name = "Auto Death Step",
    Callback = function(Value)
      getgenv().AutoDeathStep = Value
      task.spawn(function()
        local MasteryBlackLeg = 0
        local KeyFind = false
        
        local function GetProxyNPC()
          local Distance = math.huge
          local NPC = nil
          local plrChar = Player and Player.Character and Player.Character.PrimaryPart
          
          for _,npc in pairs(Enemies:GetChildren()) do
            if npc.Name == "Reborn Skeleton" or npc.Name == "Living Zombie" or npc.Name == "Demonic Soul" or npc.Name == "Posessed Mummy" or npc.Name == "Water Fighter" then
              if plrChar and npc and npc:FindFirstChild("HumanoidRootPart") and (plrChar.Position - npc.HumanoidRootPart.Position).Magnitude <= Distance then
                Distance = (plrChar.Position - npc.HumanoidRootPart.Position).Magnitude
                NPC = npc
              end
            end
          end
          return NPC
        end
        
        while getgenv().AutoDeathStep do task.wait()
          if VerifyTool("Black Leg") then
            MasteryBlackLeg = GetToolLevel("Black Leg")
          end
          
          if MasteryBlackLeg >= 400 and Sea3 then
            FireRemote("TravelDressrosa")
          end
            
          if KeyFind then
            FireRemote("BuyDeathStep")
          end
          
          if VerifyTool("Death Step") then
            EquipToolName("Death Step")
          elseif MasteryBlackLeg >= 400 then
            local Enemie = Enemies:FindFirstChild("Awakened Ice Admiral")
            
            if VerifyTool("Library Key") then
              KeyFind = true
              EquipToolName("Library Key")
              PlayerTP(CFrame.new(6373, 293, -6839))
            elseif Enemie and Enemie:FindFirstChild("HumanoidRootPart") then
              PlayerTP(Enemie.HumanoidRootPart.CFrame + getgenv().FarmPos)
              pcall(function()PlayerClick()ActiveHaki()EquipTool()end)
            else
              PlayerTP(CFrame.new(6473, 297, -6944))
            end
          elseif not VerifyTool("Black Leg") and MasteryBlackLeg < 400 then
            FireRemote("BuyBlackLeg")
          elseif VerifyTool("Black Leg") and MasteryBlackLeg < 400 then
            EquipToolName("Black Leg")
            
            local Enemie = GetProxyNPC()
            
            if Enemie and Enemie:FindFirstChild("HumanoidRootPart") then
              PlayerTP(Enemie.HumanoidRootPart.CFrame + getgenv().FarmPos)
              pcall(function()PlayerClick()ActiveHaki()BringNPC(Enemie)end)
            else
              if Sea3 then
                PlayerTP(CFrame.new(-9513, 164, 5786))
              else
                PlayerTP(CFrame.new(-3350, 282, -10527))
              end
            end
          end
        end
      end)
    end
  })
  
  QuestsTabs:AddToggle({
    Name = "Auto Electric Claw <BETA>",
    Callback = function(Value)
      getgenv().AutoElectricClaw = Value
      task.spawn(function()
        local MasteryElectro = 0
        local MasteryElectricClaw = 0
        
        local function GetProxyNPC()
          local Distance = math.huge
          local NPC = nil
          local plrChar = Player and Player.Character and Player.Character.PrimaryPart
          
          for _,npc in pairs(Enemies:GetChildren()) do
            if npc.Name == "Reborn Skeleton" or npc.Name == "Living Zombie" or npc.Name == "Demonic Soul" or npc.Name == "Posessed Mummy" or npc.Name == "Water Fighter" then
              if plrChar and npc and npc:FindFirstChild("HumanoidRootPart") and (plrChar.Position - npc.HumanoidRootPart.Position).Magnitude <= Distance then
                Distance = (plrChar.Position - npc.HumanoidRootPart.Position).Magnitude
                NPC = npc
              end
            end
          end
          return NPC
        end
        
        while getgenv().AutoElectricClaw do task.wait()
          if VerifyTool("Electro") then
            MasteryElectro = GetToolLevel("Electro")
          elseif VerifyTool("Electric Claw") then
            MasteryElectricClaw = GetToolLevel("Electric Claw")
          end
          
          if MasteryElectro < 400 then
            if not VerifyTool("Electro") then
              FireRemote("BuyElectro")
            else
              EquipToolName("Electro")
            end
          elseif MasteryElectricClaw < 600 then
            if not VerifyTool("Electric Claw") then
              FireRemote("BuyElectricClaw")
            else
              EquipToolName("Electric Claw")
            end
          end
          
          local Enemie = GetProxyNPC()
          
          if Enemie and Enemie:FindFirstChild("HumanoidRootPart") then
            PlayerTP(Enemie.HumanoidRootPart.CFrame + getgenv().FarmPos)
            pcall(function()PlayerClick()ActiveHaki()BringNPC(Enemie)end)
          else
            if Sea3 then
              PlayerTP(CFrame.new(-9513, 164, 5786))
            else
              PlayerTP(CFrame.new(-3350, 282, -10527))
            end
          end
        end
      end)
    end
  })
  
  QuestsTabs:AddToggle({
    Name = "Auto Sharkman Karate",
    Callback = function(Value)
      getgenv().AutoSharkmanKarate = Value
      task.spawn(function()
        local MasteryFishmanKarate = 0
        local MasterySharkmanKarate = 0
        local SharkmanStats = 0
        
        task.spawn(function()
          while getgenv().AutoSharkmanKarate do task.wait()
            SharkmanStats = FireRemote("BuySharkmanKarate", true)
          end
        end)
        
        while getgenv().AutoSharkmanKarate do task.wait()
          if VerifyTool("Fishman Karate") then
            MasteryFishmanKarate = GetToolLevel("Fishman Karate")
          elseif VerifyTool("Sharkman Karate") then
            MasterySharkmanKarate = GetToolLevel("Sharkman Karate")
          end
          
          if SharkmanStats == 1 then
            FireRemote("BuySharkmanKarate")
          elseif VerifyTool("Sharkman Karate") then
            EquipToolName("Sharkman Karate")
            local Enemie = Enemies:FindFirstChild("Water Fighter")
            
            if Enemie and Enemie:FindFirstChild("HumanoidRootPart") then
              PlayerTP(Enemie.HumanoidRootPart.CFrame + getgenv().FarmPos)
              pcall(function()PlayerClick()ActiveHaki()BringNPC(Enemie, true)end)
            else
              TweenNPCSpawn({CFrame.new(-3339, 290, -10412), CFrame.new(-3518, 290, -10419), CFrame.new(-3536, 290, -10607), CFrame.new(-3345, 280, -10667)}, "Water Fighter")
            end
          elseif VerifyTool("Water Key") and MasteryFishmanKarate >= 400 then
            FireRemote("BuySharkmanKarate", true)
          elseif not VerifyTool("Water Key") and MasteryFishmanKarate >= 400 then
            local Enemie = Enemies:FindFirstChild("Water Fighter")
            
            if Enemie and Enemie:FindFirstChild("HumanoidRootPart") then
              PlayerTP(Enemie.HumanoidRootPart.CFrame + getgenv().FarmPos)
              pcall(function()PlayerClick()ActiveHaki()EquipTool()BringNPC(Enemie, true)end)
            else
              TweenNPCSpawn({CFrame.new(-3339, 290, -10412), CFrame.new(-3518, 290, -10419), CFrame.new(-3536, 290, -10607), CFrame.new(-3345, 280, -10667)}, "Water Fighter")
            end
          elseif not VerifyTool("Fishman Karate") and MasteryFishmanKarate < 400 then
            FireRemote("BuyFishmanKarate")
          elseif VerifyTool("Fishman Karate") and MasteryFishmanKarate < 400 then
            EquipToolName("Fishman Karate")
            local Enemie = Enemies:FindFirstChild("Water Fighter")
          
            if Enemie and Enemie:FindFirstChild("HumanoidRootPart") then
              PlayerTP(Enemie.HumanoidRootPart.CFrame + getgenv().FarmPos)
              pcall(function()PlayerClick()ActiveHaki()BringNPC(Enemie, true)end)
            else
              TweenNPCSpawn({CFrame.new(-3339, 290, -10412), CFrame.new(-3518, 290, -10419), CFrame.new(-3536, 290, -10607),CFrame.new(-3345, 280, -10667)}, "Water Fighter")
            end
          end
        end
      end)
    end
  })
  
  QuestsTabs:AddToggle({
    Name = "Auto Dragon Talon",
    Callback = function(Value)
      getgenv().AutoDragonTalon = Value
      task.spawn(function()
        local MasteryDragonClaw = 0
        local FireEssence = false
        
        local function GetProxyNPC()
          local Distance = math.huge
          local NPC = nil
          local plrChar = Player and Player.Character and Player.Character.PrimaryPart
          
          for _,npc in pairs(Enemies:GetChildren()) do
            if npc.Name == "Reborn Skeleton" or npc.Name == "Living Zombie" or npc.Name == "Demonic Soul" or npc.Name == "Posessed Mummy" or npc.Name == "Water Fighter" then
              if plrChar and npc and npc:FindFirstChild("HumanoidRootPart") and (plrChar.Position - npc.HumanoidRootPart.Position).Magnitude <= Distance then
                Distance = (plrChar.Position - npc.HumanoidRootPart.Position).Magnitude
                NPC = npc
              end
            end
          end
          return NPC
        end
        
        task.spawn(function()
          while getgenv().AutoDragonTalon do task.wait()
            if not VerifyTool("Fire Essence") then
              FireRemote("Bones", "Buy", 1, 1)
            else
              FireRemote("BuyDragonTalon", true)
              FireEssence = true
            end
          end
        end)
        
        while getgenv().AutoDragonTalon do task.wait()
          if VerifyTool("Dragon Claw") then
            MasteryDragonClaw = GetToolLevel("Dragon Claw")
          end
          
          if MasteryDragonClaw >= 400 and Sea2 then
            FireRemote("TravelZou")
          end
          
          if FireEssence and MasteryDragonClaw >= 400 then
            FireRemote("BuyDragonTalon")
          elseif not VerifyTool("Dragon Claw") and MasteryDragonClaw < 400 or not FireEssence and not VerifyTool("Dragon Claw") then
            FireRemote("BlackbeardReward", "DragonClaw", "1")
            FireRemote("BlackbeardReward", "DragonClaw", "2")
          elseif VerifyTool("Dragon Claw") and MasteryDragonClaw < 400 or not FireEssence and VerifyTool("Dragon Claw") then
            EquipToolName("Dragon Claw")
            
            local Enemie = GetProxyNPC()
            
            if Enemie and Enemie:FindFirstChild("HumanoidRootPart") then
              PlayerTP(Enemie.HumanoidRootPart.CFrame + getgenv().FarmPos)
              pcall(function()PlayerClick()ActiveHaki()BringNPC(Enemie)end)
            else
              if Sea3 then
                PlayerTP(CFrame.new(-9513, 164, 5786))
              else
                PlayerTP(CFrame.new(-3350, 282, -10527))
              end
            end
          end
        end
      end)
    end
  })
  
  QuestsTabs:AddToggle({
    Name = "Auto Superhuman",
    Callback = function(Value)
      getgenv().AutoSuperhuman = Value
      task.spawn(function()
        local MasteryBlackLeg = 0
        local MasteryElectro = 0
        local MasteryFishmanKarate = 0
        local MasteryDragonClaw = 0
        local MasterySuperhuman = 0
        
        local function GetProxyNPC()
          local Distance = math.huge
          local NPC = nil
          local plrChar = Player and Player.Character and Player.Character.PrimaryPart
          
          for _,npc in pairs(Enemies:GetChildren()) do
            if npc.Name == "Reborn Skeleton" or npc.Name == "Living Zombie" or npc.Name == "Demonic Soul" or npc.Name == "Posessed Mummy" or npc.Name == "Water Fighter" then
              if plrChar and npc and npc:FindFirstChild("HumanoidRootPart") and (plrChar.Position - npc.HumanoidRootPart.Position).Magnitude <= Distance then
                Distance = (plrChar.Position - npc.HumanoidRootPart.Position).Magnitude
                NPC = npc
              end
            end
          end
          return NPC
        end
        
        while getgenv().AutoSuperhuman do task.wait()
          if VerifyTool("Black Leg") then
            MasteryBlackLeg = GetToolLevel("Black Leg")
          elseif VerifyTool("Electro") then
            MasteryElectro = GetToolLevel("Electro")
          elseif VerifyTool("Fishman Karate") then
            MasteryFishmanKarate = GetToolLevel("Fishman Karate")
          elseif VerifyTool("Dragon Claw") then
            MasteryDragonClaw = GetToolLevel("Dragon Claw")
          elseif VerifyTool("Superhuman") then
            MasterySuperhuman = GetToolLevel("Superhuman")
          end
          
          if MasteryBlackLeg < 300 then
            if not VerifyTool("Black Leg") then
              FireRemote("BuyBlackLeg")
            else
              EquipToolName("Black Leg")
            end
          elseif MasteryElectro < 300 then
            if not VerifyTool("Electro") then
              FireRemote("BuyElectro")
            else
              EquipToolName("Electro")
            end
          elseif MasteryFishmanKarate < 300 then
            if not VerifyTool("Fishman Karate") then
              FireRemote("BuyFishmanKarate")
            else
              EquipToolName("Fishman Karate")
            end
          elseif MasteryDragonClaw < 300 then
            if not VerifyTool("Dragon Claw") then
              FireRemote("BlackbeardReward","DragonClaw","1")
              FireRemote("BlackbeardReward","DragonClaw","2")
            else
              EquipToolName("Dragon Claw")
            end
          elseif MasterySuperhuman < 600 then
            if not VerifyTool("Superhuman") then
              FireRemote("BuySuperhuman")
            else
              EquipToolName("Superhuman")
            end
          end
          
          local Enemie = GetProxyNPC()
          
          if Enemie and Enemie:FindFirstChild("HumanoidRootPart") then
            PlayerTP(Enemie.HumanoidRootPart.CFrame + getgenv().FarmPos)
            pcall(function()PlayerClick()ActiveHaki()BringNPC(Enemie)end)
          else
            if Sea3 then
              PlayerTP(CFrame.new(-9513, 164, 5786))
            else
              PlayerTP(CFrame.new(-3350, 282, -10527))
            end
          end
        end
      end)
    end
  })
  
  QuestsTabs:AddToggle({
    Name = "Auto God Human",
    Callback = function(Value)
      getgenv().AutoGodHuman = Value
      task.spawn(function()
        local function GetProxyNPC()
          local Distance = math.huge
          local NPC = nil
          local plrChar = Player and Player.Character and Player.Character.PrimaryPart
          
          for _,npc in pairs(Enemies:GetChildren()) do
            if npc.Name == "Reborn Skeleton" or npc.Name == "Living Zombie" or npc.Name == "Demonic Soul" or npc.Name == "Posessed Mummy" then
              if plrChar and npc and npc:FindFirstChild("HumanoidRootPart") and (plrChar.Position - npc.HumanoidRootPart.Position).Magnitude <= Distance then
                Distance = (plrChar.Position - npc.HumanoidRootPart.Position).Magnitude
                NPC = npc
              end
            end
          end
          return NPC
        end
        
        -- V1
        local MasteryBlackLeg = 0
        local MasteryElectro = 0
        local MasteryFishmanKarate = 0
        local MasteryDragonClaw = 0
        local MasterySuperhuman = 0
        
        -- V2
        local MasteryElectricClaw = 0
        local MasteryDragonTalon = 0
        local MasterySharkmanKarate = 0
        local MasteryDeathStep = 0
        local MasteryGodHuman = 0
        
        while getgenv().AutoGodHuman do task.wait()
          if Sea2 then
            FireRemote("TravelZou")
          end
          
          if VerifyTool("Black Leg") then
            MasteryBlackLeg = GetToolLevel("Black Leg")
          elseif VerifyTool("Electro") then
            MasteryElectro = GetToolLevel("Electro")
          elseif VerifyTool("Fishman Karate") then
            MasteryFishmanKarate = GetToolLevel("Fishman Karate")
          elseif VerifyTool("Dragon Claw") then
            MasteryDragonClaw = GetToolLevel("Dragon Claw")
          elseif VerifyTool("Superhuman") then
            MasterySuperhuman = GetToolLevel("Superhuman")
          elseif VerifyTool("Death Step") then
            MasteryDeathStep = GetToolLevel("Death Step")
          elseif VerifyTool("Electric Claw") then
            MasteryElectricClaw = GetToolLevel("Electric Claw")
          elseif VerifyTool("Sharkman Karate") then
            MasterySharkmanKarate = GetToolLevel("Sharkman Karate")
          elseif VerifyTool("Dragon Talon") then
            MasteryDragonTalon = GetToolLevel("Dragon Talon")
          elseif VerifyTool("Godhuman") then
            MasteryGodHuman = GetToolLevel("Godhuman")
          end
          
          if MasteryBlackLeg < 400 then
            if not VerifyTool("Black Leg") then
              BuyFightStyle("BuyBlackLeg")
            else
              EquipToolName("Black Leg")
            end
          elseif MasteryElectro < 400 then
            if not VerifyTool("Electro") then
              BuyFightStyle("BuyElectro")
            else
              EquipToolName("Electro")
            end
          elseif MasteryFishmanKarate < 400 then
            if not VerifyTool("Fishman Karate") then
              BuyFightStyle("BuyFishmanKarate")
            else
              EquipToolName("Fishman Karate")
            end
          elseif MasteryDragonClaw < 400 then
            if not VerifyTool("Dragon Claw") then
              FireRemote("BlackbeardReward","DragonClaw","1")
              FireRemote("BlackbeardReward","DragonClaw","2")
            else
              EquipToolName("Dragon Claw")
            end
          elseif MasterySuperhuman < 400 then
            if not VerifyTool("Superhuman") then
              BuyFightStyle("BuySuperhuman")
            else
              EquipToolName("Superhuman")
            end
          elseif MasteryDeathStep < 400 then
            if not VerifyTool("Death Step") then
              BuyFightStyle("BuyDeathStep")
            else
              EquipToolName("Death Step")
            end
          elseif MasteryElectricClaw < 400 then
            if not VerifyTool("Electric Claw") then
              BuyFightStyle("BuyElectricClaw")
            else
              EquipToolName("Electric Claw")
            end
          elseif MasterySharkmanKarate < 400 then
            if not VerifyTool("Sharkman Karate") then
              BuyFightStyle("BuySharkmanKarate")
            else
              EquipToolName("Sharkman Karate")
            end
          elseif MasteryDragonTalon < 400 then
            if not VerifyTool("Dragon Talon") then
              BuyFightStyle("BuyDragonTalon")
            else
              EquipToolName("Dragon Talon")
            end
          else
            if not VerifyTool("Godhuman") then
              BuyFightStyle("BuyGodhuman")
            else
              EquipToolName("Godhuman")
            end
          end
          
          local Enemie = GetProxyNPC()
          
          if Enemie and Enemie:FindFirstChild("HumanoidRootPart") then
            PlayerTP(Enemie.HumanoidRootPart.CFrame + getgenv().FarmPos)
            pcall(function()PlayerClick()ActiveHaki()BringNPC(Enemie)end)
          else
            PlayerTP(CFrame.new(-9513, 164, 5786))
          end
        end
      end)
    end
  })
end

if Sea3 then
  QuestsTabs:AddSection({"Auto Mastery All"})
  
  QuestsTabs:AddSlider({
    Name = "Select Mastery",
    Min = 100,
    Max = 600,
    Default = 600,
    Flag = "FMastery/Selected",
    Callback = function(Value)
      getgenv().AutoMasteryValue = Value
    end
  })
  
  table.insert(AFKOptions, QuestsTabs:AddToggle({
    Name = "Auto Mastery All Fighting Style",
    Callback = function(Value)
      getgenv().AutoMasteryFightingStyle = Value
      task.spawn(function()
        local function GetProxyNPC()
          local Distance = math.huge
          local NPC = nil
          local plrChar = Player and Player.Character and Player.Character.PrimaryPart
          
          for _,npc in pairs(Enemies:GetChildren()) do
            if npc.Name == "Reborn Skeleton" or npc.Name == "Living Zombie" or npc.Name == "Demonic Soul" or npc.Name == "Posessed Mummy" then
              if plrChar and npc and npc:FindFirstChild("HumanoidRootPart") and (plrChar.Position - npc.HumanoidRootPart.Position).Magnitude <= Distance then
                Distance = (plrChar.Position - npc.HumanoidRootPart.Position).Magnitude
                NPC = npc
              end
            end
          end
          return NPC
        end
        
        -- V1
        local MasteryBlackLeg = 0
        local MasteryElectro = 0
        local MasteryFishmanKarate = 0
        local MasteryDragonClaw = 0
        local MasterySuperhuman = 0
        
        -- V2
        local MasteryElectricClaw = 0
        local MasteryDragonTalon = 0
        local MasterySharkmanKarate = 0
        local MasteryDeathStep = 0
        local MasteryGodHuman = 0
        
        -- New
        local MasterySanguineArt = 0
        
        while getgenv().AutoMasteryFightingStyle do task.wait()
          local MaxMastery = getgenv().AutoMasteryValue
          
          if VerifyTool("Black Leg") then
            MasteryBlackLeg = GetToolLevel("Black Leg")
          elseif VerifyTool("Electro") then
            MasteryElectro = GetToolLevel("Electro")
          elseif VerifyTool("Fishman Karate") then
            MasteryFishmanKarate = GetToolLevel("Fishman Karate")
          elseif VerifyTool("Dragon Claw") then
            MasteryDragonClaw = GetToolLevel("Dragon Claw")
          elseif VerifyTool("Superhuman") then
            MasterySuperhuman = GetToolLevel("Superhuman")
          elseif VerifyTool("Death Step") then
            MasteryDeathStep = GetToolLevel("Death Step")
          elseif VerifyTool("Electric Claw") then
            MasteryElectricClaw = GetToolLevel("Electric Claw")
          elseif VerifyTool("Sharkman Karate") then
            MasterySharkmanKarate = GetToolLevel("Sharkman Karate")
          elseif VerifyTool("Dragon Talon") then
            MasteryDragonTalon = GetToolLevel("Dragon Talon")
          elseif VerifyTool("Godhuman") then
            MasteryGodHuman = GetToolLevel("Godhuman")
          elseif VerifyTool("Sanguine Art") then
            MasterySanguineArt = GetToolLevel("Sanguine Art")
          end
          
          if MasteryBlackLeg < MaxMastery then
            if not VerifyTool("Black Leg") then
              BuyFightStyle("BuyBlackLeg")
            else
              EquipToolName("Black Leg")
            end
          elseif MasteryElectro < MaxMastery then
            if not VerifyTool("Electro") then
              BuyFightStyle("BuyElectro")
            else
              EquipToolName("Electro")
            end
          elseif MasteryFishmanKarate < MaxMastery then
            if not VerifyTool("Fishman Karate") then
              BuyFightStyle("BuyFishmanKarate")
            else
              EquipToolName("Fishman Karate")
            end
          elseif MasteryDragonClaw < MaxMastery then
            if not VerifyTool("Dragon Claw") then
              FireRemote("BlackbeardReward","DragonClaw","1")
              FireRemote("BlackbeardReward","DragonClaw","2")
            else
              EquipToolName("Dragon Claw")
            end
          elseif MasterySuperhuman < MaxMastery then
            if not VerifyTool("Superhuman") then
              BuyFightStyle("BuySuperhuman")
            else
              EquipToolName("Superhuman")
            end
          elseif MasteryDeathStep < MaxMastery then
            if not VerifyTool("Death Step") then
              BuyFightStyle("BuyDeathStep")
            else
              EquipToolName("Death Step")
            end
          elseif MasteryElectricClaw < MaxMastery then
            if not VerifyTool("Electric Claw") then
              BuyFightStyle("BuyElectricClaw")
            else
              EquipToolName("Electric Claw")
            end
          elseif MasterySharkmanKarate < MaxMastery then
            if not VerifyTool("Sharkman Karate") then
              BuyFightStyle("BuySharkmanKarate")
            else
              EquipToolName("Sharkman Karate")
            end
          elseif MasteryDragonTalon < MaxMastery then
            if not VerifyTool("Dragon Talon") then
              BuyFightStyle("BuyDragonTalon")
            else
              EquipToolName("Dragon Talon")
            end
          elseif MasteryGodHuman < MaxMastery then
            if not VerifyTool("Godhuman") then
              BuyFightStyle("BuyGodhuman")
            else
              EquipToolName("Godhuman")
            end
          elseif MasterySanguineArt < MaxMastery then
            if not VerifyTool("Sanguine Art") then
              BuyFightStyle("BuySanguineArt")
            else
              EquipToolName("Sanguine Art")
            end
          end
          
          if not getgenv().AutoFarm_Level and not getgenv().AutoFarmBone and not getgenv().AutoFarmEctoplasm then
            local Enemie = GetProxyNPC()
            
            if Enemie and Enemie:FindFirstChild("HumanoidRootPart") then
              PlayerTP(Enemie.HumanoidRootPart.CFrame + getgenv().FarmPos)
              pcall(function()PlayerClick()ActiveHaki()BringNPC(Enemie)end)
            else
              PlayerTP(CFrame.new(-9513, 164, 5786))
            end
          end
        end
      end)
    end
  }))
end

QuestsTabs:AddSection({"Haki Color"})

table.insert(AFKOptions, QuestsTabs:AddToggle({
  Name = "Auto Buy Haki Color",
  Flag = "Buy/HakiColor",
  Callback = function(Value)
    getgenv().AutoBuyHakiColor = Value
    task.spawn(function()
      while getgenv().AutoBuyHakiColor do task.wait(0.5)
        pcall(function()
          FireRemote("ColorsDealer", "1")
          FireRemote("ColorsDealer", "2")
        end)
      end
    end)
  end
}))

if Sea3 then
  QuestsTabs:AddToggle({
    Name = "Auto Rainbow Haki",
    Callback = function(Value)
      getgenv().AutoRainbowHaki = Value
      AutoRainbowHaki()
    end
  })
  
  QuestsTabs:AddToggle({
    Name = "Auto Rainbow Haki HOP",
    Callback = function(Value)
      getgenv().RainbowHakiHop = Value
    end
  })
  
  --[[QuestsTabs:AddSection({"Soul Guitar"})
  
  QuestsTabs:AddToggle({
    Name = "Auto Soul Guitar <Soon>",
    Callback = function(Value)
      getgenv().AutoSoulGuitar = Value
      AutoSoulGuitar()
    end
  })]]
  
  --[[QuestsTabs:AddSection({"Cursed Dual Katana"})
  
  QuestsTabs:AddToggle({
    Name = "Auto CDK",
    Callback = function(Value)
      getgenv().AutoCursedDualKatana = Value
      AutoCursedDualKatana()
    end
  })]]
end

Teleport:AddSection({"Teleport to Sea"})

Teleport:AddButton({
  Name = "Teleport to Sea 1",
  Callback = function()
    FireRemote("TravelMain")
  end
})

Teleport:AddButton({
  Name = "Teleport to Sea 2",
  Callback = function()
    FireRemote("TravelDressrosa")
  end
})

Teleport:AddButton({
  Name = "Teleport to Sea 3",
  Callback = function()
    FireRemote("TravelZou")
  end
})

Teleport:AddSection({"Islands"})

local IslandsList = {}

if Sea1 then
  IslandsList = {
    "WindMill",
    "Marine",
    "Middle Town",
    "Jungle",
    "Pirate Village",
    "Desert",
    "Snow Island",
    "MarineFord",
    "Colosseum",
    "Sky Island 1",
    "Sky Island 2",
    "Sky Island 3",
    "Prison",
    "Magma Village",
    "Under Water Island",
    "Fountain City"
  }
elseif Sea2 then
  IslandsList = {
    "The Cafe",
    "Frist Spot",
    "Dark Area",
    "Flamingo Mansion",
    "Flamingo Room",
    "Green Zone",
    "Zombie Island",
    "Two Snow Mountain",
    "Punk Hazard",
    "Cursed Ship",
    "Ice Castle",
    "Forgotten Island",
    "Ussop Island"
  }
elseif Sea3 then
  IslandsList = {
    "Mansion",
    "Port Town",
    "Great Tree",
    "Castle On The Sea",
    "Hydra Island",
    "Floating Turtle",
    "Haunted Castle",
    "Ice Cream Island",
    "Peanut Island",
    "Cake Island",
    "Candy Cane Island",
    "Tiki Outpost"
  }
end

Teleport:AddDropdown({
  Name = "Select Island",
  Options = IslandsList,
  Default = "",
  Callback = function(Value)
    getgenv().TeleportIslandSelect = Value
  end
})
local TPToggle = Teleport:AddToggle({Name = "Teleport To Island",Callback = function(Value)
  getgenv().TeleportToIsland = Value
  task.spawn(function()
    while getgenv().TeleportToIsland do task.wait()
      local Island = getgenv().TeleportIslandSelect
      if Sea1 then
        -- Sea 1 Teleports
        if Island == "Middle Town" then
          PlayerTP(CFrame.new(-688, 15, 1585))
        elseif Island == "MarineFord" then
          PlayerTP(CFrame.new(-4810, 21, 4359))
        elseif Island == "Marine" then
          PlayerTP(CFrame.new(-2728, 25, 2056))
        elseif Island == "WindMill" then
          PlayerTP(CFrame.new(889, 17, 1434))
        elseif Island == "Desert" then
          PlayerTP(CFrame.new())
        elseif Island == "Snow Island" then
          PlayerTP(CFrame.new(1298, 87, -1344))
        elseif Island == "Pirate Village" then
          PlayerTP(CFrame.new(-1173, 45, 3837))
        elseif Island == "Jungle" then
          PlayerTP(CFrame.new(-1614, 37, 146))
        elseif Island == "Prison" then
          PlayerTP(CFrame.new(4870, 6, 736))
        elseif Island == "Under Water Island" then
          PlayerTP(CFrame.new(61164, 5, 1820))
        elseif Island == "Colosseum" then
          PlayerTP(CFrame.new(-1535, 7, -3014))
        elseif Island == "Magma Village" then
          PlayerTP(CFrame.new(-5290, 9, 8349))
        elseif Island == "Sky Island 1" then
          PlayerTP(CFrame.new(-4814, 718, -2551))
        elseif Island == "Sky Island 2" then
          PlayerTP(CFrame.new(-4652, 873, -1754))
        elseif Island == "Sky Island 3" then
          PlayerTP(CFrame.new(-7895, 5547, -380))
        elseif Island == "Fountain City" then
          PlayerTP(CFrame.new())
        end
      elseif Sea2 then
        -- Sea 2 Teleports
        if Island == "The Cafe" then
          PlayerTP(CFrame.new(-382, 73, 290))
        elseif Island == "Frist Spot" then
          PlayerTP(CFrame.new(-11, 29, 2771))
        elseif Island == "Dark Area" then
          PlayerTP(CFrame.new(3494, 13, -3259))
        elseif Island == "Flamingo Mansion" then
          PlayerTP(CFrame.new(-317, 331, 597))
        elseif Island == "Flamingo Room" then
          PlayerTP(CFrame.new(2285, 15, 905))
        elseif Island == "Green Zone" then
          PlayerTP(CFrame.new(-2258, 73, -2696))
        elseif Island == "Zombie Island" then
          PlayerTP(CFrame.new(-5552, 194, -776))
        elseif Island == "Two Snow Mountain" then
          PlayerTP(CFrame.new(752, 408, -5277))
        elseif Island == "Punk Hazard" then
          PlayerTP(CFrame.new(-5897, 18, -5096))
        elseif Island == "Cursed Ship" then
          PlayerTP(CFrame.new(919, 125, 32869))
        elseif Island == "Ice Castle" then
          PlayerTP(CFrame.new(5505, 40, -6178))
        elseif Island == "Forgotten Island" then
          PlayerTP(CFrame.new(-3050, 240, -10178))
        elseif Island == "Ussop Island" then
          PlayerTP(CFrame.new(4816, 8, 2863))
        end
      elseif Sea3 then
        -- Sea 3 Teleports
        if Island == "Mansion" then
          PlayerTP(CFrame.new(-12471, 374, -7551))
        elseif Island == "Port Town" then
          PlayerTP(CFrame.new(-334, 7, 5300))
        elseif Island == "Castle On The Sea" then
          PlayerTP(CFrame.new(-5073, 315, -3153))
        elseif Island == "Hydra Island" then
          PlayerTP(CFrame.new(5756, 610, -282))
        elseif Island == "Great Tree" then
          PlayerTP(CFrame.new(2681, 1682, -7190))
        elseif Island == "Floating Turtle" then
          PlayerTP(CFrame.new(-12528, 332, -8658))
        elseif Island == "Haunted Castle" then
          PlayerTP(CFrame.new(-9517, 142, 5528))
        elseif Island == "Ice Cream Island" then
          PlayerTP(CFrame.new(-902, 79, -10988))
        elseif Island == "Peanut Island" then
          PlayerTP(CFrame.new(-2062, 50, -10232))
        elseif Island == "Cake Island" then
          PlayerTP(CFrame.new(-1897, 14, -11576))
        elseif Island == "Candy Cane Island" then
          PlayerTP(CFrame.new(-1038, 10, -14076))
        elseif Island == "Tiki Outpost" then
          PlayerTP(CFrame.new(-16224, 9, 439))
        end
      end
    end
  end)
end})

TPToggle:Callback(function(Value)
  if Value then
    local Mag = math.huge
    repeat task.wait()
      local plrPP = Player.Character and Player.Character.PrimaryPart
      if plrPP then
        Mag = (plrPP.Position - TeleportPos).Magnitude
      end
    until not getgenv().TeleportToIsland or Mag < 15
    TPToggle:Set(false)
  end
end)

if Sea3 then
  Teleport:AddSection({"Race V4"})
  
  Teleport:AddButton({"Teleport To Temple of Time", function()
    for i = 1, 5 do task.wait()
      Player.Character:SetPrimaryPartCFrame(CFrame.new(28286, 14897, 103))
    end
  end})
end

Misc:AddSection({"Join Server"})
local ServerId = ""
Misc:AddTextBox({Name = "Input Job Id",Default = "",PlaceholderText = "Job ID",Callback = function(Value)
  ServerId = Value
end})
Misc:AddButton({"Join Server", function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/Webhook/main/BloxFruits.lua"))():Teleport(ServerId)
end})
Misc:AddSection({"Configs"})

Misc:AddSlider({"Farm Distance", 5, 30, 1, 20, function(Value)
  getgenv().FarmPos = Vector3.new(0, Value or 15, Value or 10)getgenv().FarmDistance = Value
end, "Misc/FarmDistance"})

Misc:AddSlider({"Tween Speed", 50, 300, 5, 170, function(Value)
  getgenv().TweenSpeed = Value
end, "Misc/TweenSpeed"})

Misc:AddSlider({"Bring Mobs Distance", 50, 500, 10, 250, function(Value)
  getgenv().BringMobsDistance = Value or 250
end, "Misc/BringMobsDistance"})

Misc:AddSlider({"Auto Click Delay", 0.15, 1, 0.01, 0.2, function(Value)
  getgenv().AutoClickDelay = Value
end, "Misc/AutoClickDelay"})

Misc:AddToggle({"Fast Attack", true, function(Value)
  getgenv().FastAttack = Value
end, "Misc/FastAttack"})

Misc:AddToggle({"Increase Attack Distance", true, function(Value)
  getgenv().AttackDistance = Value
  task.spawn(AttackDistance)
end, "Misc/IncreaseAttackDistance"})

Misc:AddToggle({"Auto Click", true, function(Value)
  getgenv().AutoClick = Value
end, "Misc/AutoClick"})

Misc:AddToggle({"Bring Mobs", true, function(Value)
  getgenv().BringMobs = Value
end, "Misc/BringMobs"})

Misc:AddToggle({"Auto Haki", true, function(Value)
  getgenv().AutoHaki = Value
end, "Misc/AutoHaki"})

Misc:AddSection({"Codes"})
Misc:AddButton({
  Name = "Redeem all Codes",
  Callback = function()
    local Codes = {
      "REWARDFUN",
      "Chandler",
      "NEWTROLL",
      "KITT_RESET",
      "Sub2CaptainMaui",
      "DEVSCOOKING",
      "kittgaming",
      "Sub2Fer999",
      "Enyu_is_Pro",
      "Magicbus",
      "JCWK",
      "Starcodeheo",
      "Bluxxy",
      "fudd10_v2",
      "SUB2GAMERROBOT_EXP1",
      "Sub2NoobMaster123",
      "Sub2UncleKizaru",
      "Sub2Daigrock",
      "Axiore",
      "TantaiGaming",
      "StrawHatMaine",
      "Sub2OfficialNoobie",
      "Fudd10",
      "Bignews",
      "TheGreatAce",
      "DRAGONABUSE",
      "SECRET_ADMIN",
      "ADMIN_TROLL",
      "STAFFBATTLE",
      "ADMIN_STRENGTH",
      "JULYUPDATE_RESET",
      "NOOB_REFUND",
      "15B_BESTBROTHERS",
      "CINCODEMAYO_BOOST",
      "ADMINGIVEAWAY",
      "GAMER_ROBOT_1M",
      "SUBGAMERROBOT_RESET",
      "SUB2GAMERROBOT_RESET1",
      "GAMERROBOT_YT",
      "TY_FOR_WATCHING",
      "EXP_5B",
      "RESET_5B",
      "UPD16",
      "3BVISITS",
      "2BILLION",
      "UPD15",
      "THIRDSEA",
      "1MLIKES_RESET",
      "UPD14",
      "1BILLION",
      "ShutDownFix2",
      "XmasExp",
      "XmasReset",
      "Update11",
      "PointsReset",
      "Update10",
      "Control",
      "SUB2OFFICIALNOOBIE",
      "AXIORE",
      "BIGNEWS",
      "BLUXXY",
      "CHANDLER",
      "ENYU_IS_PRO",
      "FUDD10",
      "FUDD10_V2",
      "KITTGAMING",
      "MAGICBUS",
      "STARCODEHEO",
      "STRAWHATMAINE",
      "SUB2CAPTAINMAUI",
      "SUB2DAIGROCK",
      "SUB2FER999",
      "SUB2NOOBMASTER123",
      "SUB2UNCLEKIZARU",
      "TANTAIGAMING",
      "THEGREATACE",
      "CONTROL",
      "UPDATE11",
      "XMASEXP",
      "Colosseum"
    }
    
    for _,code in pairs(Codes) do
      task.spawn(function()ReplicatedStorage.Remotes.Redeem:InvokeServer(code)end)
    end
  end
})

Misc:AddSection({"Team"})
Misc:AddButton({"Join Pirates Team", function()
  FireRemote("SetTeam", "Pirates")
end})
Misc:AddButton({"Join Marines Team", function()
  FireRemote("SetTeam", "Marines")
end})
Misc:AddSection({"Menu"})

Misc:AddButton({"Devil Fruit Shop", function()
  FireRemote("GetFruits")
	Player.PlayerGui.Main.FruitShop.Visible = true
end})

Misc:AddButton({"Titles", function()
  FireRemote("getTitles")
  Player.PlayerGui.Main.Titles.Visible = true
end})

Misc:AddButton({"Haki Color", function()
  Player.PlayerGui.Main.Colors.Visible = true
end})

Misc:AddSection({"Visual"})

Misc:AddButton({"Remove Fog", function()
  local LightingLayers, Sky = Lighting:FindFirstChild("LightingLayers"), Lighting:FindFirstChild("Sky")
  if Sky then
    Sky:Destroy()
  end
  if LightingLayers then
    LightingLayers:Destroy()
  end
end})

Misc:AddSection({"More FPS"})

Misc:AddToggle({"Remove Damage", true, function(Value)
  ReplicatedStorage.Assets.GUI.DamageCounter.Enabled = not Value
end, "Misc/RemoveDamage"})
table.insert(AFKOptions, Misc:AddToggle({"Remove Notifications", false, function(Value)
  Player.PlayerGui.Notifications.Enabled = not Value
end, "Misc/RemoveNotifications"}))

Misc:AddSection({"Others"})

Misc:AddToggle({"Walk On Water", true, function(Value)
  getgenv().WalkOnWater = Value
  task.spawn(function()
    local Map = workspace:WaitForChild("Map", 9e9)
    
    while getgenv().WalkOnWater do task.wait(0.1)
      Map:WaitForChild("WaterBase-Plane", 9e9).Size = Vector3.new(1000, 113, 1000)
    end
    Map:WaitForChild("WaterBase-Plane", 9e9).Size = Vector3.new(1000, 80, 1000)
  end)
end, "Misc/WalkOnWater"})
Misc:AddToggle({"Anti AFK", true, function(Value)
  getgenv().AntiAFK = Value
  task.spawn(function()
    while getgenv().AntiAFK do
      VirtualUser:CaptureController()
      VirtualUser:ClickButton1(Vector2.new(math.huge, math.huge))task.wait(600)
    end
  end)
end, "Misc/AntiAFK"})

--[[Shop:AddSection({"Christmas"})
Shop:AddButton({"Buy 2x EXP (15 mins.) < 50 Candies >", function()FireRemote("Candies", "Check")FireRemote("Candies", "Buy", 1, 1)end})
Shop:AddButton({"Stats Refund < 75 Candies >", function()FireRemote("Candies", "Check")FireRemote("Candies", "Buy", 1, 2)end})
Shop:AddButton({"Race Reroll < 100 Candies >", function()FireRemote("Candies", "Check")FireRemote("Candies", "Buy", 1, 3)end})
Shop:AddSection({""})
Shop:AddButton({"Buy 200 Frags < 50 Candies >", function()FireRemote("Candies", "Check")FireRemote("Candies", "Buy", 2, 2)end})
Shop:AddButton({"Buy 500 Frags < 100 Candies >", function()FireRemote("Candies", "Check")FireRemote("Candies", "Buy", 2, 2)end})
Shop:AddSection({"Bones"})
Shop:AddButton({"Buy Surprise < 50 Bones >", function()FireRemote("Bones", "Buy", 1, 1)end})
Shop:AddButton({"Stats Refund < 150 Bones >", function()FireRemote("Bones", "Buy", 1, 2)end})
Shop:AddButton({"Race Reroll < 300 Bones >", function()FireRemote("Bones", "Buy", 1, 3)end})]]
--[[Shop:AddSection({"Ectoplasm"})
Shop:AddButton({"Midnight Blade", function()end})
Shop:AddButton({"Bizarre Rifle", function()end})
Shop:AddButton({"Midnight Blade", function()end})]]
Shop:AddSection({"Frags"})
Shop:AddButton({"Race Rerol", function()
FireRemote("BlackbeardReward", "Reroll", "1")FireRemote("BlackbeardReward", "Reroll", "2")end})
Shop:AddButton({"Reset Stats", function()
FireRemote("BlackbeardReward", "Refund", "1")FireRemote("BlackbeardReward", "Refund", "2")end})
Shop:AddSection({"Fighting Style"})
Shop:AddButton({"Buy Black Leg", function()FireRemote("BuyBlackLeg")end})
Shop:AddButton({"Buy Electro", function()FireRemote("BuyElectro")end})
Shop:AddButton({"Buy Fishman Karate", function()FireRemote("BuyFishmanKarate")end})
Shop:AddButton({"Buy Dragon Claw", function()
FireRemote("BlackbeardReward","DragonClaw","1")FireRemote("BlackbeardReward","DragonClaw","2")end})
Shop:AddButton({"Buy Superhuman", function()FireRemote("BuySuperhuman")end})
Shop:AddButton({"Buy Death Step", function()FireRemote("BuyDeathStep")end})
Shop:AddButton({"Buy Sharkman Karate", function()FireRemote("BuySharkmanKarate")end})
Shop:AddButton({"Buy Electric Claw", function()FireRemote("BuyElectricClaw")end})
Shop:AddButton({"Buy Dragon Talon", function()FireRemote("BuyDragonTalon")end})
Shop:AddButton({"Buy GodHuman", function()FireRemote("BuyGodhuman")end})
Shop:AddButton({"Buy Sanguine Art", function()FireRemote("BuySanguineArt")end})
Shop:AddSection({"Ability Teacher"})
Shop:AddButton({"Buy Geppo", function()FireRemote("BuyHaki", "Geppo")end})
Shop:AddButton({"Buy Buso", function()FireRemote("BuyHaki", "Buso")end})
Shop:AddButton({"Buy Soru", function()FireRemote("BuyHaki", "Soru")end})
Shop:AddSection({"Sword"})
Shop:AddButton({"Buy Katana", function()FireRemote("BuyItem", "Katana")end})
Shop:AddButton({"Buy Cutlass", function()FireRemote("BuyItem", "Cutlass")end})
Shop:AddButton({"Buy Dual Katana", function()FireRemote("BuyItem", "Dual Katana")end})
Shop:AddButton({"Buy Iron Mace", function()FireRemote("BuyItem", "Iron Mace")end})
Shop:AddButton({"Buy Triple Katana", function()FireRemote("BuyItem", "Triple Katana")end})
Shop:AddButton({"Buy Pipe", function()FireRemote("BuyItem", "Pipe")end})
Shop:AddButton({"Buy Dual-Headed Blade", function()FireRemote("BuyItem", "Dual-Headed Blade")end})
Shop:AddButton({"Buy Soul Cane", function()FireRemote("BuyItem", "Soul Cane")end})
Shop:AddButton({"Buy Bisento", function()FireRemote("BuyItem", "Bisento")end})
Shop:AddSection({"Gun"})
Shop:AddButton({"Buy Musket", function()FireRemote("BuyItem", "Musket")end})
Shop:AddButton({"Buy Slingshot", function()FireRemote("BuyItem", "Slingshot")end})
Shop:AddButton({"Buy Flintlock", function()FireRemote("BuyItem", "Flintlock")end})
Shop:AddButton({"Buy Refined Slingshot", function()FireRemote("BuyItem", "Refined Slingshot")end})
Shop:AddButton({"Buy Refined Flintlock", function()FireRemote("BuyItem", "Refined Flintlock")end})
Shop:AddButton({"Buy Cannon", function()FireRemote("BuyItem", "Cannon")end})
Shop:AddButton({"Buy Kabucha", function()
FireRemote("BlackbeardReward", "Slingshot", "1")FireRemote("BlackbeardReward", "Slingshot", "2")end})
Shop:AddSection({"Accessories"})
Shop:AddButton({"Buy Black Cape", function()FireRemote("BuyItem", "Black Cape")end})
Shop:AddButton({"Buy Swordsman Hat", function()FireRemote("BuyItem", "Swordsman Hat")end})
Shop:AddButton({"Buy Tomoe Ring", function()FireRemote("BuyItem", "Tomoe Ring")end})
Shop:AddSection({"Race"})
Shop:AddButton({"Ghoul Race", function()FireRemote("Ectoplasm", "Change", 4)end})
Shop:AddButton({"Cyborg Race", function()FireRemote("CyborgTrainer", "Buy")end})

local NotifiFruits = false
local NotifiTime = 15

workspace.ChildAdded:Connect(function(part)
  if NotifiFruits then
    if part:IsA("Tool") or string.find(part.Name, "Fruit") then
      redzlib:MakeNotify({
        Name = "Fruit Notifier",
        Text = "The fruit '" .. part.Name .. "' Spawned on the Map",
        Time = NotifiTime
      })
    end
  end
end)

Visual:AddSection({"Notifications"})
Visual:AddSlider({Name = "Nofication Time",Max = 120, Min = 5, Increase = 1, Default = 15, Callback = function(Value)
  NotifiTime = Value
end, Flag = "Notify/Time"})
Visual:AddToggle({Name = "Fruit Spawn",Callback = function(Value)
  NotifiFruits = Value
end, Flag = "Notify/Fruit"})
Visual:AddSection({"ESP"})
if Sea2 then
Visual:AddToggle({Name = "ESP Flowers",Callback = function(Value)
  getgenv().EspFlowers = Value;EspFlowers()
end})end
Visual:AddToggle({Name = "ESP Players",Callback = function(Value)
  getgenv().EspPlayer = Value;EspPlayer()
end})
Visual:AddToggle({Name = "ESP Fruits",Callback = function(Value)
  getgenv().EspFruits = Value;EspFruits()
end, Flag = "ESP/Fruits"})
Visual:AddToggle({Name = "ESP Chests",Callback = function(Value)
  getgenv().EspChests = Value;EspChests()
end})
Visual:AddToggle({Name = "ESP Islands",Callback = function(Value)
  getgenv().EspIslands = Value;EspIslands()
end})
if IsOwner then
  Visual:AddSection({"Fruits"})
  Visual:AddButton({"Rain Fruit", function(value)
    for _,Fruit in pairs(game:GetObjects("rbxassetid://14759368201")[1]:GetChildren()) do
      Fruit.Parent = Map
      Fruit:MoveTo(Player.Character.PrimaryPart.Position + Vector3.new(math.random(-50, 50), 80, math.random(-50, 50)))
      Fruit:WaitForChild("Handle").Touched:Connect(function(part)
        if part.Parent:FindFirstChild("Humanoid") then
          Fruit.Parent = Players[part.Parent.Name].Backpack
        end
      end)
      pcall(function()
        Fruit.Fruit["AnimationController"]:LoadAnimation(Fruit.Fruit.Idle):Play()
      end)
    end
  end})
  Visual:AddButton({"Bring Fruits", function()
    for _,Fruit in pairs(Map:GetChildren()) do
      if Fruit:IsA("Tool") or Fruit.Name:find("Fruit") then
        Fruit.Parent = Player.Backpack
      end
    end
  end})
end
Visual:AddSection({"Fake"})
Visual:AddParagraph({"Fake Stats"})
Visual:AddTextBox({Name = "Fake Defense",Default = "",PlaceholderText = "Defense",Callback = function(Value)
  Player.Data.Stats.Defense.Level.Value = Value
end})
Visual:AddTextBox({Name = "Fake Fruit",Default = "",PlaceholderText = "Fruit",Callback = function(Value)
  Player.Data.Stats["Demon Fruit"].Level.Value = Value
end})
Visual:AddTextBox({Name = "Fake Gun",Default = "",PlaceholderText = "Gun",Callback = function(Value)
  Player.Data.Stats.Gun.Level.Value = Value
end})
Visual:AddTextBox({Name = "Fake Melee",Default = "",PlaceholderText = "Melee",Callback = function(Value)
  Player.Data.Stats.Melee.Level.Value = Value
end})
Visual:AddTextBox({Name = "Fake Sword",Default = "",PlaceholderText = "Sword",Callback = function(Sword)
  Player.Data.Stats.Sword.Level.Value = Value
end})
Visual:AddParagraph({"Fake Mode"})
Visual:AddTextBox({Name = "Fake Level",Default = "",PlaceholderText = "Level",Callback = function(Value)
  PlayerLevel.Value = Value
end})
Visual:AddTextBox({Name = "Fake Points",Default = "",PlaceholderText = "Points",Callback = function(Value)
  Player.Data.Points.Value = Value
end})
Visual:AddTextBox({Name = "Fake Bounty",Default = "",PlaceholderText = "Bounty",Callback = function(Value)
  Player.leaderstats["Bounty/Honor"].Value = Value
end})
Visual:AddTextBox({Name = "Fake Energy",Default = "",PlaceholderText = "Energy",Callback = function(Value)
  local plrEnergy = Player and Player.Character and Player.Character:FindFirstChild("Energy")
  if plrEnergy then
    plrEnergy.Max = Value
    plrEnergy.Value = Value
  end
end})
Visual:AddTextBox({Name = "Fake Health",Default = "",PlaceholderText = "Health",Callback = function(Value)
  local plrHealth = Player and Player.Character and Player.Character:FindFirstChild("Humanoid")
  if plrHealth then
    plrHealth.MaxHealth = Value
    plrHealth.Health = Value
  end
end})
Visual:AddTextBox({Name = "Fake Money",Default = "",PlaceholderText = "Money",Callback = function(Value)
  Player.Data.Beli.Value = Value
end})
Visual:AddTextBox({Name = "Fake Fragments",Default = "",PlaceholderText = "Fragments",Callback = function(Value)
  Player.Data.Fragments.Value = Value
end})

-- ////////////////////////////////////// --

task.spawn(function()
  local EffectContainer = ReplicatedStorage:WaitForChild("Effect", 9e9):WaitForChild("Container", 9e9)
  
  RunService.RenderStepped:Connect(function()
    local DeathEffect = EffectContainer:FindFirstChild("Death")
    
    if DeathEffect then
      DeathEffect:Destroy()
    end
  end)
  
  hookfunction(error, function()end)
  hookfunction(warn, function()end)
end)
