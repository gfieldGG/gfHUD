require "base/internal/ui/reflexcore";
require "base/internal/ui/gfhud";

--

gfLowAmmo =
{
};
registerWidget("gfLowAmmo");

--

function gfLowAmmo:initialize()

end

--

local function drawAmmo(weapon, ammo)
	local w = 128;
	local h = 64;
	local x = -w/2;
	local y = -424-(h/2);

	local icon = "internal/ui/icons/weapon"..weapon;
	drawBox(x, y, w, h, GF_COLORS.darkred);
	x = x + 32;
	drawSvg(x, y, icon, GF_COLORS.white, 24);
	x = x +24+8+28;
	drawText(x, y, ammo, GF_COLORS.white, GF_FONT_SIZE_SMALL);
end

function gfLowAmmo:draw()
	if not shouldShowHUD() then return end;
	if isRaceMode() then return end;

	local player = getPlayer();
	if not player then return end;

	local weaponIndexSelected = player.weaponIndexSelected;
	if weaponDefinitions[weaponIndexSelected] == nil then return end;

	local lowAmmoWarning = weaponDefinitions[weaponIndexSelected].lowAmmoWarning;
	local ammo = player.weapons[weaponIndexSelected].ammo;

	local showLowAmmoWarning = (ammo <= lowAmmoWarning);
	if showLowAmmoWarning then
		drawAmmo(weaponIndexSelected, ammo);
	end
end
