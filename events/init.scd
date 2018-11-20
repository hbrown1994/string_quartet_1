e.add(\init -> {

	~violin_1 = Synth(\violin_1, [\atk, 0.005, \rel, 20, \amp, -60], target: ~input).register;

	~violin_2 = Synth(\violin_2, [\atk, 0.005, \rel, 20, \amp, -60], target: ~input).register;

	~viola = Synth(\viola, [\atk, 0.005, \rel, 20, \amp, -60] ,target: ~input).register;

    ~cello = Synth(\cello, [\atk, 0.005, \rel, 20], target: ~input).register;


});