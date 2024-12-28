-- Получаем ссылку на персонажа
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local rightArm = character:WaitForChild("RightArm")
local rightShoulder = character:WaitForChild("RightUpperArm"):WaitForChild("RightShoulder")

-- Функция для изменения угла плеча
local function raiseRightArm()
    -- Получаем текущий угол
    local currentAngle = rightShoulder.C0
    -- Применяем изменение на 40 градусов (переводим в радианы)
    local newAngle = currentAngle * CFrame.Angles(0, math.rad(40), 0)
    -- Устанавливаем новый угол
    rightShoulder.C0 = newAngle
end

-- Создание GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 100) -- Размер меню
frame.Position = UDim2.new(0.5, -100, 0.5, -50) -- Позиция меню
frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Цвет фона
frame.BackgroundTransparency = 0.5
frame.Parent = screenGui

-- Создание кнопки
local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 180, 0, 50) -- Размер кнопки
button.Position = UDim2.new(0, 10, 0, 25) -- Позиция кнопки
button.Text = "Ziga" -- Текст на кнопке
button.TextColor3 = Color3.fromRGB(255, 255, 255) -- Цвет текста
button.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Цвет фона кнопки
button.Parent = frame

-- Код, который будет выполняться при нажатии на кнопку
local function onButtonClick()
    print("Кнопка Ziga нажата!")
    -- Включаем код для поднятия руки
    raiseRightArm()
end

-- Привязываем событие нажатия на кнопку
button.MouseButton1Click:Connect(onButtonClick)
