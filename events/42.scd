e.add(\42 -> {

		c[1].children[41].value_(0);//Previous Cue Button Off
	    c[1].children[42].value_(1);//Current Cue Button On

	   ~cello_ntube = Synth(\ntube_5, [\amp, ~tube_delay_numBox.value, \mix_low, -1.0, \mix_high, -1.0, \input_bus, ~cello_fx_send, \atk, 5, \dec, 0.1, \sus, 1, \rel, 30, \gate, 1, \out, ~cello_out, \curve, (-10)], target: ~fx).register;


	~ringmod_violin_2 = Synth(\ringmod, [\amp, ~violin_2_ringmod_numBox.value, \out, ~violin_2_out, \in_bus, ~violin_2_fx_send, \low_pass_mix, 1, \high_pass_mix, 1, \high_pass_freq, 100, \low_pass_freq, 4000, \gate, 1, \buf, b[\cringle][0], \rate_low, 0.01, \rate_high, 1.0, \atk, 10, \dec, 0.1, \sus, 1, \rel, 30, \mul, 4], target: ~fx).register;

});