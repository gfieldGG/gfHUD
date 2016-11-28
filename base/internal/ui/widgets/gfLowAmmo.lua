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

local function drawAmmo(weapon, ammo){
	local w = 134;
	local h = 64;
	local x = -(w/2);
	local y = -100-(h/2);


	nvgBeginPath();
	nvgFillColor(GF_COLORS.white);
	nvgTextAlign(NVG_ALIGN_CENTER, NVG_ALIGN_MIDDLE);
	nvgFontFace(GF_FONT);
	nvgFontSize(GF_FONT_SIZE_SMALL);

}

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


end
