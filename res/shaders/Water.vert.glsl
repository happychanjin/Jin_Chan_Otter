
#version 410


layout(location = 0) in vec3 inPosition;
layout(location = 1) in vec3 inColor;
layout(location = 2) in vec3 inNormal;
layout(location = 3) in vec2 inUV;


layout(location = 0) out vec3 outPos;
layout(location = 1) out vec3 outColor;
layout(location = 2) out vec3 outNormal;
layout(location = 3) out vec2 outUV;

uniform mat4 u_ModelViewProjection;
uniform mat4 u_View;
uniform mat4 u_Model;
uniform mat3 u_NormalMatrix;
uniform vec3 u_LightPos;

uniform float a_time;

uniform sampler2D myTextureSampler;

void main() {
	// Lecture 5
	// Pass vertex pos in world space to frag shader
	outPos = (u_Model * vec4(inPosition, 1.0)).xyz;

	// Normals
	outNormal = u_NormalMatrix * inNormal;
	//Do heightmap stuff here
	outUV = inUV;
	///////////
	outColor = inColor;
	gl_Position =   u_ModelViewProjection * vec4( inPosition.x, inPosition.y, sin(10*inPosition.x + a_time) * cos(10*inPosition.y-(0.5*a_time))*0.02, 0.80);

}

