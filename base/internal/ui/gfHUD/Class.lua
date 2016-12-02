Class = {}

function Class:extend(o)
	self.__index = self;

	o = o or {};

	setmetatable(o, self);
	o.super = getmetatable(self);

	return o;
end

function Class:new(o)
	o = self:extend(o);

	if o.init ~= nil then o:init() end

	return o;
end
