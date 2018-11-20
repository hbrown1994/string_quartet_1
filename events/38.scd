	e.add(\38 -> {
		c[1].children[37].value_(0);//Off
	    c[1].children[38].value_(1);//On

		~cello_glitch.set(\gate, 0);
		~violin_1_glitch.set(\gate, 0);
		~violin_2_glitch.set(\gate, 0);

	~noise_1 = Synth(\playbuf, [\bufnum, b[\no_input_stable_drone][0], \loop, 1, \gate, 1,
	\low_pass_freq, 500, \low_pass_mix, 1, \high_pass_mix, 0, \atk, 0.05 , \rel, 0.005, \amp, ~noise_1_numBox.value], target: ~samples).register;


	~noise_2 = Synth(\playbuf, [\bufnum, b[\no_input_high][1], \loop, 1, \gate, 1,
	\high_pass_freq, 500, \low_pass_mix, 1,\low_pass_freq, 10000, \high_pass_mix, 1, \amp, ~noise_2_numBox.value, \atk, 0.005, \rel, 0.005]).register;

	~contact_mic_1 = Synth(\feedback_1, [\atk, 20 , \rel, 0.1, \amp, ~contact_mic_1_numBox.value, \input_bus_left, ~contact_mic_1_in,  \input_bus_right, ~contact_mic_2_in, \freq, ~contact_mic_1_freq_numBox.value, \gate, 1, \out_left, ~sheet_1_out, \out_right, ~sheet_2_out], target: ~input).register;

		~viola_ntube = Synth(\ntube_5, [\amp, ~tube_delay_numBox.value, \mix_low, -1.0, \mix_high, -1.0, \input_bus, ~viola_fx_send, \atk, 10, \dec, 0.1, \sus, 1, \rel, 0.1, \gate, 1, \out, ~viola_out], target: ~fx).register;

		~cello_ntube = Synth(\ntube_7, [\amp, ~tube_delay_numBox.value, \mix_low, -1.0, \mix_high, -1.0, \input_bus, ~cello_fx_send, \atk, 30, \dec, 0.1, \sus, 1, \rel, 0.1, \gate, 1, \out, ~cello_out], target: ~fx).register;

	});