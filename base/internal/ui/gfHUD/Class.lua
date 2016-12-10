require "base/internal/ui/gfHUD/imports";
if GF_IMPORTED.Class then return; end

local function patchMethod(method, super)
	return function(oldself, ...)
		if oldself.super ~= nil then
			oldself = getmetatable(oldself).__index;
		end
		local newself = { super = super };
		setmetatable(newself, {
			__index = oldself,
			__newindex = oldself
		});
		return method(newself, ...);
	end
end

local function newIndexFactory(class)
	return function(table, key, value)
		if type(value) ~= "function" then
			rawset(table, key, value);
			return;
		end
		rawset(table, key, patchMethod(value, class));
	end
end

Class = {};

function Class:extend(class)
	if class == nil then class = {} end;
	for k, v in pairs(class) do
		if type(v) == "function" then
			rawset(class, k, patchMethod(v, class));
		end
	end

	class.__index = class;
	class.__newindex = newIndexFactory(class);

	setmetatable(class, self);

	return class;
end

function Class:new(...)
	local object = {};
	setmetatable(object, { __index = self });
	object:init(...);
	return object;
end

function Class:init(object)
	if object == nil then return end

	for k, v in pairs(object) do
		self[k] = v;
	end
end

Class.__index = Class;
Class.__newindex = newIndexFactory(Class);



A = Class:extend();
function A:m()
	consolePrint(self.super == Class and "mtrue" or "mfalse");
	consolePrint(self.x);
	self:n();
end
function A:o()
	consolePrint(self.super == Class and "otrue" or "ofalse");
	--consolePrint(self.x);
end

B = A:extend();


C = B:extend();
function C:n()
	consolePrint(self.super == B and "ntrue" or "nfalse");
	self:o();
end


c = C:new({ x = function()end});

c:m();
