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

local function drawBuff (x, y, buff, percent)
	drawBox(x, y, 24, 24, buff[2]);
	nvgBeginPath();
	nvgFillColor(GF_COLORS.white);
	nvgSvg(buff[1], x+12, y, buff[3]);
end

--

function gfBuffs:draw()
	if not shouldShowHUD() then return end;

	local player = getPlayer();
	if player == nil then return end;

	local x = -12;
	local y = -241;

	-- carnage
	if player.carnageTimer > 0 then
		drawBuff(x, y, GF_BUFFS.carnage);
		y = y - 32;
	end

	-- resist
	if player.resistTimer > 0 then
		drawBuff(x, y, GF_BUFFS.resist);
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
