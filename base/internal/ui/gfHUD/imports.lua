require "base/internal/ui/gfHUD/config";

if GF_IMPORTED then return; end
GF_IMPORTED = {};

setmetatable(GF_IMPORTED, {
	__index = function(table, key)
		if rawget(GF_IMPORTED, key) then return true; end
		rawset(GF_IMPORTED, key, true);
		return false;
	end
});
