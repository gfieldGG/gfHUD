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
	return player.weapons[GF_WEAPON_ORDER[slot]].ammo;
end

--

function gfAmmo:draw()
	if not shouldShowHUD() then return end;
	if isRaceMode() then return end;

	local player = getPlayer();

	nvgFontFace(GF_FONT);
	nvgFontSize(GF_FONT_SIZE_SMALL);
	nvgTextAlign(NVG_ALIGN_CENTER, NVG_ALIGN_MIDDLE);

	local ammoWidth = 168;
	local ammoHeight = 64;
	local iconRadius = 24;
	local startx = -276;
	local y = -152;

	local line = 1;
	local x = startx;

	for i = 1, 6 do
		if i == 4 then -- break lines
			y = y + 80;
			x = startx;
		end

		local weapon = GF_WEAPON_ORDER[i];
		local svgName = "internal/ui/icons/weapon"..weapon;

		if weapon == player.weaponIndexSelected then
			drawSquare(x, y, ammoWidth, ammoHeight, GF_WEAPON_COLORS[weapon]);
			x = x + 40;
			nvgFillColor(GF_COLORS.white);
			nvgSvg(svgName, x, y, iconRadius);
			x = x + 74.5;
			nvgText(x, y, player.weapons[weapon].ammo);
			x = x + 77.5;
		else
			if not player.weapons[weapon].pickedup then
				nvgFillColor(GF_COLORS.grey);
			else
				nvgFillColor(GF_WEAPON_COLORS[weapon]);
			end
			x = x + 40;

			nvgSvg(svgName, x, y, iconRadius);
			x = x + 74.5;
			drawShadowText(x, y, GF_FONT_SIZE_SMALL, NVG_ALIGN_CENTER, GF_COLORS.white, player.weapons[weapon].ammo);
			x = x + 77.5;
		end
	end
end
