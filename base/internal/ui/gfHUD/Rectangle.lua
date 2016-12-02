require "base/internal/ui/gfHUD/Shadowable";

Rectangle = Shadowable:new({
	width = 8,
	height = 8,
	color = Color(255, 255, 255, 255),
	cornerRadius = 2
});


function Rectangle:draw()
	self.super.draw(self);

	nvgBeginPath();
	nvgFillColor(self.color);
	nvgRoundedRect(self.absoluteX, self.absoluteY, self.width, self.height, self.cornerRadius);
	nvgFill();
end


function Rectangle:shadowFunction(shadows)
	if shadows.blur == nil then shadows.blur = 0 end

	nvgBeginPath();
	nvgFillColor(shadows.color);
	local svgName = "internal/ui/gfHUD/svg/" .. self.width .. self.height;
	nvgSvg(svgName, ((self.absoluteX + shadows.offsetX) + self.width/2), ((self.absoluteY + shadows.offsetY) + self.height/2), self.width/2, shadows.blur);
end

return Rectangle;
