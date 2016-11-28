require "base/internal/ui/reflexcore"
require "base/internal/ui/gfhud"

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
	local h = 56;
	local x = -w/2;
	local y = -424-(h/2);

	local icon = "internal/ui/icons/weapon"..weapon;
	drawBox(x,y,w,h, GF_COLORS.darkred);
	x = x + 32;
	nvgBeginPath();
	nvgFillColor(GF_COLORS.white);
	nvgSvg(icon, x, y, 24);
	x = x +24+8+28;
	nvgBeginPath();
	nvgFillColor(GF_COLORS.white);
	nvgTextAlign(NVG_ALIGN_CENTER, NVG_ALIGN_MIDDLE);
	nvgFontFace(GF_FONT);
	nvgFontSize(GF_FONT_SIZE_SMALL);
	nvgText(x, y-3, ammo);
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
