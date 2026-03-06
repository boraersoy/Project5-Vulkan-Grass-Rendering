#version 450
#extension GL_ARB_separate_shader_objects : enable

layout(quads, equal_spacing, ccw) in;

layout(set = 0, binding = 0) uniform CameraBufferObject {
    mat4 view;
    mat4 proj;
} camera;

// TODO: Declare tessellation evaluation shader inputs and outputs
layout(location = 0) in vec4 inV0[];
layout(location = 1) in vec4 inV1[];
layout(location = 2) in vec4 inV2[];
layout(location = 3) in vec4 inUp[];

//layout(location = 0) out vec2 out_uv;
layout(location = 0) out vec3 fragNormal;

void main() {
    float u = gl_TessCoord.x;
    float v = gl_TessCoord.y;

   // vec2 out_uv = vec2(u, v);

    vec3 v0 = inV0[0].xyz;
    vec3 v1 = inV1[0].xyz;
    vec3 v2 = inV2[0].xyz;

    float direction = inV0[0].w;
    float width = inV2[0].w;

    vec3 a = mix(v0, v1, v);
    vec3 b = mix(v1, v2, v);
    vec3 c = mix(a, b, v);

    vec3 t1 = normalize(vec3(-cos(direction), 0.f, sin(direction)));
    vec3 c0 = c - width * t1;
    vec3 c1 = c + width * t1;
    vec3 t0 = normalize(b - a);
    vec3 n = normalize(cross(t0, t1));
    float t = u + 0.5f * v - u * v;
    vec4 pos = vec4(mix(c0, c1, t), 1.f);
    gl_Position = camera.proj * camera.view * pos;

    fragNormal = n;

}
