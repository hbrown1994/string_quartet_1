e.add(\5 -> {


	c[1].children[4].value_(0);//Previous Cue Button Off
	c[1].children[5].value_(1);//Current Cue Button On

	~ringmod_cello.set(\gate, 0);
	~ringmod_viola.set(\gate, 0);
	~violin_2_glitch.set(\gate, 0);
	~violin_1_glitch.set(\gate, 0);

    ~glitch_stream = Pdef(
	\glitch1,
	Pbind(
		\instrument, \pattern_buf,
		\dur, Pseries(0.01, 0.1, 20),
		\atk, Pexprand(0.02,0.08),
		\rel, Pseries(5, -0.1, 20),
		\buf, Prand(m[\no_input_glitch][(0..12)], inf),
		\rate, Pexprand(0.2, 3.0),
		\spos, Pwhite(0, 10000),
		\amp, Pseries(~glitch_stream_val, (-1), 30),
		\pan_pos, Pwhite(-1.0, 1.0),
		\low_pass_mix, 1,
		\low_pass_freq, 13000,
		\high_pass_mix, 1,
		\high_pass_freq, 30,
		\out, 0,
		\group, ~patterns,
		);
		).play(TempoClock(1));

		~contact_mic_1 = Synth(\feedback_1, [\atk, 8 , \rel, 16, \amp, ~contact_mic_1_numBox.value, \input_bus_left, ~contact_mic_1_in,  \input_bus_right, ~contact_mic_2_in, \freq, ~contact_mic_1_freq_numBox.value, \gate, 1, \out_left, ~sheet_1_out, \out_right, ~sheet_2_out], target: ~input).register;


});