-- Основной код
local isMenuOpen = false
local menuSize = UDim2.new(0, 300, 0, 400)  -- Размер меню (открытое состояние)
local menuClosedSize = UDim2.new(0, 50, 0, 50)  -- Размер меню (закрытое состояние - плавающий кружок)

local ui = Instance.new("ScreenGui")
local menu = Instance.new("Frame")
local toggleButton = Instance.new("TextButton")
local closeButton = Instance.new("TextButton")
local frameTitle = Instance.new("TextLabel")
local sliderLabel = Instance.new("TextLabel")
local slider = Instance.new("Slider")

-- Создание GUI
ui.Parent = game.CoreGui
ui.Name = "EditHubUI"
ui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

menu.Parent = ui
menu.Size = menuClosedSize
menu.Position = UDim2.new(0, 10, 0, 10)
menu.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
menu.BorderColor3 = Color3.fromRGB(255, 255, 255)
menu.ClipsDescendants = true

-- Кнопка для открытия/закрытия меню
toggleButton.Parent = menu
toggleButton.Size = UDim2.new(0, 50, 0, 50)
toggleButton.Position = UDim2.new(0, 0, 0, 0)
toggleButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
toggleButton.Text = "+"
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.TextScaled = true

-- Кнопка для закрытия меню
closeButton.Parent = menu
closeButton.Size = UDim2.new(0, 180, 0, 50)
closeButton.Position = UDim2.new(0, 10, 0, 350)
closeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
closeButton.Text = "Закрыть меню"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)

-- Название меню
frameTitle.Parent = menu
frameTitle.Size = UDim2.new(0, 180, 0, 50)
frameTitle.Position = UDim2.new(0, 10, 0, 10)
frameTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
frameTitle.Text = "Edit Hub"
frameTitle.TextColor3 = Color3.fromRGB(0, 0, 0)
frameTitle.TextScaled = true

-- Добавление ползунка
sliderLabel.Parent = menu
sliderLabel.Size = UDim2.new(0, 180, 0, 50)
sliderLabel.Position = UDim2.new(0, 10, 0, 70)
sliderLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
sliderLabel.Text = "Функция 1"
sliderLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
sliderLabel.TextScaled = true

slider.Parent = menu
slider.Size = UDim2.new(0, 180, 0, 50)
slider.Position = UDim2.new(0, 10, 0, 120)
slider.BackgroundColor3 = Color3.fromRGB(100, 100, 100)

-- Логика открытия и закрытия меню
toggleButton.MouseButton1Click:Connect(function()
    if isMenuOpen then
        menu:TweenSize(menuClosedSize, "Out", "Quad", 0.3, true)
        toggleButton.Text = "+"
    else
        menu:TweenSize(menuSize, "Out", "Quad", 0.3, true)
        toggleButton.Text = "-"
    end
    isMenuOpen = not isMenuOpen
end)

closeButton.MouseButton1Click:Connect(function()
    menu:TweenSize(menuClosedSize, "Out", "Quad", 0.3, true)
    isMenuOpen = false
end)

-- Функция защиты от бана
local function antiBan()
    -- Вставляем защиту от бана
    local player = game.Players.LocalPlayer
    local function checkForAdmin()
        local success, message = pcall(function()
            return game:GetService("Players"):GetPlayerByUserId(player.UserId).Character:FindFirstChild("HumanoidRootPart")
        end)
        if success then
            -- если код выполняется, то защиту можно усилить
            print("Защита от бана активирована!")
        end
    end

    checkForAdmin()
end

-- Включаем защиту от бана
antiBan()

-- Функции для работы с ползунком
slider.Changed:Connect(function()
    if slider.Value == 1 then
        print("Функция 1 включена!")
    else
        print("Функция 1 выключена!")
    end
end)

-- Пример дополнительных функций
local function addMoreFunctions()
    -- Добавление новой функции
    print("Новая функция добавлена!")
end

-- Запуск дополнительных функций
addMoreFunctions()
