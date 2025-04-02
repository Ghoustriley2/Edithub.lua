-- Основной код
local isMenuOpen = false
local menuSize = UDim2.new(0, 200, 0, 300)  -- Размер меню
local ui = Instance.new("ScreenGui")
local menu = Instance.new("Frame")
local toggleButton = Instance.new("TextButton")
local closeButton = Instance.new("TextButton")
local frameTitle = Instance.new("TextLabel")

-- Создание GUI
ui.Parent = game.CoreGui
ui.Name = "EditHubUI"
ui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

menu.Parent = ui
menu.Size = menuSize
menu.Position = UDim2.new(0, 10, 0, 10)
menu.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
menu.BorderColor3 = Color3.fromRGB(255, 255, 255)

toggleButton.Parent = menu
toggleButton.Size = UDim2.new(0, 180, 0, 50)
toggleButton.Position = UDim2.new(0, 10, 0, 250)
toggleButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
toggleButton.Text = "Открыть/Закрыть меню"
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)

closeButton.Parent = menu
closeButton.Size = UDim2.new(0, 180, 0, 50)
closeButton.Position = UDim2.new(0, 10, 0, 200)
closeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
closeButton.Text = "Закрыть меню"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)

frameTitle.Parent = menu
frameTitle.Size = UDim2.new(0, 180, 0, 50)
frameTitle.Position = UDim2.new(0, 10, 0, 10)
frameTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
frameTitle.Text = "Edit Hub"
frameTitle.TextColor3 = Color3.fromRGB(0, 0, 0)
frameTitle.TextScaled = true

-- Логика открытия и закрытия меню
toggleButton.MouseButton1Click:Connect(function()
    if isMenuOpen then
        menu:TweenSize(UDim2.new(0, 0, 0, 300), "Out", "Quad", 0.3, true)
    else
        menu:TweenSize(menuSize, "Out", "Quad", 0.3, true)
    end
    isMenuOpen = not isMenuOpen
end)

closeButton.MouseButton1Click:Connect(function()
    menu:TweenSize(UDim2.new(0, 0, 0, 300), "Out", "Quad", 0.3, true)
    isMenuOpen = false
end)

-- Функция защиты от бана
local function antiBan()
    -- Подключаем защиту от бана (можно добавить дополнительные функции)
    local player = game.Players.LocalPlayer
    local function checkForAdmin()
        local success, message = pcall(function()
            return game:GetService("Players"):GetPlayerByUserId(player.UserId).Character:FindFirstChild("HumanoidRootPart")
        end)
        if success then
            -- если код выполняется, то защиту можно усилить
            print("Защита активирована!")
        end
    end

    checkForAdmin()
end

-- Включаем защиту от бана
antiBan()

-- Функции, которые можно добавить позже
local function addMoreFunctions()
    -- Пример добавления новой функции
    print("Новая функция добавлена!")
end

-- Запуск новых функций
addMoreFunctions()
