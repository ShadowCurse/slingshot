#version 330

// Input vertex attributes (from vertex shader)
in vec2 frag_tex_coord;
in vec4 frag_color;

// Input uniform values
uniform sampler2D texture_0;
uniform vec4 diffuse;

// Output fragment color
out vec4 final_color;

// NOTE: Add here your custom variables

void main()
{
    // Texel color fetching from texture sampler
    vec4 texel_color = texture(texture_0, frag_tex_coord);

    // NOTE: Implement here your fragment shader code

    final_color = texel_color * diffuse;
}
