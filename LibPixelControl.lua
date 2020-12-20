LibPixelControl = LibPixelControl or {
	VK_BACK_SPACE = 1,
	VK_TAB = 2,
	VK_ENTER = 3,
	VK_CLEAR = 4,
	VK_SHIFT = 5,
	VK_CONTROL = 6,
	VK_ALT = 7,
	VK_PAUSE = 8,
	VK_CAPS_LOCK = 9,
	VK_ESCAPE = 10,
	VK_SPACE = 11,
	VK_PAGE_UP = 12,
	VK_PAGE_DOWN = 13,
	VK_END = 14,
	VK_HOME = 15,
	VK_LEFT = 16,
	VK_UP = 17,
	VK_RIGHT = 18,
	VK_DOWN = 19,
	VK_COMMA = 20,
	VK_MINUS = 21,
	VK_PERIOD = 22,
	VK_SLASH = 23,
	VK_0 = 24,
	VK_1 = 25,
	VK_2 = 26,
	VK_3 = 27,
	VK_4 = 28,
	VK_5 = 29,
	VK_6 = 30,
	VK_7 = 31,
	VK_8 = 32,
	VK_9 = 33,
	VK_SEMICOLON = 34,
	VK_EQUALS = 35,
	VK_A = 36,
	VK_B = 37,
	VK_C = 38,
	VK_D = 39,
	VK_E = 40,
	VK_F = 41,
	VK_G = 42,
	VK_H = 43,
	VK_I = 44,
	VK_J = 45,
	VK_K = 46,
	VK_L = 47,
	VK_M = 48,
	VK_N = 49,
	VK_O = 50,
	VK_P = 51,
	VK_Q = 52,
	VK_R = 53,
	VK_S = 54,
	VK_T = 55,
	VK_U = 56,
	VK_V = 57,
	VK_W = 58,
	VK_X = 59,
	VK_Y = 60,
	VK_Z = 61,
	VK_OPEN_BRACKET = 62,
	VK_BACK_SLASH = 63,
	VK_CLOSE_BRACKET = 64,
	VK_NUMPAD0 = 65,
	VK_NUMPAD1 = 66,
	VK_NUMPAD2 = 67,
	VK_NUMPAD3 = 68,
	VK_NUMPAD4 = 69,
	VK_NUMPAD5 = 70,
	VK_NUMPAD6 = 71,
	VK_NUMPAD7 = 72,
	VK_NUMPAD8 = 73,
	VK_NUMPAD9 = 74,
	VK_MULTIPLY = 75,
	VK_ADD = 76,
	VK_SEPARATER = 77,
	VK_SEPARATOR = 78,
	VK_SUBTRACT = 79,
	VK_DECIMAL = 80,
	VK_DIVIDE = 81,
	VK_F1 = 82,
	VK_F2 = 83,
	VK_F3 = 84,
	VK_F4 = 85,
	VK_F5 = 86,
	VK_F6 = 87,
	VK_F7 = 88,
	VK_F8 = 89,
	VK_F9 = 90,
	VK_F10 = 91,
	VK_F11 = 92,
	VK_F12 = 93,
	VK_DELETE = 94,
	VK_NUM_LOCK = 95,
	VK_SCROLL_LOCK = 96,
	VK_AMPERSAND = 97,
	VK_ASTERISK = 98,
	VK_QUOTEDBL = 99,
	VK_LESS = 100,
	VK_PRINTSCREEN = 101,
	VK_INSERT = 102,
	VK_GREATER = 103,
	VK_BRACELEFT = 104,
	VK_BRACERIGHT = 105,
	VK_BACK_QUOTE = 106,
	VK_QUOTE = 107,
	VK_KP_UP = 108,
	VK_KP_DOWN = 109,
	VK_KP_LEFT = 110,
	VK_KP_RIGHT = 111,
	VK_WINDOWS = 112,
	VM_BTN_LEFT = 113,
	VM_BTN_MIDDLE = 114,
	VM_BTN_RIGHT = 115,
	VM_WHEEL_UP = 116,
	VM_WHEEL_DOWN = 117,
	VM_MOVE_UP = 118,
	VM_MOVE_DOWN = 119,
	VM_MOVE_LEFT = 120,
	VM_MOVE_RIGHT = 121,
	VM_MOVE_10_UP = 122,
	VM_MOVE_10_DOWN = 123,
	VM_MOVE_10_LEFT = 124,
	VM_MOVE_10_RIGHT = 125,
}
-- local constants
local cnstX = 0
local cnstY = 7
local cnstColor = "010203"
local cnstEndColor = "030201"
local numDataPixels = 6
-- local functions
local function Subrange(t, first, last)
	local sub = {}
	for i=first,last do sub[#sub + 1] = t[i] end
	return sub
end
local function GetOffsetIntColorValFromBools(o, bools)
	return ((bools[o+8] * 1) + (bools[o+7] * 2) + (bools[o+6] * 3) + (bools[o+5] * 4) + (bools[o+4] * 5) + (bools[o+3] * 6) + (bools[o+2] * 7) + (bools[o+1] * 8)) / 255
end
local function GetColorValFromBoolVals(b1, b2, b3, b4, b5, b6, b7, b8)
	return ((b8 * 1) + (b7 * 2) + (b6 * 3) + (b5 * 4) + (b4 * 5) + (b3 * 6) + (b2 * 7) + (b1 * 8)) / 255
end
local function GetIntFromBool(bools)
	local sum = 0
	for i=0,7 do sum = sum + bools[8-i] * math.pow(2, i) end
	return sum
end
local function GetRGBFromBoolRange(bools)
	r = (GetIntFromBool(Subrange(bools,1,8)) or 0) / 255
	g = (GetIntFromBool(Subrange(bools,9,16)) or 0) / 255
	b = (GetIntFromBool(Subrange(bools,17,24)) or 0) / 255
	return r, g, b
end
local function GetColorFromHex(hex, alpha)
	local r, g, b = hex:match("(%w%w)(%w%w)(%w%w)")
	r = (tonumber(r, 16) or 0) / 255
	g = (tonumber(g, 16) or 0) / 255
	b = (tonumber(b, 16) or 0) / 255
	return r, g, b, alpha or 1
end
-- local objects
local colorDataWindow = WINDOW_MANAGER:CreateTopLevelWindow("LibPixelControlWin")
colorDataWindow:SetDimensions(10,10)
local colorDataLineCnst = CreateControl(nil, colorDataWindow, CT_LINE)
colorDataLineCnst:SetAnchor(TOPLEFT, colorDataWindow, TOPLEFT, cnstX+0, cnstY)
colorDataLineCnst:SetAnchor(TOPRIGHT, colorDataWindow, TOPLEFT, cnstX+1, cnstY)
colorDataLineCnst:SetColor(GetColorFromHex(cnstColor))
local bools = {}
for i=1,24*numDataPixels do bools[i] = 0 end
local dataPixels = {}
for i = 1, numDataPixels do
	dataPixels[i] = CreateControl(nil, colorDataWindow, CT_LINE)
	dataPixels[i]:SetAnchor(TOPLEFT, colorDataWindow, TOPLEFT, cnstX+i, cnstY)
	dataPixels[i]:SetAnchor(TOPRIGHT, colorDataWindow, TOPLEFT, cnstX+i+1, cnstY)
	dataPixels[i]:SetColor((0/255),(0/255),(0/255))
end
local colorDataLineEndCnst = CreateControl(nil, colorDataWindow, CT_LINE)
colorDataLineEndCnst:SetAnchor(TOPLEFT, colorDataWindow, TOPLEFT, cnstX+numDataPixels+1, cnstY)
colorDataLineEndCnst:SetAnchor(TOPRIGHT, colorDataWindow, TOPLEFT, cnstX+numDataPixels+2, cnstY)
colorDataLineEndCnst:SetColor(GetColorFromHex(cnstEndColor))

-- public functions
function LibPixelControl.SetIndOn(idx)
	if idx then
		bools[idx] = 1
		for i = 1, numDataPixels do
			dataPixels[i]:SetColor(GetRGBFromBoolRange(Subrange(bools,(i*24)-23,(i*24))))
			--dataPixels[i]:SetColor(
			--	GetOffsetIntColorValFromBools((i*8)-8, bools),
			--	GetOffsetIntColorValFromBools((i*8)-0, bools),
			--	GetOffsetIntColorValFromBools((i*8)+8, bools))
			--dataPixels[1]:SetColor(
			--	GetColorValFromBoolVals(bools[1], bools[2], bools[3], bools[4], bools[5], bools[6], bools[7], bools[8]),
			--	GetColorValFromBoolVals(bools[9], bools[10], bools[11], bools[12], bools[13], bools[14], bools[15], bools[16]),
			--	GetColorValFromBoolVals(bools[17], bools[18], bools[19], bools[20], bools[21], bools[22], bools[23], bools[24]))
		end
	else
		d("no index:"..tostring(idx))
	end
end
function LibPixelControl.SetIndOff(idx)
	if idx then
		bools[idx] = 0
		for i = 1, numDataPixels do
			dataPixels[i]:SetColor(GetRGBFromBoolRange(Subrange(bools,(i*24)-23,(i*24))))
		end
	else
		d("no index:"..tostring(idx))
	end
end
function LibPixelControl.SetIndOnFor(idx, duration)
	--d("SetIndOnFor idx:"..tostring(idx).." duration:"..tostring(duration))
	if idx then
		LibPixelControl.SetIndOn(idx)
		if duration then
			zo_callLater(function() LibPixelControl.SetIndOff(idx) end, duration)
		end
	else
		d("no index:"..tostring(idx))
	end
end
function LibPixelControl.IsIndOn(idx)
	if idx then
		return bools[idx] == 1
	else
		d("no index:"..tostring(idx))
	end
end

local testlocalval = 1
function LibPixelControl:SelfSetVal(val)
	testlocalval = val
	return testlocalval
end
function LibPixelControl:SelfGetVal()
	return testlocalval
end
function LibPixelControl.SetVal(val)
	testlocalval = val
	return testlocalval
end
function LibPixelControl.GetVal()
	return testlocalval
end

function LibPixelControl:SelfPrintVal(val)
	d(val)
end
function LibPixelControl:SelfGetBackVal(val)
	return val
end
function LibPixelControl.PrintVal(val)
	d(val)
end
function LibPixelControl.GetBackVal(val)
	return val
end

