require "base/internal/ui/reflexcore"
require "base/internal/ui/gfhud"

--

gfTimer =
{
};
registerWidget("gfTimer");

--

function gfTimer:initialize()

end

--

local function getTime()
	timeToShow = world.gameTime;
	if timeToShow > world.gameTimeLimit then
		timeToShow = world.gameTimeLimit;
	end
	local t = FormatTime(timeToShow);
	return string.format("%02d:%02d", t.minutes, t.seconds);
end

--

function gfTimer:draw()
	if not shouldShowHUD() then return end;

	local timerWidth = 216;
	local timerHeight = 96;

	drawBox(-(timerWidth/2), timerHeight/2, timerWidth, timerHeight, GF_COLORS.dark);

	if (world.gameState == GAME_STATE_ACTIVE) or (world.gameState == GAME_STATE_ROUNDACTIVE) then
		drawText(0, timerHeight/2, getTime(), GF_COLORS.white, GF_FONT_SIZE_MEDIUM);
	else
		drawText(0, timerHeight/2, "WARMUP", GF_COLORS.white, GF_FONT_SIZE_SMALL);
	end
end
