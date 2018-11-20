e.add(\25 -> {
		c[1].children[24].value_(0);//Previous Cue Button Off
	    c[1].children[25].value_(1);//Current Cue Button On

		Routine({

		    ~friction_violin_1.set(\gate, 0);
		    ~friction_violin_2.set(\gate, 0);
		    ~viola_ntube.set(\gate, 0);
		    ~cello_ntube.set(\gate, 0);

			~glitch_loops= Pdef(
			\glitch1,
			Pbind(
				\instrument, \pattern_buf,
				\dur, Pwhite(3, 8),
				\atk, Pwhite(0.5, 6),
				\rel, Pwhite(10, 16),
				\c1, Pwhite(1, 3),
				\c2, Pwhite(-1, -3),
				\buf, Pwrand(m[\no_input_rhythm][(0..3)]++m[\no_input_gesture][(0..2)], [10, 10, 10, 10, 2, 2, 2].normalizeSum, inf),
				\rate, Prand([Pwhite(-0.2, -6.0), Pwhite(0.2, 6.0)], inf),
				\spos, Pwhite(0, 20000),
				\amp, Pfunc({~glitch_stream_val}),
				\pan_pos, Pwhite(-1.0, 1.0),
				\low_pass_mix, 1,
				\low_pass_freq, 6000,
				\high_pass_mix, 1,
				\high_pass_freq, 100,
				\out, 0,
				\group, ~patterns,
			);
		).play(TempoClock(1));

		    s.sync;


		    ~violin_1_glitch.set(\gate, 0);

		    ~viola_glitch = Synth(\grain_delay, [\amp, ~viola_glitch_numBox.value, \in_bus, ~viola_fx_send, \grain_trig_low, 1, \grain_trig_high, 10, \grain_dev, 1, \grain_size_low, 0.01, \grain_size_high, 0.05, \trig_fft_low, 5, \trig_fft_high, 20, \fft_dev, 1, \trig_freeze_low, 2, \trig_freeze_high, 20, \freeze_dev, 1, \trig_freq_low, 5, \trig_freq_high, 50, \atk, 0.05, \dec, 0.1, \sus, 1, \rel, 5, \gate, 1, \out, ~viola_out], target: ~fx).register;

		    ~contact_mic_1 = Synth(\feedback_1, [\atk, 8 , \rel, 30, \amp, ~contact_mic_1_numBox.value, \input_bus_left, ~contact_mic_1_in,  \input_bus_right, ~contact_mic_2_in, \freq, ~contact_mic_1_freq_numBox.value, \gate, 1, \out_left, ~sheet_1_out, \out_right, ~sheet_2_out], target: ~input).register;

		    ~friction_violin_1 = Synth(\friction_fft_1_line, [\amp, ~friction_numBox.value, \lpf_freq, 18000, \noise_speed, 200, \line_start, (-1), \line_end, 1, \line_dur, 20, \input_bus, ~violin_1_fx_send, \fx_out, ~fft_fx_out_1, \atk, 0.05, \dec, 0.1, \sus, 1, \rel, 0.05, \gate, 1, \out, ~violin_1_out], target: ~fx).register;

		    ~friction_violin_2 = Synth(\friction_fft_1_line, [\amp, ~friction_numBox.value, \lpf_freq, 18000, \noise_speed, 100, \line_start, (-1), \line_end, 1, \line_dur, 20, \input_bus, ~violin_2_fx_send, \fx_out, ~fft_fx_out_1, \atk, 0.05, \dec, 0.1, \sus, 1, \rel, 0.05, \gate, 1, \out, ~violin_2_out], target: ~fx).register;

			s.sync;

		    ~viola_ntube_1 = Synth(\ntube_fft_1_line, [\amp, ~tube_delay_numBox.value, \mix_low, 1.0, \mix_high, -1.0, \input_bus, ~viola_fx_send, \atk, 10, \dec, 0.1, \sus, 1, \rel, 0.05, \gate, 1, \line_start, (-1), \line_end, 1, \line_dur, 20, \fx_out, ~fft_fx_out_3, \out, ~viola_out], target: ~fx).register;

		    ~cello_ntube_1 = Synth(\ntube_fft_1_line, [\amp, ~tube_delay_numBox.value, \mix_low, 1.0, \mix_high, -1.0, \input_bus, ~cello_fx_send, \atk, 10, \dec, 0.1, \sus, 1, \rel, 0.05, \gate, 1, \line_start, (-1), \line_end, 1, \line_dur, 20, \fx_out, ~fft_fx_out_4, \out, ~cello_out], target: ~fx).register;

		}).play(AppClock);
});