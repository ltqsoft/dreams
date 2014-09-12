module gl.common;

import cstr;
import gl.common;
import gl.core;
import log;
import matrix;
import std.math;
import vector;

void printOpenGLInfo()
{
	info("OpenGL vendor: %s", cstr2dstr(cast(const(char)*) glGetString(GL_VENDOR)));
	info("OpenGL renderer: %s", cstr2dstr(cast(const(char)*) glGetString(GL_RENDERER)));
	info("OpenGL version: %s", cstr2dstr(cast(const(char)*) glGetString(GL_VERSION)));
	info("OpenGL shading language version: %s", cstr2dstr(cast(const(char)*) glGetString(GL_SHADING_LANGUAGE_VERSION)));
}

void checkOpenGLError()
{
	GLenum errorCode = glGetError();
	if(errorCode != GL_NO_ERROR)
	{
		string errorString;
		switch(errorCode)
		{
		case GL_INVALID_ENUM:
			errorString = "invalid enum";
			break;
		case GL_INVALID_VALUE:
			errorString = "invalid value";
			break;
		case GL_INVALID_OPERATION:
			errorString = "invalid operation";
			break;
		case GL_STACK_UNDERFLOW:
			errorString = "stack underflow";
			break;
		case GL_STACK_OVERFLOW:
			errorString = "stack overflow";
			break;
		case GL_OUT_OF_MEMORY:
			errorString = "out of memory";
			break;
		/*case GL_INVALID_FRAMEBUFFER_OPERATION:
			errorString = "invalid framebuffer operation";
			break;*/
		default:
			errorString = "unknow";
		}
		fatal("OpenGL error: %s", errorString);
	}
}
