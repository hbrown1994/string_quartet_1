	SynthDef(\feedback_1, {
		arg amp = (-60), gate=1, rel=30, atk=0.005, sus=1, freq=12000, input_bus_left=~contact_mic_1_in, input_bus_right=~contact_mic_2_in, dec=0.05, curve=(-8), mod_amp=(-60), in_mod_bus=~cello_fx_send, out_left, out_right;
		var in, env, sig_left, sig_right, in_left, in_right;
		in_left = SoundIn.ar(input_bus_left);
		in_right = SoundIn.ar(input_bus_right);
		env = EnvGen.kr(Env.adsr(atk, dec, sus, rel, curve: curve), gate, doneAction:2);
		sig_left = LPF.ar(in_left, freq.lag(0.1));
		sig_right = LPF.ar(in_right, freq.lag(0.1));
		sig_left = sig_left * amp.dbamp.lag(0.1) * env;
		sig_right = sig_right * amp.dbamp.lag(0.1) * env;
		Out.ar(out_left, sig_left);
		Out.ar(out_right, sig_right);
	}).add;