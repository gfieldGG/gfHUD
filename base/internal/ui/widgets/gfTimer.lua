require "base/internal/ui/reflexcore"
require "base/internal/ui/gfhud"

--

gfTimer =
{
	lastTickSeconds = -1
};
registerWidget("gfTimer");

--

function gfTimer:initialize()

end

--

local function drawCountdown(x, y)
	local timeRemaining = world.gameTimeLimit - world.gameTime;
	local t = FormatTime(timeRemaining);

	-- this flicks to 0 some times, just clamp it to 1
	t.seconds = math.max(1, t.seconds);

	local text = t.seconds;
	drawText(x, y, text, GF_COLORS.white, GF_FONT_SIZE_MEDIUM);

	if gfTimer.lastTickSeconds ~= t.seconds then
		gfTimer.lastTickSeconds = t.seconds;
		playSound("internal/ui/match/match_countdown_tick"); --TODO add FIGHT when match starts
	end
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

	drawBox(-(timerWidth/2), (timerHeight/2)-1, timerWidth, timerHeight+2, GF_COLORS.dark); --moved 2 units to hide top rounded corners

	if world.timerActive and (world.gameState == GAME_STATE_WARMUP or world.gameState == GAME_STATE_ROUNDPREPARE) then
		drawCountdown(0, timerHeight/2);
	elseif (world.gameState == GAME_STATE_ACTIVE) or (world.gameState == GAME_STATE_ROUNDACTIVE) then
		drawText(0, timerHeight/2, getTime(), GF_COLORS.white, GF_FONT_SIZE_MEDIUM);
	else
		drawText(0, timerHeight/2, "WARMUP", GF_COLORS.white, GF_FONT_SIZE_SMALL);
	end
end
