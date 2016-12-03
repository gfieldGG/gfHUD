Class = {}

local addSuper;

local function makeSuper(obj, base)
	local super = {
		__index = function (table, key)
			local home = base;

			while home ~= nil and rawget(home, key) == nil do
				home = getmetatable(home);
			end

			if home == nil then return nil end

			local f = rawget(home, key);

			return function (oldSelf, ...)
				return f(addSuper(obj, getmetatable(home)), ...);
			end;
		end
	};

	setmetatable(super, super);

	return super;
end

addSuper = function (obj, base)
	local superizedObj = {
		super = makeSuper(obj, base)
	};

	setmetatable(superizedObj, {
		__index = obj,
		__newindex = obj
	});

	return superizedObj;
end

function Class:extend(o)
	self.__index = self;

	o = o or {};

	setmetatable(o, self);

	return o;
end

function Class:new(...)
	local o = self:extend();

	o.super = makeSuper(o, self);

	local init = o.super.init;

	if init ~= nil then init(o, ...) end

	return o;
end

function Class:init(o)
	if o == nil then return end

	for k, v in pairs(o) do
		self[k] = v;
	end
end
