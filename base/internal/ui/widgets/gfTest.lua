require "../gfHUD/Rectangle";
require "../gfHUD/Icon";


gfTest =
{
};
registerWidget("gfTest");


function gfTest:initialize()
	self.rect = Rectangle:new({
		width = 168,
		height = 64,
		color = Color(224, 50, 52),
		shadowed = true
	});
end

function gfTest:draw(args)
	self.rect:draw();

	local icon = Icon:new({
		width = 48,
		color = Color(224, 50, 52),
		svgPath = "internal/ui/icons/weapon6",
		shadowed = true
	})
	icon:draw();
end
