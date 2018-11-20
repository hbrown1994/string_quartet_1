	e.add(\40 -> {
		c[1].children[39].value_(0);//Off
	    c[1].children[40].value_(1);//On

		~sub.set(\gate, 0);
		~contact_mic_1.set(\gate, 0);
	    ~glitch_stream.stop;

		~metal_sheet_impulses = Synth(\metal_sheet_impulses_line, [\amp, ~metal_sheet_impulses_1_numBox.value, \atk, 0.5, \dec, 0.1, \sus, 1,  \rel,0.1, \curve, (-6),  \gate, 1,\line_start, 40, \line_end, 3, \line_dur, 5, \out_left, ~sheet_1_out, \out_right, ~sheet_2_out], target: ~sheets).register;


	});