#version 150
in vec3 position;
uniform mat4 transform;
in vec2 texcoord;

out vec2 Texcoord;
uniform sampler2D heightmap;

void main() {
  Texcoord = texcoord;

  gl_Position = transform * vec4(position.x, position.y, texture(heightmap, Texcoord).r, 1.0);
}
