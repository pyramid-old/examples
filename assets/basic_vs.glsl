#version 150
in vec3 position;
uniform mat4 transform;
in vec2 texcoord;

out vec2 Texcoord;

void main() {
  Texcoord = texcoord;

  gl_Position = transform * vec4(position.xyz, 1.0);
}
