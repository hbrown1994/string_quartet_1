e.add(\33 -> {

		c[1].children[32].value_(0);//Previous Cue Button Off
	    c[1].children[33].value_(1);//Current Cue Button On

		~reverb.set(\gate, 0);
		~reverb_violin_1.set(\gate, 0);
		~reverb_violin_2.set(\gate, 0);
		~reverb_viola.set(\gate, 0);

		~friction_violin_1.set(\gate, 0);
		~friction_violin_2.set(\gate, 0);
		~viola_ntube_1.set(\gate, 0);
		~cello_ntube_1.set(\gate, 0);

	    ~metal_stream_2 = Pdef(
		\metal2,
		Pbind(
			\instrument, \pattern_buf,
			\dur, Pwhite(Pif(Ptime(inf) < 50, Pseg(Pseq([0.1, 1], inf), Pseq([50, 50], inf), \linear), 1), Pif(Ptime(inf) < 50, Pseg(Pseq([0.5, 2], inf), Pseq([50, 50], inf), \linear), 1)),
			\atk, Pwhite(0.1, 3),
			\rel, Pwhite(6, 10),
			\buf, Prand(m[\cringle][(0..0)]++m[\shake][(0..3)]++m[\scrape][(0..4)]++m[\bowed][(0..3)], inf),
			\rate,  Pwhite(Pif(Ptime(inf) < 50, Pseg(Pseq([2, 0.5], inf), Pseq([50, 50], inf), \linear), 0.5), Pif(Ptime(inf) < 30, Pseg(Pseq([1, 0.1], inf), Pseq([50, 50], 1), \linear), 0.1)),
			\stretch,  1,
			\spos, Pwhite(0, 3000),
			\amp, Pfunc({~metal_stream_val}),
			\loop, 1,
			\pan_pos, Pwhite(-1.0, 1.0),
			\low_pass_mix, 1,
			\low_pass_freq, Pseg(Pseq([13000, 200], 1), Pseq([50, 50], 1), -10),
			\high_pass_mix, 1,
			\high_pass_freq, 50,
			\out, 0,
			\group, ~patterns,
		);
	).play(TempoClock(1));

	~metal_stream.stop;
	~glitch_loops.stop;
});