#version 150
in vec3 position;
uniform mat4 trans;
in vec2 texcoord;

out vec2 Texcoord;

void main() {
  Texcoord = texcoord;
  gl_Position = trans * vec4(position, 1.0);
}
