uniform float opacity;
uniform sampler2D tex;




// Generate white noise
float random2d(vec2 coord){
	return fract(sin(dot(coord.xy, vec2(12.9898, 78.233))) * 43758.5453);
}



void main() {
	vec2 coord = gl_TexCoord[0].xy;

	vec4 pixel = texture2D(tex, coord);
	pixel *= opacity;

	if(pixel.a != 1.0 && pixel.a != 0.0) {
		float grain = random2d(vec2(sin(coord)));
		vec3 color = vec3(pixel.r, pixel.g, pixel.b);

		// luminosity
                color = mix(color, vec3(0), 0.5);

		// noise
		color = mix(color, vec3(grain), 0.5);
		
		// blend original with new
		color = mix(vec3(pixel.r, pixel.g, pixel.b), color, 0.03);
	
			
		gl_FragColor = vec4(color, pixel.a);
	} else {
		gl_FragColor = pixel;
	}
}
