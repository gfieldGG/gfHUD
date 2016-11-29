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

	drawShadowText(-144, -253, GF_FONT_SIZE_BIG, GF_COLORS.white, player.health);
end
