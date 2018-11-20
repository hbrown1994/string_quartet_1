	e.add(\1 -> {
	c[1].children[0].value_(0);//Off
	c[1].children[1].value_(1);//On


	~contact_mic_1 = Synth(\feedback_1, [\atk, 17 , \rel, 20, \amp, ~contact_mic_1_numBox.value, \input_bus_left, ~contact_mic_1_in,  \input_bus_right, ~contact_mic_2_in, \freq, ~contact_mic_1_freq_numBox.value, \gate, 1, \out_left, ~sheet_1_out, \out_right, ~sheet_2_out ], target: ~input).register;


	~delay = Synth(\delay,[\amp, ~delay_numBox.value, \input_bus, ~violin_2_fx_send, \atk, 5, \dec, 0.1, \sus, 1, \rel, 15, \gate, 1, \out, ~violin_2_out], target: ~fx).register;


});