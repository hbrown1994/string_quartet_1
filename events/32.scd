	e.add(\32 -> {
		c[1].children[31].value_(0);//Off
	    c[1].children[32].value_(1);//On

		~contact_mic_1 = Synth(\feedback_1, [\atk, 30 , \rel, 60, \amp, ~contact_mic_1_numBox.value, \input_bus_left, ~contact_mic_1_in,  \input_bus_right, ~contact_mic_2_in, \freq, ~contact_mic_1_freq_numBox.value, \gate, 1, \out_left, ~sheet_1_out, \out_right, ~sheet_2_out], target: ~input).register;


	~metal_stream_2 = Pdef(
	\metal2,
	Pbind(
		\instrument, \pattern_buf,
		\dur, Pwhite(Pif(Ptime(inf) < 30, Pseg(Pseq([0.5, 0.1], inf), Pseq([30, 30], inf), \linear), 0.1), Pif(Ptime(inf) < 30, Pseg(Pseq([3, 1], inf), Pseq([30, 30], inf), \linear), 1)),
		\atk, Pwhite(0.1, 3),
		\rel, Pwhite(6, 10),
		\buf, Prand(m[\cringle][(0..0)]++m[\shake][(0..3)]++m[\scrape][(0..4)]++m[\bowed][(0..3)], inf),
		\rate,  Pwhite(Pif(Ptime(inf) < 30, Pseg(Pseq([0.1, 1.0], inf), Pseq([30, 30], inf), \linear), 1.0), Pif(Ptime(inf) < 30, Pseg(Pseq([0.6, 2], inf), Pseq([30, 30], inf), \linear), 2)),
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