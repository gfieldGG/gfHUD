require "../gfHUD/Rectangle"


gfTest =
{
};
registerWidget("gfTest");


function gfTest:initialize()

end

function gfTest:draw(args)
	local rect = Rectangle:new({
		width = 168,
		height = 64,
		color = Color(255,0,255),
		shadowed = true
	});
	rect:draw();
end
