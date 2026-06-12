attribute vec3 in_Position;
attribute vec4 in_Colour;
attribute vec2 in_TextureCoord;

varying vec4 v_vColour;
varying vec2 v_vTexcoord;

void main() {
    gl_Position = vec4(in_Position.x, in_Position.y, in_Position.z, 1.0);
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}
