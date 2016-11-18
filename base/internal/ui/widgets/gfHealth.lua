
require "base/internal/ui/reflexcore"
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

	nvgFontFace("oswald-bold");
	nvgFontFace("robotocondensed-bold");
	nvgFontSize(150);
	nvgTextAlign(NVG_ALIGN_RIGHT, NVG_ALIGN_BOTTOM);
	nvgText(-20, 0, player.health);
end
