require "base/internal/ui/gfHUD/config";
require "base/internal/ui/gfHUD/Rectangle";
require "base/internal/ui/gfHUD/Icon";
require "base/internal/ui/gfHUD/Text";


AmmoBox = Drawable:extend({
	status = 0, -- 0 = not pickedup 1 = pickedup not selected 2 = selected
	ammo = 0
});

function AmmoBox:init(args)
	self.super:init(args);

	self.background = Rectangle:new({
		anchorCenter = false,
		width = 168,
		height = 64,
		color = GF_WEAPON_COLORS[self.weaponIndex],
		shadowed = true,
		hidden = true
	});
	self:addChild(self.background);

	self.icon = Icon:new({
		x = 40,
		y = 32,
		color = GF_WEAPON_COLORS[self.weaponIndex],
		svgPath = "internal/ui/icons/weapon" .. self.weaponIndex,
		shadowed = true
	});
	self:addChild(self.icon);

	self.ammoCount = Text:new({
		x = 114.5,
		y = 32,
		text = self.ammo,
		shadowed = true
	});
	self:addChild(self.ammoCount);
end

function AmmoBox:setStatus(status)
	if status < 2 then
		self.background.hidden = true;
		self.icon.shadowed = true;
		self.ammoCount.shadowed = true;
		if status < 1 then
			self.icon.color = GF_COLORS.grey;
			self.ammoCount.color = GF_COLORS.grey;
		else
			self.icon.color = GF_WEAPON_COLORS[self.weaponIndex];
			self.ammoCount.color = GF_COLORS.white;
		end
	else
		self.icon.color = GF_COLORS.white;
		self.background.hidden = false;
		self.icon.shadowed = false;
		self.ammoCount.shadowed = false;
	end

	return self;
end

function AmmoBox:update(player)
	self.ammo = player.weapons[self.weaponIndex].ammo;
	self.ammoCount.text = self.ammo;
	local stat = 0;
	if player.weapons[self.weaponIndex].pickedup then
		stat = stat + 1;
		if self.weaponIndex == player.weaponIndexSelected then
			stat = stat +1;
		end
	end
	self:setStatus(stat);
end
