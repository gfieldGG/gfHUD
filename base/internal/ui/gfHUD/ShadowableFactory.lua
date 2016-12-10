require "base/internal/ui/gfHUD/imports";
if GF_IMPORTED.ShadowableFactory then return; end

require "base/internal/ui/gfHUD/Drawable";


function ShadowableFactory(shadows)
	local Shadowable = Drawable:extend({
		shadowed = true
	});


	function Shadowable:drawShadow()
		if not self.shadowed then return end;
		for i, v in ipairs(shadows) do
			self:shadowFunction(v);
		end
	end


	function Shadowable:_draw()
		consolePrint("draw shadow" .. shadows[1].blur);
		consolePrint(getmetatable(self).__index == Shadowable and "shadtrue" or "shadfalse");
		self:drawShadow();
	end

	return Shadowable;
end
