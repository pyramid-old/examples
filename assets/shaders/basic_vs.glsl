#version 150
in vec3 position;
uniform mat4 viewProjection;
uniform mat4 transform;
in vec2 texcoord;
in vec3 normal;

out vec2 Texcoord;
out vec3 Normal;

void main() {
  Texcoord = texcoord;
  Normal = normalize(transform * vec4(normal, 0.0)).xyz;

  gl_Position = viewProjection * transform * vec4(position.xyz, 1.0);
}
