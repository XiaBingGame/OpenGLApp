#include "OpenGLApp.h"

OpenGLApp* OpenGLApp::app = 0;

void mat4copy(mmat4 m, glm::mat4 gm)
{
	memcpy(m, glm::value_ptr(gm), sizeof(float)*16);
}

void vec3copy(mvec3 v, glm::vec3 gv)
{
	memcpy(v, glm::value_ptr(gv), sizeof(float)*3);
}

void vec4copy(mvec4 v, glm::vec4 gv)
{
	memcpy(v, glm::value_ptr(gv), sizeof(float)*4);
}