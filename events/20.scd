e.add(\20 -> {
		c[1].children[19].value_(0);//Previous Cue Button Off
	    c[1].children[20].value_(1);//Current Cue Button On

		Routine({

		    ~viola_ntube.set(\gate, 0);
		    ~cello_ntube.set(\gate, 0);
		    ~friction_violin_1.set(\lpf_freq, 18000, \noise_speed, 2000, \fft_mix, -0.4);
            ~friction_violin_2.set(\lpf_freq, 7000, \noise_speed, 100, \fft_mix, -1.0);
		    ~glitch_loops= Pdef(
			\glitch1,
			Pbind(
				\instrument, \pattern_buf,
				\dur, Pwhite(8, 10),
				\atk, Pwhite(5, 10),
				\rel, Pwhite(5, 8),
				\c1, Pwhite(1, 8),
				\c2, Pwhite(-1, -8),
				\buf, Pwrand(m[\no_input_rhythm][(0..3)]++m[\no_input_gesture][(0..2)], [10, 10, 10, 10, 2, 2, 2].normalizeSum, inf),
				\rate, Prand([Pwhite(-0.5, -2.0), Pwhite(0.5, 2.0)], inf),
				\spos, Pwhite(0, 20000),
				\amp, Pfunc({~glitch_stream_val}),
				\pan_pos, Pwhite(-1.0, 1.0),
				\low_pass_mix, 1,
				\low_pass_freq, 1000,
				\high_pass_mix, 1,
				\high_pass_freq, 100,
				\out, 0,
				\group, ~patterns,
			);
		    ).play(TempoClock(1));

			s.sync;

		    ~viola_glitch = Synth(\grain_delay, [\amp, ~viola_glitch_numBox.value, \in_bus, ~viola_fx_send, \grain_trig_low, 1, \grain_trig_high, 10, \grain_dev, 1, \grain_size_low, 0.01, \grain_size_high, 0.05, \trig_fft_low, 5, \trig_fft_high, 20, \fft_dev, 1, \trig_freeze_low, 2, \trig_freeze_high, 20, \freeze_dev, 1, \trig_freq_low, 5, \trig_freq_high, 50, \atk, 3, \dec, 0.1, \sus, 1, \rel, 10, \gate, 1, \out, ~viola_out], target: ~fx).register;

		    ~cello_ntube_1 = Synth(\ntube_7, [\amp, ~tube_delay_numBox.value, \mix_low, -1.0, \mix_high, -1.0, \input_bus, ~cello_fx_send, \atk, 10, \dec, 0.1, \sus, 1, \rel, 10, \gate, 1, \out, ~cello_out], target: ~fx).register;


			8.wait;


		    ~viola_glitch.set(\gate, 0);

			~viola_ntube_1 = Synth(\ntube_4, [\amp, ~tube_delay_numBox.value, \mix_low, -0.5, \mix_high, -1.0, \input_bus, ~viola_fx_send, \atk, 0.1, \dec, 0.1, \sus, 1, \rel, 10, \gate, 1, \out, ~viola_out], target: ~fx).register;

		}).play(AppClock)

});