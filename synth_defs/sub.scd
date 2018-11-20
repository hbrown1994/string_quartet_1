	SynthDef(\sub, {
		arg amp=0, out_bus=0, atk=0.05, sus=0.6, dec=20, rel=0.05, curve= (-10), gate=1, time=180;
		var env, sig;
		env = EnvGen.kr(Env.adsr(atk, dec, sus, rel, curve: curve), gate, doneAction: 2);
	sig = SinOsc.ar(XLine.kr(41.203, 27.5, time));
		sig = sig * env * amp.dbamp.lag(0.1);
		Out.ar(out_bus, sig);
	}).add;