LibPixelControl = LibPixelControl or {
	PX_CONST_1 = 1,
	VK_BACK_SPACE = 2,
	VK_TAB = 3,
	VK_ENTER = 4,
	VK_CLEAR = 5,
	VK_SHIFT = 6,
	VK_CONTROL = 7,
	VK_ALT = 8,
	VK_PAUSE = 9,
	VK_CAPS_LOCK = 10,
	VK_ESCAPE = 11,
	VK_SPACE = 12,
	VK_PAGE_UP = 13,
	VK_PAGE_DOWN = 14,
	VK_END = 15,
	VK_HOME = 16,
	VK_LEFT = 17,
	VK_UP = 18,
	VK_RIGHT = 19,
	VK_DOWN = 20,
	VK_COMMA = 21,
	VK_MINUS = 22,
	VK_PERIOD = 23,
	VK_SLASH = 24,
	PX_CONST_2 = 25,
	VK_0 = 26,
	VK_1 = 27,
	VK_2 = 28,
	VK_3 = 29,
	VK_4 = 30,
	VK_5 = 31,
	VK_6 = 32,
	VK_7 = 33,
	VK_8 = 34,
	VK_9 = 35,
	VK_SEMICOLON = 36,
	VK_EQUALS = 37,
	VK_A = 38,
	VK_B = 39,
	VK_C = 40,
	VK_D = 41,
	VK_E = 42,
	VK_F = 43,
	VK_G = 44,
	VK_H = 45,
	VK_I = 46,
	VK_J = 47,
	VK_K = 48,
	PX_CONST_3 = 49,
	VK_L = 50,
	VK_M = 51,
	VK_N = 52,
	VK_O = 53,
	VK_P = 54,
	VK_Q = 55,
	VK_R = 56,
	VK_S = 57,
	VK_T = 58,
	VK_U = 59,
	VK_V = 60,
	VK_W = 61,
	VK_X = 62,
	VK_Y = 63,
	VK_Z = 64,
	VK_OPEN_BRACKET = 65,
	VK_BACK_SLASH = 66,
	VK_CLOSE_BRACKET = 67,
	VK_NUMPAD0 = 68,
	VK_NUMPAD1 = 69,
	VK_NUMPAD2 = 70,
	VK_NUMPAD3 = 71,
	VK_NUMPAD4 = 72,
	PX_CONST_4 = 73,
	VK_NUMPAD5 = 74,
	VK_NUMPAD6 = 75,
	VK_NUMPAD7 = 76,
	VK_NUMPAD8 = 77,
	VK_NUMPAD9 = 78,
	VK_MULTIPLY = 79,
	VK_ADD = 80,
	VK_SEPARATER = 81,
	VK_SEPARATOR = 82,
	VK_SUBTRACT = 83,
	VK_DECIMAL = 84,
	VK_DIVIDE = 85,
	VK_F1 = 86,
	VK_F2 = 87,
	VK_F3 = 88,
	VK_F4 = 89,
	VK_F5 = 90,
	VK_F6 = 91,
	VK_F7 = 92,
	VK_F8 = 93,
	VK_F9 = 94,
	VK_F10 = 95,
	VK_F11 = 96,
	PX_CONST_5 = 97,
	VK_F12 = 98,
	VK_DELETE = 99,
	VK_NUM_LOCK = 100,
	VK_SCROLL_LOCK = 101,
	VK_AMPERSAND = 102,
	VK_ASTERISK = 103,
	VK_QUOTEDBL = 104,
	VK_LESS = 105,
	VK_PRINTSCREEN = 106,
	VK_INSERT = 107,
	VK_GREATER = 108,
	VK_BRACELEFT = 109,
	VK_BRACERIGHT = 110,
	VK_BACK_QUOTE = 111,
	VK_QUOTE = 112,
	VK_KP_UP = 113,
	VK_KP_DOWN = 114,
	VK_KP_LEFT = 115,
	VK_KP_RIGHT = 116,
	VK_WINDOWS = 117,
	VM_BTN_LEFT = 118,
	VM_BTN_MIDDLE = 119,
	VM_BTN_RIGHT = 120,
	PX_CONST_6 = 121,
	VM_WHEEL_UP = 122,
	VM_WHEEL_DOWN = 123,
	VM_MOVE_UP = 124,
	VM_MOVE_DOWN = 125,
	VM_MOVE_LEFT = 126,
	VM_MOVE_RIGHT = 127,
	VM_MOVE_10_UP = 128,
	VM_MOVE_10_DOWN = 129,
	VM_MOVE_10_LEFT = 130,
	VM_MOVE_10_RIGHT = 131,
}
-- local constants
local cnstX = 3
local cnstY = 0
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
bools[LibPixelControl.PX_CONST_1] = 1
bools[LibPixelControl.PX_CONST_2] = 0
bools[LibPixelControl.PX_CONST_3] = 1
bools[LibPixelControl.PX_CONST_4] = 0
bools[LibPixelControl.PX_CONST_5] = 1
bools[LibPixelControl.PX_CONST_6] = 0
local dataPixels = {}
for i = 1, numDataPixels do
	dataPixels[i] = CreateControl(nil, colorDataWindow, CT_LINE)
	dataPixels[i]:SetAnchor(TOPLEFT, colorDataWindow, TOPLEFT, cnstX+i, cnstY)
	dataPixels[i]:SetAnchor(TOPRIGHT, colorDataWindow, TOPLEFT, cnstX+i+1, cnstY)
	--dataPixels[i]:SetColor((0/255),(0/255),(0/255))
	dataPixels[i]:SetColor(GetRGBFromBoolRange(Subrange(bools,(i*24)-23,(i*24))))
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
		if duration == nil then duration = 20 end
		LibPixelControl.SetIndOn(idx)
		zo_callLater(function() LibPixelControl.SetIndOff(idx) end, duration)
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

