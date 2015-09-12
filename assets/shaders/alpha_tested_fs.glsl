#version 150

out vec4 out_color;
in vec2 Texcoord;

uniform sampler2D diffuse;
uniform float alpha_threshold;

void main() {
  vec4 col = texture(diffuse, Texcoord);
  if (col.a < alpha_threshold) discard;
  out_color = col;
}
