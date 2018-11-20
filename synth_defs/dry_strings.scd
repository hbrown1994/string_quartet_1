	SynthDef(\violin_1, {
		arg amp = (-60), gate=1, rel=30, atk=0.005, sus=0, freq, high_pass_freq=40, high_pass_mix=1;
		var env, sig, sig_dry;
		sig = SoundIn.ar(~violin_1_in);
		env = EnvGen.kr(Env.adsr(sustainLevel: 1.0), gate, doneAction:2);
		sig_dry = sig * amp.dbamp.lag(0.1);
		sig_dry = XFade2.ar(sig, HPF.ar(sig_dry, high_pass_freq), (high_pass_mix*2-1));
		Out.ar(~violin_1_out, sig_dry);
		Out.ar(~violin_1_fx_send, sig);
	}).add;

	SynthDef(\violin_2, {
		arg amp = (-60), gate=1, rel=30, atk=0.005, sus=0, freq, high_pass_freq=40, high_pass_mix=1;
		var env, sig, sig_dry;
		sig = SoundIn.ar(~violin_2_in);
env = EnvGen.kr(Env.adsr(sustainLevel: 1.0), gate, doneAction:2);
		sig_dry = sig * amp.dbamp.lag(0.1);
		sig_dry = XFade2.ar(sig, HPF.ar(sig_dry, high_pass_freq), (high_pass_mix*2-1));
		Out.ar(~violin_2_out, sig_dry);
		Out.ar(~violin_2_fx_send, sig);
	}).add;

	SynthDef(\viola, {
		arg amp = (-60), gate=1, rel=30, atk=0.005, sus=0, freq, high_pass_freq=40, high_pass_mix=1;
		var env, sig, sig_dry;
		sig = SoundIn.ar(~viola_in);
		env = EnvGen.kr(Env.adsr(sustainLevel: 1.0), gate, doneAction:2);
		sig_dry = sig * amp.dbamp.lag(0.1);
		sig_dry = XFade2.ar(sig, HPF.ar(sig_dry, high_pass_freq), (high_pass_mix*2-1));
		Out.ar(~viola_out, sig_dry);
		Out.ar(~viola_fx_send, sig);
	}).add;

	SynthDef(\cello, {
		arg amp = (-60), gate=1, rel=30, atk=0.005, sus=0, high_pass_freq=40, high_pass_mix=1;
		var env, sig, sig_dry;
		sig = SoundIn.ar(~cello_in);
		env = EnvGen.kr(Env.adsr(sustainLevel: 1.0), gate, doneAction:2);
		sig_dry = sig * amp.dbamp.lag(0.1);
		sig_dry = XFade2.ar(sig, HPF.ar(sig_dry, high_pass_freq), (high_pass_mix*2-1));
		Out.ar(~cello_out, sig_dry);
		Out.ar(~cello_fx_send, sig);
	}).add;