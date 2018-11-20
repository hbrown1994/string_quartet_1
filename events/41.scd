e.add(\41 -> {

	c[1].children[40].value_(0);//Previous Cue Button Off
	c[1].children[41].value_(1);//Current Cue Button On

	~delay = Synth(\delay,[\amp, ~delay_numBox.value, \input_bus, ~violin_1_fx_send, \atk, 10, \dec, 0.1, \sus, 1, \rel, 30, \gate, 1, \out, ~violin_1_out], target: ~fx).register;

	~viola_ntube = Synth(\ntube_5, [\amp, ~tube_delay_numBox.value, \mix_low, -1.0, \mix_high, -1.0, \input_bus, ~viola_fx_send, \atk, 45, \dec, 0.1, \sus, 1, \rel, 0.05, \gate, 1, \out, ~viola_out], target: ~fx).register; //violin_2

	~metal_sheet_impulses.set(\gate, 0);

	});