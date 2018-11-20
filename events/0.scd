e.add(\0 -> {


	c[1].children[0].value_(1);//On

	Routine({

	    ~delay = Synth(\delay,[\amp, ~delay_numBox.value, \input_bus, ~violin_1_fx_send, \atk, 30, \dec, 0.1, \sus, 1, \rel, 30, \gate, 1, \out, ~violin_1_out], target: ~fx).register;

		70.wait;

		~delay.set(\gate, 0);

	}).play(AppClock);

});