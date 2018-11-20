e.add(\26 -> {
		c[1].children[25].value_(0);//Previous Cue Button Off
	    c[1].children[26].value_(1);//Current Cue Button On

			~glitch_loops= Pdef(
			\glitch1,
			Pbind(
				\instrument, \pattern_buf,
				\dur, Pwhite(0.5, 2),
				\atk, Pwhite(0.5, 6),
				\rel, Pwhite(20, 25),
				\c1, Pwhite(1, 9),
				\c2, Pwhite(-1, -9),
				\buf, Pwrand(m[\no_input_rhythm][(0..3)]++m[\no_input_gesture][(0..2)], [10, 10, 10, 10, 2, 2, 2].normalizeSum, inf),
				\rate, Prand([Pwhite(-0.1, -10.0), Pwhite(0.1, 10.0)], inf),
				\spos, Pwhite(0, 20000),
				\amp, Pfunc({~glitch_stream_val}),
				\pan_pos, Pwhite(-1.0, 1.0),
				\low_pass_mix, 1,
				\low_pass_freq, 12000,
				\high_pass_mix, 1,
				\high_pass_freq, 100,
				\out, 0,
				\group, ~patterns,
			);
		).play(TempoClock(1));

		    ~viola_glitch.set(\gate, 0);

		    ~reverb = Synth(\reverb, [\amp, ~reverb_numBox.value, \gate, 1, \atk, 12, \dec, 1, \sus, 1, \rel, 0.05, \input_bus, ~cello_fx_send, \out, ~cello_out], target: ~fx).register;

		    ~reverb_violin_1 = Synth(\reverb, [\amp, ~reverb_numBox.value, \gate, 1, \atk, 12, \dec, 1, \sus, 1, \rel, 0.05, \input_bus, ~violin_1_fx_send, \out, ~violin_1_out], target: ~fx).register;

		    ~reverb_violin_2 = Synth(\reverb, [\amp, ~reverb_numBox.value, \gate, 1, \atk, 12, \dec, 1, \sus, 1, \rel, 0.05, \input_bus, ~violin_2_fx_send, \out, ~violin_2_out], target: ~fx).register;

	        ~reverb_viola = Synth(\reverb, [\amp, ~reverb_numBox.value, \gate, 1, \atk, 12, \dec, 1, \sus, 1, \rel, 0.05, \input_bus, ~viola_fx_send, \out, ~viola_out], target: ~fx).register;

});