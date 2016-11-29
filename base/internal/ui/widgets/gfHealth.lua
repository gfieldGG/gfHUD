require "base/internal/ui/reflexcore"
require "base/internal/ui/gfhud"

--

gfHealth =
{
};
registerWidget("gfHealth");

--

function gfHealth:initialize()

end

--

function gfHealth:draw()
	if not shouldShowHUD() then return end;
	if isRaceMode() then return end;

	local player = getPlayer();

	drawText(-144, -253, player.health, GF_COLORS.white, GF_FONT_SIZE_BIG, true);
end
