require "base/internal/ui/gfHUD/Rectangle";
require "base/internal/ui/gfHUD/Icon";
require "base/internal/ui/gfHUD/Text";
require "base/internal/ui/gfHUD/config";


AmmoBox = Drawable:extend({
	status = 0,
	ammo = 0
});

function AmmoBox:init(weaponIndex)
	self.super:init();

	self.weaponIndex = weaponIndex;
	self.background = Rectangle:new({
		anchorCenter = false,
		width = 168,
		height = 64,
		color = GF_WEAPON_COLORS[self.weaponIndex]
	});
	self:addChild(self.background);

	self.icon = Icon:new({
		x = 40,
		y = 32,
		color = GF_WEAPON_COLORS[self.weaponIndex],
		svgPath = "internal/ui/icons/weapon" .. self.weaponIndex,
	});
	self:addChild(self.icon);

	self.ammoCount = Text:new({
		x = 114.5,
		y = 32,
		text = self.ammo
	});
	self:addChild(self.ammoCount);
end
