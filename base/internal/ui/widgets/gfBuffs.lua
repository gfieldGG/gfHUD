require "base/internal/ui/reflexcore"
require "base/internal/ui/gfhud"

--

gfBuffs =
{
};
registerWidget("gfBuffs");

--

function gfBuffs:initialize()

end

--

function gfBuffs:draw()
	if not shouldShowHUD() then return end;
	if isRaceMode() then return end;

end
