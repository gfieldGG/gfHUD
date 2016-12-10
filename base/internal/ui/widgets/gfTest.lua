require "base/internal/ui/gfHUD/imports";
require "base/internal/ui/gfHUD/AmmoBox";
require "base/internal/ui/gfHUD/WeaponRack";
gfTest =
{
};
registerWidget("gfTest");


function gfTest:initialize()
	--[[self.weaponRack = WeaponRack:new({
		x = -276,
		y = -184
	});--]]
	--self.timer = Timer:new({});
	self.icon = Icon:new({shadowed = false});
end

function gfTest:draw()
	--if not shouldShowHUD() then return end;
	--if isRaceMode() then return end;
	--consolePrint("drawing gfTest");
	--self.weaponRack:draw();
	self.icon:draw();
	--self.timer:draw();
end
