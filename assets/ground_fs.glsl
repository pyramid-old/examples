#version 150
out vec4 out_color;
in vec2 Texcoord;
uniform sampler2D splat1;
uniform sampler2D diffuse1;
uniform sampler2D diffuse2;
uniform sampler2D diffuse3;
uniform sampler2D diffuse4;
uniform sampler2D diffuse5;
void main() {
   vec4 s1 = texture(splat1, Texcoord);
   out_color = vec4(mix(mix(mix(mix(
     texture(diffuse1, Texcoord*40),
     texture(diffuse2, Texcoord*40),
     s1.r),
     texture(diffuse3, Texcoord*40),
     s1.g),
     texture(diffuse4, Texcoord*40),
     s1.b),
     texture(diffuse5, Texcoord*40),
     s1.a).rgb, 1.0);

}
