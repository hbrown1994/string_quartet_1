e.add(\31 -> {
		c[1].children[30].value_(0);//Previous Cue Button Off
	    c[1].children[31].value_(1);//Current Cue Button On

		~contact_mic_1.set(\gate, 0);

	    ~metal_stream_2 = Pdef(
		\metal2,
		Pbind(
			\instrument, \pattern_buf,
			\dur, Pwhite(0.5, 3),
			\atk, Pwhite(0.1, 3),
			\rel, Pwhite(6, 10),
			\buf, Prand(m[\cringle][(0..0)]++m[\shake][(0..3)]++m[\scrape][(0..4)]++m[\bowed][(0..3)], inf),
			\rate,  Prand([Pexprand(-0.1, -0.6), Pwhite(0.1, 0.6)], inf),
			\stretch,  1,
			\spos, Pwhite(0, 3000),
			\amp, Pfunc({~metal_stream_val}),
			\loop, 1,
			\pan_pos, Pwhite(-1.0, 1.0),
			\low_pass_mix, 1,
			\low_pass_freq, 12000,
			\high_pass_mix, 1,
			\high_pass_freq, 50,
			\out, 0,
			\group, ~patterns,
		);
	).play(TempoClock(1));

});