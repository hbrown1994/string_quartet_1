e.add(\17 -> {
		c[1].children[16].value_(0);//Previous Cue Button Off
	    c[1].children[17].value_(1);//Current Cue Button On

		Routine({

		    ~viola_ntube.set(\gate, 0);
		    ~cello_ntube.set(\gate, 0);
	        ~friction_violin_2.set(\fft_mix, -1.0, \noise_speed, 10000);

		    s.sync;

		    ~viola_ntube_1 = Synth(\ntube_1, [\amp, ~tube_delay_numBox.value, \mix_low, -0.5, \mix_high, -1.0, \input_bus, ~viola_fx_send, \atk, 0.1, \dec, 0.1, \sus, 1, \rel, 10, \gate, 1, \out, ~viola_out], target: ~fx).register;

		    ~cello_ntube_1 = Synth(\ntube_6, [\amp, ~tube_delay_numBox.value, \mix_low, -1.0, \mix_high, -1.0, \input_bus, ~cello_fx_send, \atk, 0.1, \dec, 0.1, \sus, 1, \rel, 10, \gate, 1, \out, ~cello_out], target: ~fx).register;

		}).play(AppClock);

});