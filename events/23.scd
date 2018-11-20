	e.add(\23 -> {
		c[1].children[22].value_(0);//Off
	    c[1].children[23].value_(1);//On
		/*dsp here*/
		//update ~glitch_loops

		Routine({

		~viola_ntube_1.set(\gate, 0);
		~cello_ntube_1.set(\gate, 0);


	    ~friction_violin_1.set(\lpf_freq, 18000, \noise_speed, 600, \fft_mix, 1.0);

		~friction_violin_2.set(\lpf_freq, 17000, \noise_speed, 10000, \fft_mix, -1.0);

		~cello_glitch = Synth(\grain_delay, [\amp, ~cello_glitch_numBox.value, \in_bus, ~cello_fx_send, \grain_trig_low, 1, \grain_trig_high, 10, \grain_dev, 1, \grain_size_low, 0.01, \grain_size_high, 0.05, \trig_fft_low, 5, \trig_fft_high, 20, \fft_dev, 1, \trig_freeze_low, 2, \trig_freeze_high, 20, \freeze_dev, 1, \trig_freq_low, 5, \trig_freq_high, 50, \atk, 3, \dec, 0.1, \sus, 1, \rel, 0.05, \gate, 1, \out, ~cello_out], target: ~fx).register;


		//add amp control
		~glitch_loops= Pdef(
			\glitch1,
			Pbind(
				\instrument, \pattern_buf,
				\dur, Pwhite(5, 10),
				\atk, Pwhite(2, 10),
				\rel, Pwhite(6, 10),
				\c1, Pwhite(1, 5),
				\c2, Pwhite(-1, -5),
				\buf, Pwrand(m[\no_input_rhythm][(0..3)]++m[\no_input_gesture][(0..2)], [10, 10, 10, 10, 2, 2, 2].normalizeSum, inf),
				\rate, Prand([Pwhite(-0.4, -5.0), Pwhite(0.4, 5.0)], inf),
				\spos, Pwhite(0, 20000),
				\amp, Pfunc({~glitch_stream_val}),
				\pan_pos, Pwhite(-1.0, 1.0),
				\low_pass_mix, 1,
				\low_pass_freq, 5000,
				\high_pass_mix, 1,
				\high_pass_freq, 100,
				\out, 0,
				\group, ~patterns,
			);
		).play(TempoClock(1));



		~viola_glitch.set(\gate, 0);


     	~metal_stream = Pdef(
			\metal1,
			Pbind(
				\instrument, \pattern_buf,
				\dur,  Pif(Ptime(inf) < 50, Pwhite(Pseg(Pseq([2, 0.01], inf), Pseq([50, 50], inf), \linear), Pseg(Pseq([4.0, 0.1], inf), Pseq([50, 50], inf), \linear)), Pwhite(0.01, 0.1),inf),
				\atk, Pwhite(0.05, 0.01),
				\rel, Pif(Ptime(inf) < 50, Pwhite(0.1, Pseg(Pseq([0.5, 3], inf), Pseq([50, 50], inf), \linear)), Pwhite(0.1, 3),inf),
				\buf, Prand(m[\cringle][(0..0)]++m[\shake][(0..3)]++m[\struck][(0..2)], inf),
				\rate,  Prand([Pwhite(-0.01, Pif(Ptime(inf) < 50, Pseg(Pseq([-5, -2], inf), Pseq([50, 50], inf), \linear), -2)), Pwhite(0.01, Pif(Ptime(inf) < 50, Pseg(Pseq([10, 2], inf), Pseq([50, 50], inf), \linear), 2))], inf),
				\stretch,  1,
				\spos, Pwhite(0, 10000),
				\amp, Pfunc({~metal_stream_val}),
				\loop, 1,
				\pan_pos, Pwhite(-1.0, 1.0),
				\low_pass_mix, 0,
				\low_pass_freq, 13000,
				\high_pass_mix, 1,
				\high_pass_freq, 30,
				\out, 0,
				\group, ~patterns,
			);
		).play(TempoClock(1));




		s.sync;

		~viola_ntube = Synth(\ntube_7, [\amp, ~tube_delay_numBox.value, \mix_low, -1.0, \mix_high, -1.0, \input_bus, ~viola_fx_send, \atk, 10, \dec, 0.1, \sus, 1, \rel, 10, \gate, 1, \out, ~viola_out], target: ~fx).register;

		~cello_ntube = Synth(\ntube_8, [\amp, ~tube_delay_numBox.value, \mix_low, -1.0, \mix_high, -1.0, \input_bus, ~cello_fx_send, \atk, 10, \dec, 0.1, \sus, 1, \rel, 10, \gate, 1, \out, ~cello_out], target: ~fx).register;

		}).play(AppClock);



	});