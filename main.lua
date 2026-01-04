local Players = game:GetService("Players")
local Player = Players.LocalPlayer

-- === SISTEMA DE LLAVE (AGREGADO) ===
local ClaveCorrecta = "BOMBA2036" -- Tu llave configurada
local LinkKey = "https://link-center.net/2636864/IsyGHrpyCwdr" -- Tu link de Linkvertise

local function CrearLogin()
    local sgLogin = Instance.new("ScreenGui", Player:WaitForChild("PlayerGui"))
    sgLogin.Name = "BombaLogin"

    local main = Instance.new("Frame", sgLogin)
    main.Size = UDim2.new(0, 300, 0, 200)
    main.Position = UDim2.new(0.5, -150, 0.4, 0)
    main.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    main.BorderSizePixel = 2

    local title = Instance.new("TextLabel", main)
    title.Size = UDim2.new(1, 0, 0, 40)
    title.Text = "SISTEMA DE LLAVES - BOMBA HUD"
    title.TextColor3 = Color3.new(1,1,1)
    title.BackgroundColor3 = Color3.fromRGB(50, 50, 50)

    local input = Instance.new("TextBox", main)
    input.Size = UDim2.new(0.8, 0, 0, 40)
    input.Position = UDim2.new(0.1, 0, 0.3, 0)
    input.PlaceholderText = "Pega la llave aquí..."
    input.Text = ""

    local btnGet = Instance.new("TextButton", main)
    btnGet.Size = UDim2.new(0.4, 0, 0, 40)
    btnGet.Position = UDim2.new(0.05, 0, 0.65, 0)
    btnGet.Text = "OBTENER KEY"
    btnGet.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
    btnGet.TextColor3 = Color3.new(1,1,1)

    local btnCheck = Instance.new("TextButton", main)
    btnCheck.Size = UDim2.new(0.4, 0, 0, 40)
    btnCheck.Position = UDim2.new(0.55, 0, 0.65, 0)
    btnCheck.Text = "INGRESAR"
    btnCheck.BackgroundColor3 = Color3.fromRGB(0, 100, 200)
    btnCheck.TextColor3 = Color3.new(1,1,1)

    -- Función Copiar Link
    btnGet.MouseButton1Click:Connect(function()
        setclipboard(LinkKey)
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Copiado",
            Text = "Link de Linkvertise copiado al portapapeles",
            Duration = 5
        })
    end)

    -- Función Revisar Llave
    btnCheck.MouseButton1Click:Connect(function()
        if input.Text == ClaveCorrecta then
            sgLogin:Destroy()
            CargarHUD() -- Solo carga si la llave es correcta
        else
            input.Text = ""
            input.PlaceholderText = "LLAVE INCORRECTA"
        end
    end)
end

-- === TU SCRIPT ORIGINAL (DENTRO DE UNA FUNCIÓN) ===
function CargarHUD()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "BOMBA HUD",
        Text = "Acceso Concedido. Cargando...",
        Duration = 5
    })

    local pGui = Player:WaitForChild("PlayerGui")
    if pGui:FindFirst
