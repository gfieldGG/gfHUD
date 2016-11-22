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
	return string.format("%d:%02d", t.minutes, t.seconds);
end

--

function gfTimer:draw()
	local timerWidth = 216;
	local timerHeight = 96;

	drawSquare(-(timerWidth/2), timerHeight/2, timerWidth, timerHeight, GF_COLORS.dark);

	nvgBeginPath();
	nvgFillColor(GF_COLORS.white);
	nvgTextAlign(NVG_ALIGN_CENTER, NVG_ALIGN_MIDDLE);
	nvgFontFace(GF_FONT);
	if (world.gameState == GAME_STATE_ACTIVE) or (world.gameState == GAME_STATE_ROUNDACTIVE) then
		nvgFontSize(GF_FONT_SIZE_MEDIUM);
		nvgText(0, timerHeight/2, getTime());
	else
		nvgFontSize(GF_FONT_SIZE_SMALL);
		nvgText(0, timerHeight/2, "WARMUP");
	end
end
