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

local function drawBuff (x, y, color, icon, percent)
	drawBox(x, y, 24, 24, color);
end

function gfBuffs:draw()
	if not shouldShowHUD() then return end;

	local player = getPlayer();
	if player == nil then return end;

	local x = -12;
	local y = -241;

	-- carnage
	if player.carnageTimer > 0 then
		drawBuff(x, y, Color(224,151,50), "internal/ui/icons/carnage");
		y = y - 32;
	end

	-- resist
	if player.resistTimer > 0 then
		drawBuff(x, y, Color(255,120,128), "internal/ui/icons/resist");
		y = y - 32;
	end

	-- mega
	if player.hasMega then
		drawBuff(x, y, Color(49,68,224), "internal/ui/icons/health");
		y = y - 32;
	end

	-- flag
	if player.hasFlag then
		local teamFlagHolding = (player.team == 1) and 2 or 1; -- (other team flag)
		local icon = "internal/ui/icons/CTFflag";
		local iconCol = teamColors[teamFlagHolding];
		drawBuff(x, y, iconCol, icon);
		y = y - 32;
	end
end
