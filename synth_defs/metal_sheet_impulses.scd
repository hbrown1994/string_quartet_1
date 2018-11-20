	SynthDef(\metal_sheet_impulses, {
		arg out=0, amp, env, atk, dec=0.1, sus=1, rel, curve=(-10), gate, trig_speed=3, filter_low=100, filter_high=300, filter_mix, dust_speed=3, rq=0.008, mul=1, out_left, out_right;
		var sig, trig;
		sig = Dust.ar(dust_speed, mul);
		trig = GaussTrig.kr(trig_speed, 1);
		env = EnvGen.kr(Env.adsr(atk, dec, sus, rel, curve: curve), gate, doneAction:2);
		sig = sig * env * amp.dbamp.lag(0.1);
		Out.ar(TIRand.kr(out_left, out_right, trig), sig);
	}).add;