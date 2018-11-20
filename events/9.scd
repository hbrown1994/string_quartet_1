e.add(\9 -> {

	c[1].children[8].value_(0);//Previous Cue Button Off
	c[1].children[9].value_(1);//Current Cue Button On

	~contact_mic_1 = Synth(\feedback_1, [\atk, 20, \rel, 0.05, \dec, 0.1, \sus, 1,  \amp, ~contact_mic_1_numBox.value, \input_bus_left, ~contact_mic_1_in,  \input_bus_right, ~contact_mic_2_in, \freq, ~contact_mic_1_freq_numBox.value, \gate, 1, \out_left, ~sheet_1_out, \out_right, ~sheet_2_out], target: ~input).register;


	~noise_2 = Synth(\playbuf, [\bufnum, b[\no_input_high][2], \loop, 1, \gate, 1,
	\high_pass_freq, 500, \low_pass_mix, 0, \high_pass_mix, 1, \amp, ~noise_2_numBox.value, \atk, 0.005, \rel, 10]).register;

	Routine({

		~violin_1_glitch.set(\gate, 0);
		~violin_2_glitch.set(\gate, 0);
		~ringmod_cello.set(\gate, 0);
		~ringmod_viola.set(\gate, 0);
		~noise_1.set(\gate, 0);
		~grit_noise_1.set(\gate, 0);
		~glitch_stream.stop;

		s.sync;

		~patterns.free;

		s.sync;

		~patterns = Group.before(~input);

	}).play(AppClock);

});