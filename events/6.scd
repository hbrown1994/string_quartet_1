e.add(\6 -> {

	c[1].children[5].value_(0);//Previous Cue Button Off
	c[1].children[6].value_(1);//Current Cue Button On

	~contact_mic_1.set(\gate, 0);

	~ringmod_cello = Synth(\ringmod, [\amp, ~ringmod_cello_numBox.value, \out,~cello_out, \in_bus, ~cello_fx_send, \low_pass_mix, 1, \high_pass_mix, 1, \high_pass_freq, 450, \low_pass_freq, 6000, \gate, 1, \buf, b[\no_input_noise][11], \rate_low, 1, \rate_high, 1, \atk, 2, \dec, 0.1, \sus, 1, \rel, 0.005, \mul, 4], target: ~fx).register;


	~ringmod_viola = Synth(\ringmod, [\amp, ~ringmod_viola_numBox.value, \out, ~viola_out, \in_bus, ~viola_fx_send, \low_pass_mix, 1, \high_pass_mix, 1, \high_pass_freq, 100, \low_pass_freq, 4000, \gate, 1, \buf, b[\cringle][0], \rate_low, 0.01, \rate_high, 1.0, \atk, 10, \dec, 0.1, \sus, 1, \rel, 0.005, \mul, 4], target: ~fx).register;


	~violin_2_glitch = Synth(\grain_delay, [\amp, ~violin_2_glitch_numBox.value, \in_bus, ~violin_2_fx_send, \grain_trig_low, 1, \grain_trig_high, 10, \grain_dev, 1, \grain_size_low, 0.01, \grain_size_high, 0.05, \trig_fft_low, 5, \trig_fft_high, 20, \fft_dev, 1, \trig_freeze_low, 2, \trig_freeze_high, 20, \freeze_dev, 1, \trig_freq_low, 5, \trig_freq_high, 50, \atk, 3, \dec, 0.1, \sus, 1, \rel, 0.005, \gate, 1, \out, ~violin_2_out], target: ~fx).register;


	~violin_1_glitch = Synth(\grain_delay, [\amp, ~violin_1_glitch_numBox.value, \in_bus, ~violin_1_fx_send, \grain_trig_low, 1, \grain_trig_high, 10, \grain_dev, 1, \grain_size_low, 0.01, \grain_size_high, 0.05, \trig_fft_low, 5, \trig_fft_high, 20, \fft_dev, 1, \trig_freeze_low, 2, \trig_freeze_high, 20, \freeze_dev, 1, \trig_freq_low, 5, \trig_freq_high, 50, \atk, 8, \dec, 0.1, \sus, 1, \rel, 0.005, \gate, 1, \out, ~violin_1_out], target: ~fx).register;
s

});