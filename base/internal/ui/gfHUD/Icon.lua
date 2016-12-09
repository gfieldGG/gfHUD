require "base/internal/ui/gfHUD/config";
require "base/internal/ui/gfHUD/Shadowable";

Icon = Shadowable:extend({
	width = GF_SIZES.iconWidth,
	color = GF_COLORS.white,
	svgPath = "base/internal/ui/icons/reflexlogo"
});

function Icon:_draw()
	self.super:_draw();

	nvgBeginPath();
	nvgFillColor(self.color);
	nvgSvg(self.svgPath, self.absoluteX, self.absoluteY, self.width/2);
end

function Icon:shadowFunction(shadow)
	nvgBeginPath();
	nvgFillColor(shadow.color);
	nvgSvg(self.svgPath, (self.absoluteX + shadow.offsetX),(self.absoluteY + shadow.offsetY), self.width/2, shadow.blur);
end
