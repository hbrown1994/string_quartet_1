	e.add(\8 -> {

	c[1].children[7].value_(0);//Off
	c[1].children[8].value_(1);//On

	~noise_1 = Synth(\playbuf, [\bufnum, b[\no_input_stable_drone][3], \loop, 1, \gate, 1,
	\low_pass_freq, 300, \low_pass_mix, 1, \high_pass_mix, 0, \atk, 25 , \rel, 0.005, \amp, ~noise_1_numBox.value, \curve, -2], target: ~samples).register;

   ~grit_noise_1 = Synth(\playbuf, [\bufnum, b[\no_input_unstable_drone][5], \loop, 1, \gate, 1,
	\high_pass_freq, 100, \low_pass_mix, 0, \high_pass_mix, 1, \atk, 25, \rel, 0.005, \amp, ~noise_1_numBox.value, \curve, -2], target: ~samples).register;


});
