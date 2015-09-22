#version 150
in vec3 position;
uniform mat4 transform;
uniform mat4 viewProjection;
in vec2 texcoord;

out vec2 Texcoord;
uniform sampler2D heightmap;
out vec3 Normal;

void main() {
  Texcoord = texcoord;
  float height = texture(heightmap, Texcoord).r;
  float height_x = texture(heightmap, Texcoord + vec2(0.001, 0.0)).r;
  float height_y = texture(heightmap, Texcoord + vec2(0.0, 0.001)).r;
  float e_2 = 0.1;
  Normal = normalize(cross(vec3(e_2, 0, height_x - height), vec3(0, e_2, height_y - height)));

  gl_Position = viewProjection * transform * vec4(position.x, position.y, height, 1.0);
}
