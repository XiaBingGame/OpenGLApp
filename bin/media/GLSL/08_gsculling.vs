#version 430 core
in vec4 vVertex;
in vec3 vNormal;

out Vertex
{
	vec3 normal;
	vec4 color;
} vertex;

uniform vec3 vLightPosition = vec3(-10.0, 40.0, 200.0);
uniform mat4 mvMatrix;

void main(void)
{
	// Get surface normal in eye coordinates
	vec3 vEyeNormal = mat3(mvMatrix) * normalize(vNormal);
	
	// Get vertex position in eye coordinates
	vec4 vPosition4 = mvMatrix * vVertex;
	vec3 vPosition3 = vPosition4.xyz / vPosition4.w;

	vec3 vLightDir = normalize(vLightPosition - vPosition3);

	vertex.color = vec4(0.7, 0.6, 1.0, 1.0) * abs(dot(vEyeNormal, vLightDir));

	gl_Position = vVertex;
	vertex.normal = vNormal;
}
