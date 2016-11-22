require "base/internal/ui/reflexcore"

--

GF_FONT = "robotocondensed-bold";
GF_FONT_SIZE_SMALL = 48;
GF_FONT_SIZE_MEDIUM = 80;
GF_FONT_SIZE_BIG = 128;

GF_COLORS = {
	orange = Color(224, 151, 50),
	green = Color(79, 224, 59),
	purple = Color(224, 50, 224),
	red = Color(224, 50, 52),
	blue = Color(50, 137, 224),
	yellow = Color(224, 224, 50),
	cyan = Color(255, 255, 255),
	dark = Color(51, 51, 51),
	darkred = Color(102, 23, 24),
	white = Color(255, 255, 255)
};

GF_WEAPON_COLORS = {
	GF_COLORS.white,
	GF_COLORS.cyan,
	GF_COLORS.orange,
	GF_COLORS.green,
	GF_COLORS.purple,
	GF_COLORS.red,
	GF_COLORS.blue,
	GF_COLORS.yellow,
	GF_COLORS.white
};

GF_ARMOR_COLORS = {
	GF_COLORS.green,
	GF_COLORS.yellow,
	GF_COLORS.red
};

GF_WEAPON_ORDER = {
	6,
	7,
	8,
	3,
	5,
	4
};

GF_WEAPON_ICON_WIDTH = {
	48,
	48,
	48,
	48,
	48,
	48,
	48
}

function drawSquare (x, y, w, h, color)
	--x = x - (w/2);
	y = y - (h/2);
	nvgBeginPath();
	nvgFillColor(color);
	nvgRoundedRect(x, y, w, h, 2);
	nvgFill();
	--nvgRestore();
end

function drawShadowText (x, y, size, align, color, text)
	nvgFontFace(GF_FONT);
	nvgFontSize(size);
	nvgTextAlign(align, NVG_ALIGN_MIDDLE);

	-- shadow
	nvgFontBlur(24);
	nvgFillColor(Color(0, 0, 0, 51));
	nvgText(x, y, text);
	-- shadow top
	nvgFontBlur(4);
	nvgFillColor(Color(0, 0, 0, 26));
	nvgText(x, y-1, text);
	-- shadow bottom
	nvgFontBlur(4);
	nvgFillColor(Color(0, 0, 0, 84));
	nvgText(x, y+4, text);

	-- text
	nvgFontBlur(0);
	nvgFillColor(color);
	nvgText(x, y, text);
end

function drawShadowSvg (obj)
	-- body...
end
