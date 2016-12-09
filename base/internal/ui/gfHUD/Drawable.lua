require "base/internal/ui/gfHUD/Class";


Drawable = Class:extend({
	x = 0,
	y = 0,
	absoluteX = 0,
	absoluteY = 0,
	parent = nil,
	hidden = false
});


function Drawable:init(preset)
	self.super:init(preset);
	self.children = {};

	self:updateAbsolutePosition();
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

function Drawable:addChildren(children)
	for k, v in ipairs(children) do
		self:addChild(v);
	end
end


function Drawable:updateAbsolutePosition()
	if self.parent then
		self.absoluteX = self.parent.absoluteX + self.x;
		self.absoluteY = self.parent.absoluteY + self.y;
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
	if self.hidden then return end;
	self:_draw();
	for i, v in ipairs(self.children) do
		v:draw();
	end
end


function Drawable:_draw()
end
