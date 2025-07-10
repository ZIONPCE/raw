--[[
		Compkiller UI 示例
	
	作者：ZiO
	
	按左Alt键打开/关闭
]]

local Compkiller = loadstring(game:HttpGet("https://raw.githubusercontent.com/4lpaca-pin/CompKiller/refs/heads/main/src/source.luau"))();

-- 创建通知 --
local Notifier = Compkiller.newNotify();

-- 创建配置管理器 --
local ConfigManager = Compkiller:ConfigManager({
	Directory = "Compkiller-UI",
	Config = "示例配置"
});

-- 加载UI (图标 <string>, 时长 <number>) --
Compkiller:Loader("rbxassetid://120245531583106", 2.5).yield();

-- 创建窗口 --
local Window = Compkiller.new({
	Name = "COMPKILLER",
	Keybind = "LeftAlt",
	Logo = "rbxassetid://120245531583106",
	Scale = Compkiller.Scale.Window, -- 留空以自动调整比例 [PC, 移动端]
	TextSize = 15,
});

-- 通知 --

Notifier.new({
	Title = "通知",
	Content = "感谢您使用此脚本！",
	Duration = 10,
	Icon = "rbxassetid://120245531583106"
});

-- 水印 --
local Watermark = Window:Watermark();

Watermark:AddText({
	Icon = "user",
	Text = "ZiO",
});

Watermark:AddText({
	Icon = "clock",
	Text = Compkiller:GetDate(),
});

local Time = Watermark:AddText({
	Icon = "timer",
	Text = "时间",
});

task.spawn(function()
	while true do task.wait()
		Time:SetText(Compkiller:GetTimeNow());
	end
end)

Watermark:AddText({
	Icon = "server",
	Text = Compkiller.Version,
});

-- 创建选项卡分类 --
Window:DrawCategory({
	Name = "示例"
});

-- 创建选项卡 --
local NormalTab = Window:DrawTab({
	Name = "示例选项卡",
	Icon = "apple",
	EnableScrolling = true
});

-- 创建分区 --
local NormalSection = NormalTab:DrawSection({
	Name = "分区",
	Position = 'left'	
});

local Toggle = NormalSection:AddToggle({
	Name = "开关",
	Flag = "开关_示例", -- 留空则不保存到配置
	Default = false,
	Callback = print,
});

-- 为开关添加快捷键 --
local Keybind = Toggle.Link:AddKeybind({
	Default = "E",
	Flag = "选项_快捷键",
	Callback = print
});

-- 帮助说明 --
Toggle.Link:AddHelper({
	Text = "非常棒的开关！"
})

-- 为开关添加选项 --
local Toggle2 = NormalSection:AddToggle({
	Name = "开关",
	Flag = "开关_示例2", -- 留空则不保存到配置
	Default = false,
	Callback = print,
});

local Option = Toggle2.Link:AddOption()

Option:AddToggle({
	Name= "示例",
	Flag = "开关_示例3",
	Callback = print
});

do
	local Toggle2 = NormalSection:AddToggle({
		Name = "高风险功能",
		Flag = "开关_示例5", -- 留空则不保存到配置
		Default = false,
		Risky = true,
		Callback = print,
	});

	local Option = Toggle2.Link:AddOption()

	Option:AddToggle({
		Risky = true,
		Name= "高风险功能",
		Flag = "开关_示例6",
		Callback = print
	});
end

NormalSection:AddKeybind({
	Name = "快捷键",
	Default = "LeftAlt",
	Flag = "快捷键_示例",
	Callback = print,
});

NormalSection:AddSlider({
	Name = "滑块",
	Min = 0,
	Max = 100,
	Default = 50,
	Round = 0,
	Flag = "滑块_示例",
	Callback = print
});

NormalSection:AddColorPicker({
	Name = "颜色选择器",
	Default = Color3.fromRGB(0, 255, 140),
	Flag = "颜色选择器_示例",
	Callback = print
})

NormalSection:AddDropdown({
	Name = "单选下拉菜单",
	Default = "头部",
	Flag = "单选_下拉菜单",
	Values = {"头部","身体","手臂","腿部"},
	Callback = print
})

NormalSection:AddDropdown({
	Name = "多选下拉菜单",
	Default = {"头部"},
	Multi = true,
	Flag = "多选_下拉菜单",
	Values = {"头部","身体","手臂","腿部"},
	Callback = print
})

NormalSection:AddButton({
	Name = "按钮",
	Callback = function()
		print('打印!')
	end,
})

NormalSection:AddParagraph({
	Title = "段落",
	Content = "非常棒的段落\n此分区中的所有元素\n都将保存到配置中！"
})

NormalSection:AddTextBox({
	Name = "文本框",
	Placeholder = "占位符",
	Default = "Hello, World",
	Callback = print
})

