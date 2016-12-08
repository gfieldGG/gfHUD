GF_FONT = {
	font = "robotocondensed-bold",
	size = {
		small = 48,
		medium = 80,
		big = 128
	}
};

GF_SIZES = {
	cornerRadius = 2,
	iconWidth = 48
};

GF_COLORS = {
	orange = Color(224, 151, 50),
	green = Color(79, 224, 59),
	purple = Color(224, 50, 224),
	red = Color(224, 50, 52),
	blue = Color(50, 137, 224),
	yellow = Color(224, 204, 50),
	cyan = Color(0, 255, 255),
	dark = Color(51, 51, 51),
	darkred = Color(102, 23, 24),
	white = Color(255, 255, 255),
	grey = Color(180, 180, 180),
	darkblue = Color(49,68,224)
};

GF_SHADOWS = {
	{
		offsetX = 0,
		offsetY = 0,
		color = Color(0, 0, 0, 51),
		blur = 24
	}, {
		offsetX = 0,
		offsetY = -1,
		color = Color(0, 0, 0, 26),
		blur = 4
	}, {
		offsetX = 0,
		offsetY = 4,
		color = Color(0, 0, 0, 85),
		blur = 4
	}
}

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
