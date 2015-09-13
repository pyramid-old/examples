#version 150

out vec4 out_color;
in vec2 Texcoord;
in vec3 Normal;

uniform sampler2D diffuse;
uniform float alpha_threshold;
uniform vec3 light_direction;
uniform vec3 ambient_color;
uniform vec3 diffuse_color;

void main() {
  vec4 diffuse_texture = texture(diffuse, Texcoord);
  if (diffuse_texture.a < alpha_threshold) discard;
  float light = clamp(dot(normalize(light_direction), Normal.xyz), 0, 1);

  vec3 color = vec3(0, 0, 0);
  color += diffuse_color * diffuse_texture.rgb * light;
  color += ambient_color * diffuse_texture.rgb * (1 - light);
  out_color = vec4(color, diffuse_texture.a);
}
