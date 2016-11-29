require "base/internal/ui/reflexcore"

--

GF_FONT = "robotocondensed-bold";
GF_FONT_SIZE_SMALL = 48;
GF_FONT_SIZE_MEDIUM = 80;
GF_FONT_SIZE_BIG = 128;

GF_CORNER_RADIUS = 2;

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
	white = Color(255, 255, 255),
	grey = Color(180, 180, 180),
	darkblue = Color(49,68,224)
};

GF_WEAPON_COLORS = {
	GF_COLORS.white, --meelee
	GF_COLORS.cyan, --burst
	GF_COLORS.orange, --shotgun
	GF_COLORS.green, --grenades
	GF_COLORS.purple, --plasma
	GF_COLORS.red, --rockets
	GF_COLORS.blue, --ion
	GF_COLORS.yellow, --bolt
	GF_COLORS.white --stake
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

GF_BUFFS = {
	mega = {"internal/ui/icons/gfMega", GF_COLORS.darkblue, 7},
	carnage = {"internal/ui/icons/gfCarnage", GF_COLORS.orange, 8},
	resist = {"internal/ui/icons/resist", GF_COLORS.cyan, 7},
	flag = {"internal/ui/icons/CTFflag", GF_COLORS.green, 9.5}
}


function drawBox(x, y, w, h, color)
	-- draw shadows
	local svgName = "internal/ui/gfHUD/" .. w .. h;
	drawShadowSvg(svgName, x+(w/2), y, w/2);

	y = y - (h/2);
	-- draw box
	nvgBeginPath();
	nvgFillColor(color);
	nvgRoundedRect(x, y, w, h, GF_CORNER_RADIUS);
	nvgFill();
end

function drawShadowSvg(svgName, x, y, radius, color)
	-- shadow
	nvgBeginPath();
	nvgFillColor(Color(0, 0, 0, 51));
	nvgSvg(svgName, x, y, radius, 24);
	-- shadow top
	nvgBeginPath();
	nvgFillColor(Color(0, 0, 0, 26));
	nvgSvg(svgName, x, y-1, radius, 4);

	-- shadow bottom
	nvgBeginPath();
	nvgFillColor(Color(0, 0, 0, 85));
	nvgSvg(svgName, x, y+4, radius, 4);

	-- draw svg
	if color == nil then return end; -- skip colored svg if no color
	nvgBeginPath();
	nvgFillColor(color);
	nvgSvg(svgName, x, y, radius);
end

function drawText(x, y, text, color, size, blur)
	nvgBeginPath();
	if blur == nil then blur = 0 end
	nvgFontBlur(blur);
	nvgFillColor(color);
	nvgTextAlign(NVG_ALIGN_CENTER, NVG_ALIGN_MIDDLE);
	nvgFontFace(GF_FONT);

	-- translate from px to nanovg sizing and offset
	nvgFontSize(size*(4/3));
	local yOff = size*0.05;

	nvgText(x, y-yOff, text);
end

function drawShadowText(x, y, size, color, text)
	-- shadow
	drawText(x, y, text, Color(0, 0, 0, 51), size, 24);

	-- shadow top
	drawText(x, y-1, text, Color(0, 0, 0, 26), size, 4);

	-- shadow bottom
	drawText(x, y+4, text, Color(0, 0, 0, 85), size, 4);

	-- text
	drawText(x, y, text, color, size);
end
