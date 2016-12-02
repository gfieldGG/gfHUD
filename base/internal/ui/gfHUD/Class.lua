local Class = {};
Class.__index = Class;


function Class:new(obj)
	obj = obj or {};
	setmetatable(obj, self);

	obj.super = getmetatable(self);

	self.__index = self;

	return obj;
end


return Class;
