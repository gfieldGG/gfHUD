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

function gfLowAmmo:draw()
	if not shouldShowHUD() then return end;
	if isRaceMode() then return end;

end
