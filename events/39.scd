e.add(\39 -> {
	c[1].children[38].value_(0);//Previous Cue Button Off
	c[1].children[39].value_(1);//Current Cue Button On

	~noise_1.set(\gate, 0);
	~viola_ntube.set(\gate, 0);
	~cello_ntube.set(\gate, 0);

	~grit_noise_1.set(\gate, 0);
	~noise_2.set(\gate, 0);

	~sub = Synth(\sub, [\amp, ~sub_numBox.value, \gate, 1, \time, 10, \out_bus, ~sub_out]).register;

	~glitch_stream = Pdef(
		\glitch1,
		Pbind(
			\instrument, \pattern_buf,
			\dur, Pwhite(0.001, 0.01),
			\atk, Pexprand(0.002,0.008),
			\rel, Pwhite(0.02, 0.1),
			\buf, Prand(m[\no_input_glitch][(0..12)]++m[\no_input_noise][(0..12)], inf),
			\rate, Pwhite(-0.2, -5.0),
			\spos, Pwhite(0, 10000),
			\amp, Pfunc({~glitch_stream_val}),
			\pan_pos, Pwhite(-1.0, 1.0),
			\low_pass_mix, 0,
			\low_pass_freq, 16000,
			\high_pass_mix, 1,
			\high_pass_freq, 50,
			\out, 0,
			\group, ~patterns,
		);
	).play(TempoClock(1));

});