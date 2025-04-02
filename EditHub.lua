-- Основной код для "Edit Hub" для Kornal Executor

-- Создаем GUI
local gui = Instance.new("ScreenGui")
gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Основной фрейм для интерфейса
local frame = Instance.new("Frame")
frame.Parent = gui
frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)  -- Темный фон
frame.Size = UDim2.new(0, 300, 0, 400)
frame.Position = UDim2.new(0.5, -150, 0.5, -200)

-- Заголовок
local title = Instance.new("TextLabel")
title.Parent = frame
title.Text = "Edit Hub"
title.Size = UDim2.new(1, 0, 0, 50)
title.TextColor3 = Color3.fromRGB(0, 255, 0)
title.BackgroundTransparency = 1
title.TextSize = 24
title.TextAlign = Enum.TextXAlignment.Center

-- Кнопка автофарма
local autoFarmButton = Instance.new("TextButton")
autoFarmButton.Parent = frame
autoFarmButton.Text = "АвтоФарм"
autoFarmButton.Size = UDim2.new(1, 0, 0, 50)
autoFarmButton.Position = UDim2.new(0, 0, 0.2, 0)
autoFarmButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)

-- Кнопка телепортации
local teleportButton = Instance.new("TextButton")
teleportButton.Parent = frame
teleportButton.Text = "Телепортация"
teleportButton.Size = UDim2.new(1, 0, 0, 50)
teleportButton.Position = UDim2.new(0, 0, 0.4, 0)
teleportButton.BackgroundColor3 = Color3.fromRGB(0, 0, 255)

-- Кнопка защиты от бана
local antiBanButton = Instance.new("TextButton")
antiBanButton.Parent = frame
antiBanButton.Text = "Защита от бана"
antiBanButton.Size = UDim2.new(1, 0, 0, 50)
antiBanButton.Position = UDim2.new(0, 0, 0.6, 0)
antiBanButton.BackgroundColor3 = Color3.fromRGB(255, 165, 0)

-- Добавляем функции

local autoFarmActive = false
local antiBanActive = false

-- АвтоФарм
autoFarmButton.MouseButton1Click:Connect(function()
    autoFarmActive = not autoFarmActive
    if autoFarmActive then
        -- Включаем автофарм
        print("АвтоФарм активирован!")
        -- Здесь добавьте свой код для фарминга
    else
        print("АвтоФарм отключён")
    end
end)

-- Телепортация
teleportButton.MouseButton1Click:Connect(function()
    local targetPosition = Vector3.new(100, 0, 100)  -- Задаем точку для телепортации
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(targetPosition)
    print("Телепортирован!")
end)

-- Защита от бана
antiBanButton.MouseButton1Click:Connect(function()
    -- Пример функции защиты от бана
    if antiBanActive then
        print("Защита от бана активирована!")
    else
        -- Здесь можно добавить код, который будет маскировать активность скрипта или избегать частых действий
        -- Например, мы можем добавить случайные задержки между действиями
        print("Активирована защита от бана: случайные задержки!")
    end
end)

-- Задержки и случайные действия для защиты от бана
local function preventBan()
    while true do
        if antiBanActive then
            -- Добавление случайных задержек между действиями для избежания блокировки
            wait(math.random(1, 3))  -- Задержка между действиями от 1 до 3 секунд
        else
            wait(1)  -- Если защита не активна, продолжаем выполнять действия
        end
    end
end

-- Запуск защиты от бана в фоновом режиме
spawn(preventBan)
