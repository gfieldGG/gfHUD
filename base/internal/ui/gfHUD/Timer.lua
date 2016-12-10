require "base/internal/ui/gfHUD/imports";
if GF_IMPORTED.Timer then return; end

require "base/internal/ui/gfHUD/Drawable";
require "base/internal/ui/gfHUD/Rectangle";
require "base/internal/ui/gfHUD/Text";


Timer = Drawable:extend({
	ingame = false
});

function Timer:init()
	self.background = Rectangle:new({
		x = self.x,
		y = self.y,
		width = 208,
		height = 96,
		color = GF_COLORS.dark
	});
	self:addChild(self.background);

	self.time = Text:new({
		x = self.background.width/2,
		y = self.background.height/2,
		text = "WARMUP",
		shadowed = false
	});
	self:addChild(self.time);
end
