#version 450
#extension GL_ARB_separate_shader_objects : enable

layout(set = 0, binding = 0) uniform CameraBufferObject {
    mat4 view;
    mat4 proj;
} camera;

// TODO: Declare fragment shader inputs
//layout(location = 0) in vec2 fragUV;
layout(location = 0) in vec3 fragNormal;

layout(location = 0) out vec4 outColor;

void main() {
    vec3 lightDir = normalize(vec3(0.0, 1.0, 0.5));
    vec3 normal = normalize(fragNormal);
    
    float diffuse = max(dot(normal, lightDir), 0.0);
    
    vec3 grassColor = vec3(0.2, 0.6, 0.2);
    vec3 finalColor = (0.3 + 0.7 * diffuse) * grassColor;
    
    outColor = vec4(finalColor, 1.0);
}
