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

	self.icon = Icon:new({
		width = 48,
		color = Color(224, 50, 52),
		svgPath = "internal/ui/icons/weapon6",
		shadowed = true
	});

	self.text = Text:new({

	})
end

function gfTest:draw(args)
	self.rect:draw();
	self.icon:draw();
end
