varying vec4 v_vColour;
varying vec2 v_vTexcoord;

void main() {
    vec4 color = texture2D(gm_BaseTexture, v_vTexcoord);
    // Inverte as cores
    gl_FragColor = vec4(1.0 - color.rgb, color.a) * v_vColour;
}
