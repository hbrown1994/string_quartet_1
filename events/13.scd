	e.add(\13 -> {

	c[1].children[12].value_(0);//Off
	c[1].children[13].value_(1);//On


	~low_freq_rumble = Pdef(
	\metal2,
	Pbind(
		\instrument, \pattern_buf_rumble,
		\dur, Pwhite(1, 2),
		\atk, Pwhite(5, 3),
		\rel, Pwhite(10, 20),
		\buf, Prand(m[\superball][(0..6)], inf),
		\rate,  Prand([Pexprand(-0.05, -0.4), Pwhite(0.05, 0.4)], inf),
		\stretch,  1,
		\spos, Pwhite(0, 3000),
		\amp, Pfunc({~low_freq_val}),
		\loop, 1,
		\pan_pos, Pwhite(-1.0, 1.0),
		\low_pass_mix, 1,
		\low_pass_freq, 250,
		\high_pass_mix, 0,
		\high_pass_freq, 10,
		\out, 0,
		\out_sub, 6,
		\group, ~patterns,
		);
		).play(TempoClock(1));



});