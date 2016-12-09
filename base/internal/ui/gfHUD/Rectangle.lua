require "base/internal/ui/gfHUD/config";
require "base/internal/ui/gfHUD/Shadowable";


Rectangle = Shadowable:extend({
	cornerRadius = GF_SIZES.cornerRadius,
	anchorCenter = false
});


function Rectangle:_draw()
	self.super:_draw();

	local x, y = self:getTopLeft();
	nvgBeginPath();
	nvgFillColor(self.color);
	nvgRoundedRect(x, y, self.width, self.height, self.cornerRadius);
	nvgFill();
end


function Rectangle:shadowFunction(shadow)
	local x, y = self:getCenter();
	nvgBeginPath();
	nvgFillColor(shadow.color);
	local svgName = "internal/ui/gfHUD/svg/" .. self.width .. self.height;
	nvgSvg(svgName, x + shadow.offsetX, y + shadow.offsetY, self.width/2, shadow.blur);
end


function Rectangle:getTopLeft()
	local x = 0;
	local y = 0;
	if self.anchorCenter then
		x = self.absoluteX - self.width/2;
		y =	self.absoluteY - self.height/2;
		return x, y;
	else
		return self.absoluteX, self.absoluteY;
	end
end

function Rectangle:getCenter()
	local x = 0;
	local y = 0;
	if not self.anchorCenter then
		x = self.absoluteX + self.width/2;
		y =	self.absoluteY + self.height/2;
		return x, y;
	else
		return self.absoluteX, self.absoluteY;
	end
end
