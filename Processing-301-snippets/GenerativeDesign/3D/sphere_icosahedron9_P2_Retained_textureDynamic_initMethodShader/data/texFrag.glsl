#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

uniform sampler2D visiteRuinart;

varying vec4 vertColor;
varying vec4 vertTexCoord;

void main()
{
	
	gl_FragColor = texture2D(visiteRuinart, vertTexCoord.st);//*vertColor;
}