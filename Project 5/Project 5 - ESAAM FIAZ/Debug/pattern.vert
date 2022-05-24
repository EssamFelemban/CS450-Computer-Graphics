#version 330 compatibility

uniform float	uTime;		// "Time", from Animate( )
uniform float uS0, uT0;
uniform float uDs, uDt;
out vec2  	vST;		// texture coords


const float PI = 	3.14159265;
const float AMP = 	0.2;		// amplitude
const float W = 	2.;		// frequency

void
main( )
{ 
	vST = gl_MultiTexCoord0.st;
	vec3 vert = gl_Vertex.xyz;
	if (uDs == 1.0)
	{
		vert.x = vert.x * 1-cos(PI*vert.z *uTime);
		vert.y = vert.y * 1-sin(PI*vert.z*uTime );
		vert.z = vert.z * 1-sin(PI*vert.x*uTime );
	}
	else 
	{
		vert.x = vert.x;
		vert.y = vert.y;
		vert.z = vert.z;
	}

	gl_Position = gl_ModelViewProjectionMatrix * vec4( vert, 1. );
}
