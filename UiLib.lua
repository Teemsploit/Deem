local libary = {}

function libary:CreateWindow()
	local DeemUI = Instance.new("ScreenGui")
	local TopMain = Instance.new("Frame")
	local Main = Instance.new("Frame")
	local Grid = Instance.new("UIGridLayout")
	local Title = Instance.new("TextLabel")
	local Close = Instance.new("TextButton")
	
	DeemUI.Name = math.random(1, 999999999)
	DeemUI.Parent = game.CoreGui
	DeemUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	
	TopMain.Name = math.random(1, 99999999)
	TopMain.Parent = DeemUI
	TopMain.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
	TopMain.BorderColor3 = Color3.fromRGB(27, 53, 27)
	TopMain.BorderSizePixel = 0
	TopMain.Position = UDim2.new(0.377266705, 0, 0.40765956, 0)
	TopMain.Size = UDim2.new(0, 596, 0, 30)
	
	Main.Name = math.random(1, 99999999)
	Main.Parent = TopMain
	Main.BackgroundColor3 = Color3.fromRGB(51, 51, 51)
	Main.BorderColor3 = Color3.fromRGB(27, 42, 53)
	Main.BorderSizePixel = 0
	Main.Position = UDim2.new(0, 0, 1, 0)
	Main.Size = UDim2.new(0, 596, 0, 353)
	Grid.Name = math.random(1, 99999999)
Grid.Parent = Main
Grid.SortOrder = Enum.SortOrder.LayoutOrder
Grid.CellSize = UDim2.new(0, 111, 0, 24)

Title.Name = " Title"
Title.Parent = TopMain
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.BorderSizePixel = 0
Title.Position = UDim2.new(0.427852362, 0, 0, 0)
Title.Size = UDim2.new(0, 86, 0, 30)
Title.Font = Enum.Font.SourceSansSemibold
Title.Text = "Deem b0.1"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 20.000

Close.Name = math.random(1, 99999999)
Close.Parent = TopMain
Close.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
Close.BorderSizePixel = 0
Close.Position = UDim2.new(0.949664414, 0, 0, 0)
Close.Size = UDim2.new(0, 30, 0, 30)
Close.Font = Enum.Font.SourceSans
Close.Text = "x"
Close.TextColor3 = Color3.fromRGB(255, 255, 255)
Close.TextSize = 20.000
local function Drag() -- TopMain.UIDrag 
	local script = Instance.new('LocalScript', TopMain)

	local UserInputService = game:GetService("UserInputService")
	
	local gui = script.Parent
	
	local dragging
	local dragInput
	local dragStart
	local startPos
	
	local function update(input)
		local delta = input.Position - dragStart
		gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
	
	gui.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = gui.Position
	
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	
	gui.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	
	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)
end
coroutine.wrap(Drag)()
local function CloseButton() -- Close.CloseScript 
	local script = Instance.new('LocalScript', Close)

	local function OnClicked()
		script.Parent.Parent:Remove()
	end
	
	script.Parent.MouseButton1Click:connect(OnClicked)
end
coroutine.wrap(CloseButton)()

local DeemLib ={}

function DeemLib:CreateButton(text, callback)

	local callback = callback or function() end

local TextButton = Instance.new("TextButton")

TextButton.Parent = Main
TextButton.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(0.375965893, 0, 0.493121713, 0)
TextButton.Size = UDim2.new(0, 146, 0, 20)
TextButton.Font = Enum.Font.SourceSansSemibold
TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton.TextSize = 17.000
TextButton.Text = text
end
return DeemLib
end
