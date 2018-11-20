	e.add(\49 -> {
		c[1].children[48].value_(0);//Off
	    c[1].children[49].value_(1);//On

		~glitch_stream = Pdef(
	\glitch1,
	Pbind(
		\instrument, \pattern_buf,
		\dur, Pif(Ptime(inf) < 50.0, Pwhite(Pseg(Pseq([0.005, 0.001], inf), Pseq([50.0, 50.0], inf), \linear), Pseg(Pseq([0.8, 0.002], inf), Pseq([50.0, 50.0], inf), \linear)),  Pwhite(0.001, 0.002)),
		\atk, Pif(Ptime(inf) < 50.0, Pwhite(Pseg(Pseq([0.01, 0.002], inf), Pseq([50.0, 50.0], inf), \linear), Pseg(Pseq([0.01, 0.008], inf), Pseq([50.0, 50.0], inf), \linear)), Pexprand(0.002,0.008)),
		\rel, Pif(Ptime(inf) < 50.0, Pwhite(Pseg(Pseq([0.02, 0.01], inf), Pseq([50.0, 50.0], inf), \linear), Pseg(Pseq([1.5, 0.05], inf), Pseq([50.0, 50.0], inf), \linear)), Pwhite(0.01, 0.05)),
		\buf, Prand(m[\no_input_glitch][(0..12)]++m[\no_input_rhythm][(0..3)]++m[\no_input_noise][(0..5)]++m[\no_input_stable_drone][(0..6)]++m[\no_input_unstable_drone][(0..5)]++m[\no_input_gesture][(0..4)]++m[\no_input_high][(0..3)]++m[\cringle][(0..0)]++m[\shake][(0..3)]++m[\struck][(0..2)]++m[\superball][(0..6)]++m[\scrape][(0..4)]++m[\rod][(0..5)], inf),
				\rate, 	Pif(Ptime(inf) < 50.0, Pwhite(Pseg(Pseq([0.2, 0.5], 1), Pseq([50.0, 50.0], inf), \linear), Pseg(Pseq([1.5, 20.0], inf), Pseq([50.0, 50.0], inf), \linear)), Pwhite(3.0, 20.0)),
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

	 ~viola_ntube = Synth(\ntube_7, [\amp, ~tube_delay_numBox.value, \mix_low, -1.0, \mix_high, -1.0, \input_bus, ~violin_1_fx_send, \atk, 5, \dec, 0.1, \sus, 1, \rel, 0.1, \gate, 1, \out, ~violin_1_out], target: ~fx).register;

	 ~cello_ntube = Synth(\ntube_5, [\amp, ~tube_delay_numBox.value, \mix_low, -1.0, \mix_high, -1.0, \input_bus, ~violin_1_fx_send, \atk, 10, \dec, 0.1, \sus, 1, \rel, 0.1, \gate, 1, \out, ~violin_1_out], target: ~fx).register; //violin_1

	});