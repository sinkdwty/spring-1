uniform sampler2D alphaMaskTex;

uniform vec2 alphaTestCtrl;


in vec2 vTexCoord;
in vec4 vBaseColor;

#if (SUPPORT_DEPTH_LAYOUT == 1)
// preserve early-z performance if possible
layout(depth_unchanged) out float gl_FragDepth;
#endif


void main() {
	if ((texture(alphaMaskTex, vTexCoord).a * vBaseColor.a) <= alphaTestCtrl.x)
		discard;

	gl_FragDepth = gl_FragCoord.z;
}

