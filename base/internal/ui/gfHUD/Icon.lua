require "base/internal/ui/gfHUD/Shadowable";

Icon = Shadowable:new();

function Icon:draw()
	self.super.draw(self);

	nvgBeginPath();
	nvgFillColor(self.color);
	nvgSvg(self.svgPath, self.absoluteX, self.absoluteY, self.width/2);
	nvgFill();
end

function Icon:shadowFunction(shadow)
	nvgBeginPath();
	nvgFillColor(shadow.color);
	nvgSvg(self.svgPath, (self.absoluteX + shadow.offsetX),(self.absoluteY + shadow.offsetY), self.width/2, shadow.blur);
	nvgFill();
end
