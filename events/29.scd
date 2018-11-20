	e.add(\29 -> {
		c[1].children[28].value_(0);//Off
	    c[1].children[29].value_(1);//On

		~contact_mic_1.set(\gate, 0);

		~metal_stream_2 = Pdef(
	\metal2,
	Pbind(
		\instrument, \pattern_buf,
		\dur, Pwhite(0.5, 3),
		\atk, Pwhite(0.1, 3),
		\rel, Pwhite(6, 10),
		\buf, Prand(m[\cringle][(0..0)]++m[\shake][(0..3)]++m[\scrape][(0..4)]++m[\bowed][(0..3)], inf),
		\rate,  Prand([Pexprand(-0.1, -0.3), Pwhite(0.1, 0.3)], inf),
		\stretch,  1,
		\spos, Pwhite(0, 3000),
		\amp, Pfunc({~metal_stream_val}),
		\loop, 1,
		\pan_pos, Pwhite(-1.0, 1.0),
		\low_pass_mix, 1,
		\low_pass_freq, 10000,
		\high_pass_mix, 1,
		\high_pass_freq, 100,
		\out, 0,
		\group, ~patterns,
		);
		).play(TempoClock(1));

	});