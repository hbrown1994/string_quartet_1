	e.add(\15 -> {

		c[1].children[14].value_(0);//Off
	    c[1].children[15].value_(1);//On

		~contact_mic_1.set(\gate, 0);

		~friction_violin_1 = Synth(\friction_fft_1_rms, [\amp, ~friction_numBox.value, \lpf_freq, 16000, \noise_speed, 1000, \input_bus, ~violin_1_fx_send, \atk, 15, \dec, 0.1, \sus, 1, \rel, 0.05, \gate, 1, \out, ~violin_1_out, \fft_mix, -1.0, \curve, -8], ~fx).register;



		~friction_violin_2 = Synth(\friction_fft_1_rms, [\amp, ~friction_numBox.value, \lpf_freq, 8000, \noise_speed, 5, \input_bus, ~violin_2_fx_send, \atk, 15, \dec, 0.1, \sus, 1, \rel, 0.05, \gate, 1, \out, ~violin_2_out, \fft_mix, -1.0], ~fx).register;

	    ~viola_ntube = Synth(\ntube_2, [\amp, ~tube_delay_numBox.value, \mix_low, -1.0, \mix_high, -1.0, \input_bus, ~viola_fx_send, \atk, 0.1, \dec, 0.1, \sus, 1, \rel, 10, \gate, 1, \out, ~viola_out], target: ~fx).register;

		~cello_ntube = Synth(\ntube_2, [\amp, ~tube_delay_numBox.value, \mix_low, -0.5, \mix_high, -1.0, \input_bus, ~cello_fx_send, \atk, 0.1, \dec, 0.1, \sus, 1, \rel, 10, \gate, 1, \out, ~cello_out], target: ~fx).register;

		~delay.set(\gate, 0);

	});