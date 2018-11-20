e.add(\36 -> {
		c[1].children[35].value_(0);//Previous Cue Button Off
	    c[1].children[36].value_(1);//Current Cue Button On


		~ringmod_viola = Synth(\ringmod, [\amp, ~ringmod_viola_numBox.value, \out, ~viola_out, \in_bus, ~viola_fx_send, \low_pass_mix, 1, \high_pass_mix, 1, \high_pass_freq, 100, \low_pass_freq, 4000, \gate, 1, \buf, b[\cringle][0], \rate_low, 0.01, \rate_high, 1.0, \atk, 10, \dec, 0.1, \sus, 1, \rel, 0.1, \mul, 4], target: ~fx).register;


		~soft_glitch = Pdef(
	\glitch1,
	Pbind(
		\instrument, \pattern_buf,
		\dur, Pexprand(0.05, 2),
		\atk, Pexprand(0.1,0.2),
		\rel, Pwhite(0.02, 0.2),
		\buf, Prand(m[\no_input_glitch][(0..12)]++m[\no_input_rhythm][(0..3)]++m[\no_input_noise][(0..12)]++m[\no_input_stable_drone][(0..6)]++m[\no_input_unstable_drone][(0..5)]++m[\no_input_gesture][(0..4)]++m[\no_input_high][(0..3)], inf),

		\rate, Pexprand(0.2, 6.0),
		\spos, Pwhite(0, 10000),
		\amp, Pfunc({~soft_glitch_val}),
		\pan_pos, Pwhite(-1.0, 1.0),
		\low_pass_mix, 1,
		\low_pass_freq, 5000,
		\high_pass_mix, 1,
		\high_pass_freq, 30,
		\out, 0,
		\group, ~patterns,
		);
		).play(TempoClock(1));
});