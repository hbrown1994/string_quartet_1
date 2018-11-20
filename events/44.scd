	e.add(\44 -> {
		c[1].children[43].value_(0);//Off
	    c[1].children[44].value_(1);//On

		~viola_ntube.set(\gate, 0);

		~sub = Synth(\sub, [\amp, ~sub_numBox.value, \gate, 1, \time, 15, \out_bus, ~sub_out, \rel, 0.1]).register;

	   ~violin_2_glitch = Synth(\grain_delay, [\amp, ~violin_2_glitch_numBox.value, \in_bus, ~violin_2_fx_send, \grain_trig_low, 1, \grain_trig_high, 10, \grain_dev, 1, \grain_size_low, 0.01, \grain_size_high, 0.05, \trig_fft_low, 5, \trig_fft_high, 20, \fft_dev, 1, \trig_freeze_low, 2, \trig_freeze_high, 20, \freeze_dev, 1, \trig_freq_low, 5, \trig_freq_high, 50, \atk, 3, \dec, 0.1, \sus, 1, \rel, 0.1, \gate, 1, \out, ~violin_2_out], target: ~fx).register;

	 ~violin_1_glitch = Synth(\grain_delay, [\amp, ~violin_1_glitch_numBox.value, \in_bus, ~violin_1_fx_send, \grain_trig_low, 1, \grain_trig_high, 10, \grain_dev, 1, \grain_size_low, 0.01, \grain_size_high, 0.05, \trig_fft_low, 5, \trig_fft_high, 20, \fft_dev, 1, \trig_freeze_low, 2, \trig_freeze_high, 20, \freeze_dev, 1, \trig_freq_low, 5, \trig_freq_high, 50, \atk, 8, \dec, 0.1, \sus, 1, \rel, 0.1, \gate, 1, \out, ~violin_1_out], target: ~fx).register;

	 ~cello_glitch = Synth(\grain_delay, [\amp, ~cello_glitch_numBox.value, \in_bus, ~cello_fx_send, \grain_trig_low, 1, \grain_trig_high, 10, \grain_dev, 1, \grain_size_low, 0.01, \grain_size_high, 0.05, \trig_fft_low, 5, \trig_fft_high, 20, \fft_dev, 1, \trig_freeze_low, 2, \trig_freeze_high, 20, \freeze_dev, 1, \trig_freq_low, 5, \trig_freq_high, 50, \atk, 8, \dec, 0.1, \sus, 1, \rel, 0.1, \gate, 1, \out, ~cello_out], target: ~fx).register;

	});