local DrawElements = function(Tab,Position)
	do
		local NormalSectionRight = Tab:DrawSection({
			Name = "分区",
			Position = Position
		});

		local Toggle = NormalSectionRight:AddToggle({
			Name = "开关",
			Default = false,
			Callback = print,
		});

		-- 为开关添加快捷键 --
		local Keybind = Toggle.Link:AddKeybind({
			Default = "E",
			Callback = print
		});

		-- 为开关添加选项 --
		local Toggle2 = NormalSectionRight:AddToggle({
			Name = "开关",
			Default = false,
			Callback = print,
		});

		local Option = Toggle2.Link:AddOption()

		Option:AddToggle({
			Name= "示例",
			Callback = print
		});

		NormalSectionRight:AddKeybind({
			Name = "快捷键",
			Default = "LeftAlt",
			Callback = print,
		});

		NormalSectionRight:AddSlider({
			Name = "滑块",
			Min = 0,
			Max = 100,
			Default = 50,
	Round = 0,
	Flag = "滑块_示例",
	Callback = print
});

NormalSection:AddColorPicker({
	Name = "颜色选择器",
	Default = Color3.fromRGB(0, 255, 140),
	Flag = "颜色选择器_示例",
	Callback = print
})

NormalSection:AddDropdown({
	Name = "单选下拉菜单",
	Default = "头部",
	Flag = "单选_下拉菜单",
	Values = {"头部","身体","手臂","腿部"},
	Callback = print
})

NormalSection:AddDropdown({
	Name = "多选下拉菜单",
	Default = {"头部"},
	Multi = true,
	Flag = "多选_下拉菜单",
	Values = {"头部","身体","手臂","腿部"},
	Callback = print
})

NormalSection:AddButton({
	Name = "按钮",
	Callback = function()
		print('打印!')
	end,
})

NormalSection:AddParagraph({
	Title = "段落",
	Content = "非常棒的段落\n此分区中的所有元素\n都将保存到配置中！"
})

NormalSection:AddTextBox({
	Name = "文本框",
	Placeholder = "占位符",
	Default = "Hello, World",
	Callback = print
})

local DrawElements = function(Tab,Position)
	do
		local NormalSectionRight = Tab:DrawSection({
			Name = "分区",
			Position = Position
		});

		local Toggle = NormalSectionRight:AddToggle({
			Name = "开关",
			Default = false,
			Callback = print,
		});

		-- 为开关添加快捷键 --
		local Keybind = Toggle.Link:AddKeybind({
			Default = "E",
			Callback = print
		});
		
		-- 为开关添加选项 --
		local Toggle2 = NormalSectionRight:AddToggle({
			Name = "开关",
			Default = false,
			Callback = print,
		});

		local Option = Toggle2.Link:AddOption()

		Option:AddToggle({
			Name= "示例",
			Callback = print
		});

		NormalSectionRight:AddKeybind({
			Name = "快捷键",
			Default = "LeftAlt",
			Callback = print,
		});

		NormalSectionRight:AddSlider({
			Name = "滑块",
			Min = 0,
			Max = 100,
			Default = 50,
			Round = 0,
			Callback = print
		});

		NormalSectionRight:AddColorPicker({
			Name = "颜色选择器",
			Default = Color3.fromRGB(0, 255, 140),
			Callback = print
		})
		
		NormalSectionRight:AddDropdown({
			Name = "单选下拉菜单",
			Default = "头部",
			Values = {"头部","身体","手臂","腿部"},
			Callback = print
		})

		NormalSectionRight:AddDropdown({
			Name = "多选下拉菜单",
			Default = {"头部"},
			Multi = true,
			Values = {"头部","身体","手臂","腿部"},
			Callback = print
		})

		NormalSectionRight:AddButton({
			Name = "按钮",
			Callback = function()
				print('打印!')
			end,
		})

		NormalSectionRight:AddParagraph({
			Title = "段落",
			Content = "非常棒的段落\n此分区中的所有元素\n不会保存到配置中"
		})
	end;
end;

DrawElements(NormalTab,'right')

-- 单选项卡 --
local SingleTab = Window:DrawTab({
	Name = "单选项卡",
	Icon = "banana",
	Type = "Single"
});

DrawElements(SingleTab,'left')

-- 容器选项卡 --
local ContainerTab = Window:DrawContainerTab({
	Name = "提取选项卡",
	Icon = "contact",
});

local ExtractTab = ContainerTab:DrawTab({
	Name = "选项卡 1",
	Type = "Double"
});

local SingleExtractTab = ContainerTab:DrawTab({
	Name = "选项卡 2",
	Type = "Single",
	EnableScrolling = true, -- 允许选项卡滚动（推荐）
});

