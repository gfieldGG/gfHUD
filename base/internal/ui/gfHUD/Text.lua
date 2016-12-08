require "base/internal/ui/gfHUD/Shadowable";

Text = Shadowable:extend({
	font = "robotocondensed-bold",
	fontSize = 48;
	color = Color(255,255,255),
	alignHorizontal = NVG_ALIGN_CENTER,
	alignVertical = NVG_ALIGN_MIDDLE
});

function Text:_draw()
	self.super:_draw();

	nvgBeginPath();
	nvgFontBlur(0);
	nvgFillColor(self.color);
	nvgTextAlign(self.alignHorizontal, self.alignVertical);
	nvgFontFace(self.font);

	-- translate from px to nanovg sizing and offset
	nvgFontSize(self.fontSize*(4/3));
	local yOff = self.fontSize*0.05;

	nvgText(self.absoluteX, self.absoluteY-yOff, self.text);
end

function Text:shadowFunction(shadow)
	nvgBeginPath();
	nvgFontBlur(shadow.blur);
	nvgFillColor(shadow.color);
	nvgTextAlign(self.alignHorizontal, self.alignVertical);
	nvgFontFace(self.font);

	-- translate from px to nanovg sizing and offset
	nvgFontSize(self.fontSize*(4/3));
	local yOff = self.fontSize*0.05;

	nvgText(self.absoluteX+shadow.offsetX, self.absoluteY-yOff+shadow.offsetY, self.text);
end
