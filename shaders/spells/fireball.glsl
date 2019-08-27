extern number time;

vec4 effect( vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords ){
	float yellow = sin(time);

	float red = cos(time / 2);

	return vec4(yellow + red, red, 0.2, 1.0);
}