DrawElements(ExtractTab,"left");
DrawElements(ExtractTab,"right");

DrawElements(SingleExtractTab,"left");
DrawElements(SingleExtractTab,"right");

Window:DrawCategory({
	Name = "其他"
});

local SettingTab = Window:DrawTab({
	Icon = "settings-3",
	Name = "设置",
	Type = "Single",
	EnableScrolling = true
});

local ThemeTab = Window:DrawTab({
	Icon = "paintbrush",
	Name = "主题",
	Type = "Single"
});

local Settings = SettingTab:DrawSection({
	Name = "UI设置",
});

Settings:AddToggle({
	Name = "始终显示框架",
	Default = false,
	Callback = function(v)
		Window.AlwayShowTab = v;
	end,
});

Settings:AddColorPicker({
	Name = "高亮颜色",
	Default = Compkiller.Colors.Highlight,
	Callback = function(v)
		Compkiller.Colors.Highlight = v;
		Compkiller:RefreshCurrentColor();
	end,
});

Settings:AddColorPicker({
	Name = "开关颜色",
	Default = Compkiller.Colors.Toggle,
	Callback = function(v)
		Compkiller.Colors.Toggle = v;
		
		Compkiller:RefreshCurrentColor(v);
	end,
});

Settings:AddColorPicker({
	Name = "下拉菜单颜色",
	Default = Compkiller.Colors.DropColor,
	Callback = function(v)
		Compkiller.Colors.DropColor = v;

		Compkiller:RefreshCurrentColor(v);
	end,
});

Settings:AddColorPicker({
	Name = "高风险颜色",
	Default = Compkiller.Colors.Risky,
	Callback = function(v)
		Compkiller.Colors.Risky = v;

		Compkiller:RefreshCurrentColor(v);
	end,
	});

Settings:AddColorPicker({
	Name = "鼠标悬停颜色",
	Default = Compkiller.Colors.MouseEnter,
	Callback = function(v)
		Compkiller.Colors.MouseEnter = v;

		Compkiller:RefreshCurrentColor(v);
	end,
});

Settings:AddColorPicker({
	Name = "区块颜色",
	Default = Compkiller.Colors.BlockColor,
	Callback = function(v)
		Compkiller.Colors.BlockColor = v;

		Compkiller:RefreshCurrentColor(v);
	end,
});

Settings:AddColorPicker({
	Name = "背景颜色",
	Default = Compkiller.Colors.BGDBColor,
	Callback = function(v)
		Compkiller.Colors.BGDBColor = v;

		Compkiller:RefreshCurrentColor(v);
	end,
});

Settings:AddColorPicker({
	Name = "区块背景颜色",
	Default = Compkiller.Colors.BlockBackground,
	Callback = function(v)
		Compkiller.Colors.BlockBackground = v;

		Compkiller:RefreshCurrentColor(v);
	end,
});

Settings:AddColorPicker({
	Name = "描边颜色",
	Default = Compkiller.Colors.StrokeColor,
	Callback = function(v)
		Compkiller.Colors.StrokeColor = v;

		Compkiller:RefreshCurrentColor(v);
	end,
});

Settings:AddColorPicker({
	Name = "高亮描边颜色",
	Default = Compkiller.Colors.HighStrokeColor,
	Callback = function(v)
		Compkiller.Colors.HighStrokeColor = v;

		Compkiller:RefreshCurrentColor(v);
	end,
});

Settings:AddColorPicker({
	Name = "切换颜色",
	Default = Compkiller.Colors.SwitchColor,
	Callback = function(v)
		Compkiller.Colors.SwitchColor = v;

		Compkiller:RefreshCurrentColor(v);
	end,
});

Settings:AddColorPicker({
	Name = "线条颜色",
	Default = Compkiller.Colors.LineColor,
	Callback = function(v)
		Compkiller.Colors.LineColor = v;

		Compkiller:RefreshCurrentColor(v);
	end,
});

Settings:AddButton({
	Name = "获取主题",
	Callback = function()
		print(Compkiller:GetTheme())
		
		Notifier.new({
			Title = "通知",
			Content = "主题颜色已复制到剪贴板",
			Duration = 5,
			Icon = "rbxassetid://120245531583106"
		});
	end,
});

ThemeTab:DrawSection({
	Name = "UI主题"
}):AddDropdown({
	Name = "选择主题",
	Default = "默认",
	Values = {
		"默认",
		"深绿",
		"深蓝",
		"紫玫瑰",
		"Skeet"
	},
	Callback = function(v)
		Compkiller:SetTheme(v)
	end,
})

-- 创建配置选项卡 --
local ConfigUI = Window:DrawConfig({
	Name = "配置",
	Icon = "folder",
	Config = ConfigManager
});

ConfigUI:Init();
