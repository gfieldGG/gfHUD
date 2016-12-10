require "base/internal/ui/gfHUD/imports";
if GF_IMPORTED.Icon then return; end

require "base/internal/ui/gfHUD/Shadowable";


Icon = Shadowable:extend({
	width = GF_SIZES.iconWidth,
	color = GF_COLORS.white,
	svgPath = "internal/ui/icons/reflexlogo"
});

function Icon:init (args)
	consolePrint(self.super == Shadowable and "trues" or "falses");
	self.super:init(args);
	consolePrint(type(self.shadowFunction));
end

function Icon:_draw()
	consolePrint("in icon: " .. type(self.shadowFunction));
	consolePrint(self.super == Shadowable and "true" or "false");
	self.super:_draw();
	consolePrint("drawing icon");
	consolePrint(self.svgPath);
	nvgBeginPath();
	nvgFillColor(self.color);
	nvgSvg(self.svgPath, self.absoluteX, self.absoluteY, self.width/2);
end

function Icon:shadowFunction(shadow)
	consolePrint("shadow function" .. shadow.blur);
	nvgBeginPath();
	nvgFillColor(shadow.color);
	nvgSvg(self.svgPath, (self.absoluteX + shadow.offsetX),(self.absoluteY + shadow.offsetY), self.width/2, shadow.blur);
end
