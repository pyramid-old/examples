#version 150
out vec4 out_color;
in vec2 Texcoord;
uniform sampler2D diffuse;
void main() {
   out_color = texture(diffuse, Texcoord);
}
