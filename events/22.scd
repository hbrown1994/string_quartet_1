	e.add(\22 -> {
		c[1].children[21].value_(0);//Off
	    c[1].children[22].value_(1);//On
		/*dsp here*/
		//update ~glitch_loops
		//viola

		~cello_glitch.set(\gate, 0);

		~viola_glitch = Synth(\grain_delay, [\amp, ~viola_glitch_numBox.value, \in_bus, ~viola_fx_send, \grain_trig_low, 1, \grain_trig_high, 10, \grain_dev, 1, \grain_size_low, 0.01, \grain_size_high, 0.05, \trig_fft_low, 5, \trig_fft_high, 20, \fft_dev, 1, \trig_freeze_low, 2, \trig_freeze_high, 20, \freeze_dev, 1, \trig_freq_low, 5, \trig_freq_high, 50, \atk, 0.05, \dec, 0.1, \sus, 1, \rel, 0.05, \gate, 1, \out, ~viola_out], target: ~fx).register;

		~glitch_loops= Pdef(
			\glitch1,
			Pbind(
				\instrument, \pattern_buf,
				\dur, Pwhite(6, 10),
				\atk, Pwhite(2, 10),
				\rel, Pwhite(6, 10),
				\c1, Pwhite(1, 6),
				\c2, Pwhite(-1, -6),
				\buf, Pwrand(m[\no_input_rhythm][(0..3)]++m[\no_input_gesture][(0..2)], [10, 10, 10, 10, 2, 2, 2].normalizeSum, inf),
				\rate, Prand([Pwhite(-0.5, -4.0), Pwhite(0.5, 4.0)], inf),
				\spos, Pwhite(0, 20000),
				\amp, Pfunc({~glitch_stream_val}),
				\pan_pos, Pwhite(-1.0, 1.0),
				\low_pass_mix, 1,
				\low_pass_freq, 3000,
				\high_pass_mix, 1,
				\high_pass_freq, 100,
				\out, 0,
				\group, ~patterns,
			);
		).play(TempoClock(1));

	});