require "base/internal/ui/gfHUD/imports";
if GF_IMPORTED.Shadowable then return; end

require "base/internal/ui/gfHUD/ShadowableFactory";


Shadowable = ShadowableFactory(GF_SHADOWS);
