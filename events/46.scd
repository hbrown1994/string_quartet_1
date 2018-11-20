e.add(\46 -> {

		c[1].children[45].value_(0);//Previous Cue Button Off
	    c[1].children[46].value_(1);//Current Cue Button On


		~glitch_stream = Pdef(
	\glitch1,
	Pbind(
		\instrument, \pattern_buf,
		\dur, Pexprand(0.01, 2),
		\atk, Pexprand(0.005,0.01),
		\rel, Pwhite(0.02, 0.2),
		\buf, Prand(m[\no_input_glitch][(0..12)]++m[\no_input_rhythm][(0..3)]++m[\no_input_noise][(0..5)]++m[\no_input_stable_drone][(0..6)]++m[\no_input_unstable_drone][(0..5)]++m[\no_input_gesture][(0..4)]++m[\no_input_high][(0..3)]++m[\cringle][(0..0)]++m[\shake][(0..3)]++m[\struck][(0..2)]++m[\superball][(0..6)]++m[\scrape][(0..4)]++m[\rod][(0..5)], inf),

		\rate, Pexprand(0.2, 6.0),
		\spos, Pwhite(0, 10000),
		\amp, Pfunc({~glitch_stream_val}),
		\pan_pos, Pwhite(-1.0, 1.0),
		\low_pass_mix, 0,
		\low_pass_freq, 17000,
		\high_pass_mix, 1,
		\high_pass_freq, 30,
		\out, 0,
		\group, ~patterns,
		);
		).play(TempoClock(1));

	 Routine({
		~noise_2 = Synth(\playbuf, [\bufnum, b[\no_input_high][4], \loop, 1, \gate, 1,
	\high_pass_freq, 500, \low_pass_mix, 0, \high_pass_mix, 1, \amp, ~noise_2_numBox.value, \atk, 100, \rel, 0.1, \curve, (-6)]).register;

		~noise_1 = Synth(\playbuf, [\bufnum, b[\no_input_stable_drone][2], \loop, 1, \gate, 1,
	\low_pass_freq, 300, \low_pass_mix, 1, \high_pass_mix, 0, \atk, 100 , \rel, 0.1, \amp, ~noise_1_numBox.value, \curve, (-6)], target: ~samples).register;

		~grit_noise_1 = Synth(\playbuf, [\bufnum, b[\no_input_gesture][2], \loop, 1, \gate, 1,
	\high_pass_freq, 100, \low_pass_mix, 0, \high_pass_mix, 1, \atk, 100, \rel, 0.1, \amp, ~noise_2_numBox.value, \curve, (-6)], target: ~samples).register;


		19.wait;

		~metal_sheet_impulses = Synth(\metal_sheet_impulses_line, [\amp, ~metal_sheet_impulses_1_numBox.value, \atk, 0.5, \dec, 0.1, \sus, 1,  \rel,0.1, \curve, (-6),  \gate, 1,\line_start, 0.01, \line_end, 30, \line_dur, 120, \out_left, ~sheet_1_out, \out_right, ~sheet_2_out], target: ~sheets).register;

		~delay = Synth(\delay,[\amp, ~delay_numBox.value, \input_bus, ~violin_1_fx_send, \atk, 30, \dec, 0.1, \sus, 1, \rel, 0.1, \gate, 1, \out, ~violin_1_out, \curve, (-10)], target: ~fx).register;


		}).play(AppClock);

});