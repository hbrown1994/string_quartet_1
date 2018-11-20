	e.add(\18 -> {
		c[1].children[17].value_(0);//Off
	    c[1].children[18].value_(1);//On

		// set to match parmeters below
		~friction_violin_1.set(\lpf_freq, 10000, \noise_speed, 20000, \fft_mix, -1.0);



		~metal_sheet_impulses = Synth(\metal_sheet_impulses_line, [\amp, ~metal_sheet_impulses_1_numBox.value, \atk, 0.5, \dec, 0.1, \sus, 1,  \rel,0.1, \curve, -4,  \gate, 1,\line_start, 0.01, \line_end, 20, \line_dur, 120, \out_left, ~sheet_1_out, \out_right, ~sheet_2_out], target: ~sheets).register;

	});