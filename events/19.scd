	e.add(\19 -> {
		c[1].children[18].value_(0);//Off
	    c[1].children[19].value_(1);//On

		Routine({
		~viola_ntube_1.set(\gate, 0);
		~cello_ntube_1.set(\gate, 0);


		1.wait;

		~viola_ntube = Synth(\ntube_2, [\amp, ~tube_delay_numBox.value, \mix_low, -1.0, \mix_high, -1.0, \input_bus, ~viola_fx_send, \atk, 5, \dec, 0.1, \sus, 1, \rel, 0.1, \gate, 1, \out, ~viola_out], target: ~fx).register;

		~cello_ntube = Synth(\ntube_2, [\amp, ~tube_delay_numBox.value, \mix_low, -0.5, \mix_high, -1.0, \input_bus, ~cello_fx_send, \atk, 5, \dec, 0.1, \sus, 1, \rel, 10, \gate, 1, \out, ~cello_out], target: ~fx).register;

		}).play(AppClock);
	});