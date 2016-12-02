require "base/internal/ui/reflexcore";
require "base/internal/ui/gfhud";

--

gfBuffs =
{
};
registerWidget("gfBuffs");

--

function gfBuffs:initialize()

end

--

local function drawBuff (x, y, buff, percent)
	local buffSize = 24;

	drawBox(x, y, buffSize, buffSize, buff[2]);
	drawSvg(x+buffSize/2, y, buff[1], GF_COLORS.white, buff[3]);

	-- draw bufftime bar
	if percent then
		nvgBeginPath();
		nvgFillColor(Color(255, 255, 255, 128))
		nvgRect(x+buffSize+2, y-buffSize/2, 2, buffSize);
		nvgFill();

		nvgBeginPath();
		nvgFillColor(Color(79, 224, 50, 255));
		nvgRect(x+buffSize+2, y-buffSize/2+buffSize-buffSize*percent, 2, buffSize*percent);
		nvgFill();
	end
end

--

function gfBuffs:draw()
	if not shouldShowHUD() then return end;

	local player = getPlayer();
	if player == nil then return end;

	local x = -12;
	local y = -241;
	-- TODO make this nicer
	-- carnage
	if player.carnageTimer > 0 then
		drawBuff(x, y, GF_BUFFS.carnage, player.carnageTimer / 30000);
		y = y - 32;
	end

	-- resist
	if player.resistTimer > 0 then
		drawBuff(x, y, GF_BUFFS.resist, player.carnageTimer / 30000);
		y = y - 32;
	end

	-- mega
	if player.hasMega then
		drawBuff(x, y, GF_BUFFS.mega);
		y = y - 32;
	end

	-- flag
	if player.hasFlag then
		local teamFlagHolding = (player.team == 1) and 2 or 1; -- (other team flag)
		local icon = "internal/ui/icons/CTFflag";
		local iconCol = teamColors[teamFlagHolding];
		drawBuff(x, y, GF_BUFFS.flag); -- TODO use team color
		y = y - 32;
	end
end
