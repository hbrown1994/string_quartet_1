e.add(\47 -> {

		c[1].children[46].value_(0);//Previous Cue Button Off
	    c[1].children[47].value_(1);//Current Cue Button On


	~glitch_stream = Pdef(
	\glitch1,
	Pbind(
		\instrument, \pattern_buf,
		\dur, Pexprand(0.01, 2),
		\atk, Pexprand(0.005,0.01),
		\rel, Pwhite(0.02, 0.5),
		\buf, Prand(m[\no_input_glitch][(0..12)]++m[\no_input_rhythm][(0..3)]++m[\no_input_noise][(0..5)]++m[\no_input_stable_drone][(0..6)]++m[\no_input_unstable_drone][(0..5)]++m[\no_input_gesture][(0..4)]++m[\no_input_high][(0..3)]++m[\cringle][(0..0)]++m[\shake][(0..3)]++m[\struck][(0..2)]++m[\superball][(0..6)]++m[\scrape][(0..4)]++m[\rod][(0..5)], inf),

		\rate, Pexprand(0.2, 3.0),
		\spos, Pwhite(0, 10000),
		\amp, Pfunc({~glitch_stream_val}),
		\pan_pos, Pwhite(-1.0, 1.0),
		\low_pass_mix, 0,
		\low_pass_freq, 17000,
		\high_pass_mix, 1,
		\high_pass_freq, 30,
		\out, 0,
		\group, ~patterns,
		);
		).play(TempoClock(1));

		~contact_mic_1 = Synth(\feedback_1, [\atk, 10 , \rel, 0.1, \amp, ~contact_mic_1_numBox.value, \input_bus_left, ~contact_mic_1_in,  \input_bus_right, ~contact_mic_2_in, \freq, ~contact_mic_1_freq_numBox.value, \gate, 1, \out_left, ~sheet_1_out, \out_right, ~sheet_2_out], target: ~input).register;

		~friction_violin_2 = Synth(\friction_fft_1_rms, [\amp, ~friction_numBox.value, \lpf_freq, 8000, \noise_speed, 100, \input_bus, ~violin_2_fx_send, \atk, 10, \dec, 0.1, \sus, 1, \rel, 0.05, \gate, 1, \out, ~violin_2_out, \fft_mix, -1.0], ~fx).register;

	});