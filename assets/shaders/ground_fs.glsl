#version 150
out vec4 out_color;
in vec2 Texcoord;
uniform sampler2D splat1;
uniform sampler2D splat2;
uniform sampler2D base;
uniform sampler2D diffuse1;
uniform sampler2D diffuse2;
uniform sampler2D diffuse3;
uniform sampler2D diffuse4;
uniform sampler2D diffuse5;
uniform sampler2D diffuse6;
uniform sampler2D diffuse7;
uniform sampler2D diffuse8;
void main() {
   vec4 s1 = texture(splat1, Texcoord);
   vec4 s2 = texture(splat2, Texcoord);
   out_color = vec4(
     (texture(base, Texcoord*40)*(1 - s1.r+s1.g+s1.b+s1.a+s2.r+s2.g+s2.b+s2.a) +
    texture(diffuse1, Texcoord*40)*s1.r +
    texture(diffuse2, Texcoord*40)*s1.g +
    texture(diffuse3, Texcoord*40)*s1.b +
    texture(diffuse4, Texcoord*40)*s1.a +
    texture(diffuse5, Texcoord*40)*s2.r +
    texture(diffuse6, Texcoord*40)*s2.g +
    texture(diffuse7, Texcoord*40)*s2.b +
    texture(diffuse8, Texcoord*40)*s2.a).rgb, 1.0);

}
