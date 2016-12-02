require "base/internal/ui/reflexcore"
require "base/internal/ui/gfhud"

--

gfAmmo =
{
};
registerWidget("gfAmmo");

--

function gfAmmo:initialize()

end

--

local function getAmmo(slot)
	local player = getPlayer();
	return player.weapons[slot].ammo;
end

--

function drawAmmoBox (x, y, weapon, ammo, pickedup, selected)
	local ammoWidth = 168;
	local ammoHeight = 64;
	local iconRadius = 24;

	local weaponColor = GF_WEAPON_COLORS[weapon];
	local svgName = "internal/ui/icons/weapon"..weapon;

	if selected then
		drawBox(x, y, ammoWidth, ammoHeight, weaponColor);
	end
	x = x + 40;
	drawSvg(x, y, svgName, (selected and GF_COLORS.white or (pickedup and weaponColor or GF_COLORS.grey)), iconRadius, not selected);
	x = x + 74.5;
	drawText(x, y, ammo, (pickedup and GF_COLORS.white or GF_COLORS.grey), GF_FONT_SIZE_SMALL, not selected);
end

--

function gfAmmo:draw()
	if not shouldShowHUD() then return end;
	if isRaceMode() then return end;

	local player = getPlayer();

	local startx = -276;
	local y = -152;
	local x = startx;

	for i = 1, 6 do
		if i == 4 then -- break lines
			y = y + 80;
			x = startx;
		end

		local weapon = GF_WEAPON_ORDER[i];

		drawAmmoBox(x, y, weapon, getAmmo(weapon), player.weapons[weapon].pickedup, weapon == player.weaponIndexSelected);
		x = x +192;
	end
end
