
require "base/internal/ui/reflexcore"
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

	nvgFontFace("robotocondensed-bold");
	nvgFontSize(150);
	nvgTextAlign(NVG_ALIGN_LEFT, NVG_ALIGN_BOTTOM);
	nvgText(20, 0, player.armor);
end
