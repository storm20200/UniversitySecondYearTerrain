#version 330

uniform mat4 view_world_xform;
uniform mat4 projection_xform;

layout(location=0)
in vec3 vertex_position;

layout(location=1)
in vec3 vertex_normal;

out vec3 varying_position;
out vec3 varying_normal;
out vec3 varying_colour;

void main(void)
{
	varying_normal = mat3(view_world_xform) * vertex_normal;
    varying_colour = vertex_normal * 0.5 + 0.5;
    vec4 view_position = view_world_xform * vec4(vertex_position, 1.0);
    varying_position = view_position.xyz;
    gl_Position = projection_xform * view_position;
}
