	e.add(\30 -> {
		c[1].children[29].value_(0);//Off
	    c[1].children[30].value_(1);//On

		~contact_mic_1 = Synth(\feedback_1, [\atk, 30 , \rel, 30, \amp, ~contact_mic_1_numBox.value, \input_bus_left, ~contact_mic_1_in,  \input_bus_right, ~contact_mic_2_in, \freq, ~contact_mic_1_freq_numBox.value, \gate, 1, \out_left, ~sheet_1_out, \out_right, ~sheet_2_out], target: ~input).register;

	});