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
	--timeNearlyUp = timeToShow > world.gameTimeLimit - lowTime;
	local t = FormatTime(timeToShow);
	--return string.format("%d:%02d", t.minutes, t.seconds);
	--consolePrint(string.format("%d:%02d", t.minutes, t.seconds))
	--nvgText(0,0,string.format("%d:%02d", t.minutes, t.seconds));
end

--

function gfTimer:draw()
	--nvgSvg("internal/ui/icons/weapon2", 0, 0, 50);
	drawShadowText(0, 0, GF_FONT_SIZE_MEDIUM, NVG_ALIGN_CENTER, GF_COLORS.white, "O");
--[[
	if (world.gameState == GAME_STATE_ACTIVE) or (world.gameState == GAME_STATE_ROUNDACTIVE) then
		nvgFontFace(GF_FONT);
		nvgFontSize(GF_FONT_SIZE_MEDIUM);
		nvgText(0, 0, getTime());
	else
		nvgFontFace(GF_FONT);
		nvgFontSize(GF_FONT_SIZE_SMALL);
		nvgText(0, 0, "WARMUP");
	end --]]
end
