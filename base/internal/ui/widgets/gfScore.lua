require "base/internal/ui/reflexcore"
require "base/internal/ui/gfhud"

--

gfScore =
{
};
registerWidget("gfScore");

--

function gfScore:initialize()

end

--

local function sortDescending(a, b)
	return a.score > b.score;
end

function gfScore:GetDeltaColorAndText()

    local textColor = Color(255,255,255,255);
    local frameColor = Color(48,48,48,255);
	local deltaScore = 0;

	-- team game?
	local gameMode = gamemodes[world.gameModeIndex];
	if gameMode.hasTeams then
		local teamToDisplayFrom;

		-- displaying from a player POV or global POV?
		if (playerIndexCameraAttachedTo > 0) and (players[playerIndexCameraAttachedTo].state == PLAYER_STATE_INGAME) then
			-- displaying from this players POV
			teamToDisplayFrom = players[playerIndexCameraAttachedTo].team;
		else
			-- display from winners POV
			teamToDisplayFrom = world.teams[1].score > world.teams[2].score and 1 or 2;
		end

		-- displaying from this players POV
		frameColor = teamColors[teamToDisplayFrom];
		deltaScore = world.teams[1].score - world.teams[2].score;
		if (teamToDisplayFrom == 2) then
			deltaScore = -deltaScore;
		end

	else

		local playersSorted = {};
		local playersSortedCount = 0;

		-- gather players that are connected & their score
		local playerCount = 0;
		for k, v in pairs(players) do
			playerCount = playerCount + 1;
		end
		for playerIndex = 1, playerCount do
			local player = players[playerIndex];
			if player.connected and (player.state == PLAYER_STATE_INGAME) then
				--consolePrint(v.score);
				playersSortedCount = playersSortedCount + 1;
				playersSorted[playersSortedCount] = {};
				playersSorted[playersSortedCount].score = player.score;
				playersSorted[playersSortedCount].index = playerIndex;
			end
		end

		-- sort accordingly
		table.sort(playersSorted, sortDescending);

		-- displaying from a player POV or global POV?
		if (playerIndexCameraAttachedTo > 0) and (players[playerIndexCameraAttachedTo].state == PLAYER_STATE_INGAME) then

			-- displaying from this players POV
			local playerScore = players[playerIndexCameraAttachedTo].score;
			if playersSorted[1].index == playerIndexCameraAttachedTo then
				-- winning..
				if playersSortedCount > 1 then
					-- by how much..?
					deltaScore = playerScore - playersSorted[2].score;
				end
			else
				deltaScore = playerScore - playersSorted[1].score;
			end

		else

			-- display from winners POV
			if playersSortedCount > 1 then
				deltaScore = playersSorted[1].score - playersSorted[2].score;
			end

		end
	end

	-- format nicely
	if deltaScore == -0 then deltaScore = 0 end;
	if deltaScore > 0 then
		deltaScore = "+"..deltaScore;
	end

	-- don't show score in racemode, as it's time, and doesn't fit, and racemode needs love :)
	if gameMode.shortName == "race" then
		deltaScore = "-";
	end

	-- set light/dark text color based on adaptive luminance
    local a = 1 - ( 0.299 * frameColor.r + 0.587 * frameColor.g + 0.114 * frameColor.b) / 255;

	if (a < 0.5) then
		textColor = Color(0,0,0,255);
	else
		textColor = Color(255,255,255,255);
	end

	return textColor, frameColor, deltaScore;
end



function gfScore:draw()
	if not shouldShowHUD() then return end;
	if isRaceMode() then return end;

	local scoreWidth = 120;
	local scoreHeight = 96;

	local scoreColor, scoreFrameColor, scoreText = self.GetDeltaColorAndText();

	drawBox(108, scoreHeight/2, scoreWidth, scoreHeight, scoreFrameColor);

	drawText(108+(scoreWidth/2), scoreHeight/2, scoreText, scoreColor, GF_FONT_SIZE_MEDIUM);
end
