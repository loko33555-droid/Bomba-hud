local Players = game:GetService("Players")
local Player = Players.LocalPlayer

-- Notificación de inicio
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "BOMBA HUD",
    Text = "Script Cargado Correctamente",
    Duration = 5
})

-- Limpieza de interfaces previas
local pGui = Player:WaitForChild("PlayerGui")
if pGui:FindFirstChild("BombaHudFinal") then pGui.BombaHudFinal:Destroy() end

-- Crear Interfaz Principal
local sg = Instance.new("ScreenGui", pGui)
sg.Name = "BombaHudFinal"
sg.ResetOnSpawn = false

-- Botón Rojo para Abrir/Cerrar
local btn = Instance.new("TextButton", sg)
btn.Size = UDim2.new(0, 100, 0, 50)
btn.Position = UDim2.new(0.5, -50, 0.2, 0)
btn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
btn.Text = "ABRIR HUD"
btn.TextColor3 = Color3.new(1,1,1)
btn.Draggable = true
btn.Active = true

-- Menú Negro
local frame = Instance.new("Frame", sg)
frame.Size = UDim2.new(0, 220, 0, 300)
frame.Position = UDim2.new(0.5, -110, 0.3, 0)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
frame.Visible = false

-- Lista con Scroll
local scroll = Instance.new("ScrollingFrame", frame)
scroll.Size = UDim2.new(1, 0, 1, -40)
scroll.Position = UDim2.new(0, 0, 0, 40)
scroll.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
scroll.CanvasSize = UDim2.new(0, 0, 2, 0)

local layout = Instance.new("UIListLayout", scroll)
layout.Padding = UDim.new(0, 5)

-- Función de Teletransporte
local function TP(x)
    local char = Player.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        char.HumanoidRootPart.CFrame = CFrame.new(x, 7, char.HumanoidRootPart.Position.Z)
    end
end

-- Función para añadir botones de zonas
local function Add(txt, color, x)
    local b = Instance.new("TextButton", scroll)
    b.Size = UDim2.new(1, 0, 0, 35)
    b.BackgroundColor3 = color
    b.Text = txt
    b.TextColor3 = Color3.new(1,1,1)
    b.MouseButton1Click:Connect(function() TP(x) end)
end

-- Botones de Teletransporte
Add("🏠 LOBBY (122)", Color3.fromRGB(100, 100, 100), 122)
Add("🟢 COMÚN (239)", Color3.fromRGB(0, 180, 0), 239)
Add("🔵 NO COMÚN (334)", Color3.fromRGB(0, 100, 200), 334)
Add("🟦 RARA (464)", Color3.fromRGB(0, 0, 255), 464)
Add("🟣 ÉPICA (734)", Color3.fromRGB(150, 0, 200), 734)
Add("🟠 LEGENDARIA (1044)", Color3.fromRGB(255, 120, 0), 1044)
Add("🔴 MÍTICA (1532)", Color3.fromRGB(200, 0, 0), 1532)
Add("🌌 CÓSMICA (2193)", Color3.fromRGB(50, 0, 100), 2193)
Add("⚫ SECRETA (2397)", Color3.fromRGB(0, 0, 0), 2397) -- Zona Secreta

-- Botón God Mode
local godBtn = Instance.new("TextButton", frame)
godBtn.Size = UDim2.new(1, 0, 0, 35)
godBtn.Text = "GOD MODE: OFF"
godBtn.BackgroundColor3 = Color3.fromRGB(80, 0, 0)
godBtn.TextColor3 = Color3.new(1,1,1)

local god = false
godBtn.MouseButton1Click:Connect(function()
    god = not god
    godBtn.Text = god and "GOD MODE: ON" or "GOD MODE: OFF"
    godBtn.BackgroundColor3 = god and Color3.fromRGB(0, 150, 0) or Color3.fromRGB(80, 0, 0)
end)

-- Bucle de God Mode
game:GetService("RunService").Heartbeat:Connect(function()
    if god and Player.Character then
        for _, v in pairs(Player.Character:GetDescendants()) do
            if v:IsA("BasePart") then v.CanTouch = false end
        end
    end
end)

-- Acción de Abrir/Cerrar menú
btn.MouseButton1Click:Connect(function()
    frame.Visible = not frame.Visible
end)
