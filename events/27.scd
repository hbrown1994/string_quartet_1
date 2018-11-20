e.add(\27 -> {

		c[1].children[26].value_(0);//Previous Cue Button Off
	    c[1].children[27].value_(1);//Current Cue Button On


		~sub = Synth(\sub, [\amp,  ~sub_numBox.value, \gate, 1, \out_bus, ~sub_out]).register;

		~low_freq_rumble.stop;

		~metal_sheet_impulses.set(\gate, 0);

		~contact_mic_1.set(\gate, 0);


		~glitch_loops= Pdef(
			\glitch1,
			Pbind(
				\instrument, \pattern_buf,
				\dur, Pwhite(Pif(Ptime(inf) < 10, Pseg(Pseq([0.5, 6], inf), Pseq([10, 10], inf), \linear), 6), Pif(Ptime(inf) < 10, Pseg(Pseq([2, 10], inf), Pseq([10, 10], inf), \linear), 10)),
				\atk, Pwhite(Pif(Ptime(inf) < 10, Pseg(Pseq([0.5, 3], inf), Pseq([10, 10], inf), \linear), 3), Pif(Ptime(inf) < 10, Pseg(Pseq([2, 8], inf), Pseq([10, 10], inf), \linear), 8)),
				\rel, Pwhite(Pif(Ptime(inf) < 10, Pseg(Pseq([20, 10], inf), Pseq([10, 10], inf), \linear), 10), Pif(Ptime(inf) < 10, Pseg(Pseq([25, 40], inf), Pseq([10, 10], inf), \linear), 40)),
				\c1, 8,
				\c2, Pwhite(-4, -8),
				\buf, Pif(Ptime(inf) < 20, Pwrand(m[\no_input_rhythm][(0..3)]++m[\no_input_gesture][(0..2)], [10, 10, 10, 10, 2, 2, 2].normalizeSum, inf), Prand(m[\no_input_stable_drone][(0..6)]++m[\no_input_gesture][(0..4)], inf)),
				\rate, Pwhite(0.1, Pif(Ptime(inf) < 30, Pseg(Pseq([1.0, 0.5], inf), Pseq([30, 30], inf), \linear), 0.5)),
				\spos, Pwhite(0, 10000),
				\amp, Pfunc({~glitch_stream_val}),
				\loop, 1,
				\pan_pos, Prand([-1, 0, 1], inf),
				\low_pass_mix, 1,
				\low_pass_freq, Pif(Ptime(inf) < 30, Pseg(Pseq([12000, 500], inf), Pseq([30, 30], inf), \linear), 500),
				\high_pass_mix, 1,
				\high_pass_freq, 50,
				\out, 0,
				\group, ~patterns,
			);
		).play(TempoClock(1));

	~metal_stream = Pdef(
		\metal1,
		Pbind(
			\instrument, \pattern_buf,
			\dur, Pwhite(0.01, 0.1),
			\atk, Pwhite(0.05, 0.01),
			\rel, Pwhite(2, 4),
			\buf, Prand(m[\cringle][(0..0)]++m[\shake][(0..3)], inf),
			\rate,Pseg(Pseq([3.0, 0.5], 1), Pseq([20, 20], 1), -10),
			\spos, Pwhite(0, 10000),
			\amp, Pseg(Pseq([Pfunc({~metal_stream_val}), 0.1], 1), Pseq([20, 20], 1), -10),
			\loop, 1,
			\pan_pos, Pwhite(-1.0, 1.0),
			\low_pass_mix, 1,
			\low_pass_freq, Pseg(Pseq([13000, 8000], 1), Pseq([20, 20], 1), -10),
			\high_pass_mix, 1,
			\high_pass_freq, 30,
			\out, 0,
			\group, ~patterns,
		);
	).play(TempoClock(1));

	~metal_stream_2 = Pdef(
		\metal2,
		Pbind(
			\instrument, \pattern_buf,
			\dur, Pwhite(1, 4),
			\atk, Pwhite(0.1, 5),
			\rel, Pwhite(6, 10),
			\buf, Prand(m[\cringle][(0..0)]++m[\shake][(0..3)]++m[\scrape][(0..4)]++m[\bowed][(0..3)], inf),
			\rate,  Prand([Pexprand(-0.1, -0.5), Pwhite(0.1, 0.5)], inf),
			\stretch,  1,
			\spos, Pwhite(0, 3000),
			\amp, Pfunc({~metal_stream_val}),
			\loop, 1,
			\pan_pos, Pwhite(-1.0, 1.0),
			\low_pass_mix, 1,
			\low_pass_freq, 8000,
			\high_pass_mix, 1,
			\high_pass_freq, 100,
			\out, 0,
			\group, ~patterns,
		);
	).play(TempoClock(1));
});