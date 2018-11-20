
e.add(\7 -> {

    c[1].children[6].value_(0);//Previous Cue Button Off
	c[1].children[7].value_(1);//Current Cue Button On


	~glitch_stream = Pdef(
	\glitch1,
	Pbind(
		\instrument, \pattern_buf,
		\dur, Pif(Ptime(inf) < 50.0, Pwhite(Pseg(Pseq([2.0, 0.01], inf), Pseq([50.0, 50.0], inf), \linear), Pseg(Pseq([3.0, 0.2], inf), Pseq([50.0, 50.0], inf), \linear)), Pexprand(0.01, 0.2),inf),
		\atk, Pexprand(0.02,0.08),
		\rel, Pif(Ptime(inf) < 50.0, Pwhite(Pseg(Pseq([0.05, 0.5], inf), Pseq([50.0, 50.0], inf), \linear), Pseg(Pseq([0.2, 3], inf), Pseq([50.0, 50.0], inf), \linear)), Pexprand(0.5, 3),inf),

		\buf, Prand(m[\no_input_glitch][(0..12)]++m[\no_input_rhythm][(0..3)]++m[\no_input_noise][(0..12)], inf),
		\rate, Pexprand(0.2, 3.0),
		\spos, Pwhite(0, 10000),
		\amp, Pfunc({~glitch_stream_val}),
		\pan_pos, Pwhite(-1.0, 1.0),
		\low_pass_mix, 1,
		\low_pass_freq, Pif(Ptime(inf) < 50.0, Pwhite(Pseg(Pseq([3000, 15000], inf), Pseq([50.0, 50.0], inf), \linear), Pseg(Pseq([4000, 15000], inf), Pseq([50.0, 50.0], inf), \linear)), 15000 ,inf),
		\high_pass_mix, 1,
		\high_pass_freq, 30,
		\out, 0,
		\group, ~patterns,
		);
		).play(TempoClock(1));
});