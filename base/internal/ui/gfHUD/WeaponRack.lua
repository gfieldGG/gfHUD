require "base/internal/ui/gfHUD/imports";
if GF_IMPORTED.WeaponRack then return; end

require "base/internal/ui/gfHUD/Drawable";
require "base/internal/ui/gfHUD/AmmoBox";


WeaponRack = Drawable:extend();

function WeaponRack:init(args)
	self.super:init(args);

	self.ammoBoxes = {};
	local xPos = 0;
	local yPos = 0;
	for k, v in ipairs(GF_WEAPON_ORDER) do
		if k>1 then break; end
		if k == 4 then
			xPos = 0;
			yPos = yPos + 80;
		end

		table.insert(self.ammoBoxes, AmmoBox:new({
			weaponIndex = v,
			x = xPos,
			y = yPos
		}));
		xPos = xPos + 192
	end
	self:addChildren(self.ammoBoxes);
end

function WeaponRack:_draw()
	local player = getPlayer();
	for k, v in ipairs(self.ammoBoxes) do
		v:update(player);
	end
end
