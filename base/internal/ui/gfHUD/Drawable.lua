require "base/internal/ui/gfHUD/Class";


Drawable = Class:extend({
	x = 0,
	y = 0,
	absoluteX = 0,
	absoluteY = 0,
	children = {},
	parent = nil
});


function Drawable:init(x, y)
	self:setPosition(x, y);
end


function Drawable:setPosition(x, y)
	self.x = x;
	self.y = y;
	self:updateAbsolutePosition();

	return self;
end


function Drawable:addChild(child)
	child.parent = self;
	child:updateAbsolutePosition();
	table.insert(self.children, child);

	return self;
end


function Drawable:updateAbsolutePosition()
	if parent then
		self.absoluteX = parent.absoluteX + self.x;
		self.absoluteY = parent.absoluteY + self.y;
	else
		self.absoluteX = self.x;
		self.absoluteY = self.y;
	end

	for i, v in ipairs(self.children) do
		v:updateAbsolutePosition();
	end

	return self;
end


function Drawable:draw()
	for i, v in ipairs(self.children) do
		v:draw();
	end
end
