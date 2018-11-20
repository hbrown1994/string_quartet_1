	e.add(\50 -> {
		c[1].children[49].value_(0);//Off
	    c[1].children[50].value_(1);//On

 	    ~friction_violin_1.set(\gate, 0);
		~friction_violin_2.set(\gate, 0);
		~viola_ntube.set(\gate, 0);
		~cello_ntube.set(\gate, 0);
		~violin_2_glitch.set(\gate, 0);
		~violin_1_glitch.set(\gate, 0);
		~cello_glitch.set(\gate, 0);
		~viola_glitch.set(\gate, 0);
	    ~ringmod_violin_2.set(\gate, 0);
	    ~ringmod_viola.set(\gate, 0);
		~delay.set(\gate, 0);
		~noise_2.set(\gate, 0);
	    ~noise_1.set(\gate, 0);
	    ~grit_noise_1.set(\gate, 0);

		~glitch_stream = Pdef(
	\glitch1,
	Pbind(
		\instrument, \pattern_buf_4,
		\dur, Pwhite(0.001, 0.0015),
		\atk, Pexprand(0.002,0.004),
		\rel, Pwhite(0.01, 0.2),
		\buf, Prand(m[\no_input_glitch][(0..12)]++m[\no_input_rhythm][(0..3)]++m[\no_input_noise][(0..5)]++m[\no_input_stable_drone][(0..6)]++m[\no_input_unstable_drone][(0..5)]++m[\no_input_gesture][(0..4)]++m[\no_input_high][(0..3)]++m[\cringle][(0..0)]++m[\shake][(0..3)]++m[\struck][(0..2)]++m[\superball][(0..6)]++m[\scrape][(0..4)]++m[\rod][(0..5)], inf),
		\rate, Pwhite(-0.5, -20.0),
		\spos, Pwhite(0, 10000),
		\amp, Pfunc({~glitch_stream_val}),
		\pan_pos_x, Pwhite(-1.0, 1.0),
		\pan_pos_y, Pwhite(-1.0, 1.0),
		\low_pass_mix, 0,
		\low_pass_freq, 16000,
		\high_pass_mix, 1,
		\high_pass_freq, 50,
		\out, 0,
		\group, ~patterns,
		);
		).play(TempoClock(1));

	});