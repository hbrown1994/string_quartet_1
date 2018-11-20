	SynthDef(\metal_sheet_impulses_line, {
		arg out=0, amp, env, atk, dec, sus, rel, curve=(-10), gate, trig_speed=3, filter_low=100, filter_high=300, filter_mix, dust_speed=3, rq=0.008, mul=1, line_start, line_end, line_dur, out_left, out_right;
		var sig, trig;

		sig = Dust.ar(Line.kr(line_start, line_end, line_dur, 1), 5);
		trig = Dust.kr(Line.kr(line_start, line_end, line_dur, 1));

		env = EnvGen.kr(Env.adsr(atk, dec, sus, rel, curve: curve ), gate, doneAction:2);

		sig = sig * env * amp.dbamp.lag(0.1);
		Out.ar(TIRand.kr(out_left, out_right, trig), sig);
	}).add;