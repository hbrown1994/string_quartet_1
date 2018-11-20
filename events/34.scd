	e.add(\34 -> {
		c[1].children[33].value_(0);//Off
	    c[1].children[34].value_(1);//On

		~sub.set(\gate, 0);
        ~contact_mic_1.set(\gate, 0);


		~soft_glitch = Pdef(
	\glitch1,
	Pbind(
		\instrument, \pattern_buf,
		\dur, Pwhite(1, 2),
		\atk, Pexprand(0.1,0.2),
		\rel, Pwhite(0.02, 0.1),
		\buf, Prand(m[\no_input_glitch][(0..12)]++m[\no_input_rhythm][(0..3)]++m[\no_input_noise][(0..12)]++m[\no_input_stable_drone][(0..6)]++m[\no_input_unstable_drone][(0..5)]++m[\no_input_gesture][(0..4)]++m[\no_input_high][(0..3)], inf),
		\rate, Pexprand(0.5, 3.0),
		\spos, Pwhite(0, 10000),
		\amp, Pfunc({~soft_glitch_val}),
		\pan_pos, Pwhite(-1.0, 1.0),
		\low_pass_mix, 1,
		\low_pass_freq, 3000,
		\high_pass_mix, 1,
		\high_pass_freq, 30,
		\out, 0,
		\group, ~patterns,
		);
		).play(TempoClock(1));


	});