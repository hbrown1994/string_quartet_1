	e.add(\48 -> {
		c[1].children[47].value_(0);//Off
	    c[1].children[48].value_(1);//On

		~glitch_stream = Pdef(
	\glitch1,
	Pbind(
		\instrument, \pattern_buf,
		\dur, Pexprand(0.01, 1.5),
		\atk, Pexprand(0.005,0.01),
		\rel, Pwhite(0.02, 1.0),
		\buf, Prand(m[\no_input_glitch][(0..12)]++m[\no_input_rhythm][(0..3)]++m[\no_input_noise][(0..5)]++m[\no_input_stable_drone][(0..6)]++m[\no_input_unstable_drone][(0..5)]++m[\no_input_gesture][(0..4)]++m[\no_input_high][(0..3)]++m[\cringle][(0..0)]++m[\shake][(0..3)]++m[\struck][(0..2)]++m[\superball][(0..6)]++m[\scrape][(0..4)]++m[\rod][(0..5)], inf),

		\rate, Pexprand(0.2, 3.0),
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

		~sub = Synth(\sub, [\amp, ~sub_numBox.value, \gate, 1, \atk, 80, \rel, 0.1, \dec, 0.1, \sus, 1, \out_bus, ~sub_out]).register;

		10.wait;


	 ~cello_glitch = Synth(\grain_delay, [\amp, ~cello_glitch_numBox.value, \in_bus, ~cello_fx_send, \grain_trig_low, 1, \grain_trig_high, 10, \grain_dev, 1, \grain_size_low, 0.01, \grain_size_high, 0.05, \trig_fft_low, 5, \trig_fft_high, 20, \fft_dev, 1, \trig_freeze_low, 2, \trig_freeze_high, 20, \freeze_dev, 1, \trig_freq_low, 5, \trig_freq_high, 50, \atk, 60, \dec, 0.1, \sus, 1, \rel, 30, \gate, 1, \out, ~cello_out], target: ~fx).register;

	 ~viola_glitch = Synth(\grain_delay, [\amp, ~viola_glitch_numBox.value, \in_bus, ~viola_fx_send, \grain_trig_low, 1, \grain_trig_high, 10, \grain_dev, 1, \grain_size_low, 0.01, \grain_size_high, 0.05, \trig_fft_low, 5, \trig_fft_high, 20, \fft_dev, 1, \trig_freeze_low, 2, \trig_freeze_high, 20, \freeze_dev, 1, \trig_freq_low, 5, \trig_freq_high, 50, \atk, 60, \dec, 0.1, \sus, 1, \rel, 30, \gate, 1, \out, ~viola_out], target: ~fx).register;

		}).play(AppClock)

	});