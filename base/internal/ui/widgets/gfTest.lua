require "base/internal/ui/gfHUD/AmmoBox";


gfTest =
{
};
registerWidget("gfTest");


function gfTest:initialize()
	self.aBox = AmmoBox:new(6);
end

function gfTest:draw()
	self.aBox:draw();
end
