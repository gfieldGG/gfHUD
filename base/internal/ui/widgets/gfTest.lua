require "base/internal/ui/gfHUD/WeaponRack";

gfTest =
{
};
registerWidget("gfTest");


function gfTest:initialize()
	self.weaponRack = WeaponRack:new({
		x = -276,
		y = -184
	});
end

function gfTest:draw()
	self.weaponRack:draw();
end
