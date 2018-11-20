	SynthDef(\ringmod, {
		arg amp = 0, buf, rate_low, rate_high, gate=1, atk, dec, sus, rel, curve=(-10), pan_freq = 2, low_pass_freq=1000, low_pass_mix=0, high_pass_freq=100, high_pass_mix=0, in_bus, mod_amp=0, out, mul=1;
		var car, mod, sig, mod1, mod2, env, amp_trig, chain, onset;
		env = EnvGen.kr(Env.adsr(atk, dec, sus, rel, curve: curve), gate, doneAction: 2);
		car = In.ar(in_bus);
		mod = PlayBuf.ar(1, buf, RMS.kr(car).linlin(0.0, 0.1, rate_low, rate_high), 1, 0, 1);
		sig = DiodeRingMod.ar(car: car, mod: mod)* RMS.kr(car).linlin(0.0, 0.1, 0.0, 1.0);
		sig = XFade2.ar(sig, LPF.ar(sig, low_pass_freq), (low_pass_mix*2-1));
	    sig = XFade2.ar(sig, HPF.ar(sig, high_pass_freq), (high_pass_mix*2-1));
		sig = sig * env * amp.dbamp.lag(0.1) * mul;
		Out.ar(out, sig);
	}).add;
