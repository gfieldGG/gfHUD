require "base/internal/ui/reflexcore"
require "base/internal/ui/gfhud"

--

gfArmor =
{
};
registerWidget("gfArmor");

--

function gfArmor:initialize()

end

--

function gfArmor:draw()
	if not shouldShowHUD() then return end;
	if isRaceMode() then return end;

	local player = getPlayer();

	drawText(144, -253, player.armor, GF_ARMOR_COLORS[player.armorProtection+1], GF_FONT_SIZE_BIG, true);
end
