#version 100
precision mediump float;

// Input vertex attributes (from vertex shader)
varying vec2 fragTexCoord;
varying vec4 fragColor;

// Input uniform values
uniform sampler2D texture0;
uniform vec4 colDiffuse;

uniform vec2 resolution;
uniform vec2 velocity;

void main()
{
    // vec2 resolution = vec2(400.0, 400.0);
    vec2 st = (gl_FragCoord.xy / resolution) - 0.5;

    float l = length(velocity);
    float transition_smoothing = smoothstep(1.0, 250.0, l);

    vec2 velocity = normalize(velocity);

    vec2 direction = normalize(st);
    float c = dot(velocity, direction);
 
    float radius = length(st);
    radius = radius + smoothstep(0.0, 12.0, abs(c)) * 0.4 * transition_smoothing;
    
    // Fade in a ring
    float outer_radius = 0.030;
    float inner_radius = 0.029;
    float fade_radius = smoothstep(outer_radius, inner_radius, radius);

    gl_FragColor = colDiffuse * fade_radius;
}
