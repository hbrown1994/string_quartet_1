	SynthDef(\playbuf, {
		arg bufnum, rate=1, trig, startPos=0, loop=1, amp=(-20), atk=0.05, dec=0.1, sus=1, rel=0.05, curve= (-8), gate=1, high_pass_freq=900, low_pass_freq=100, low_pass_mix=0, high_pass_mix=0;
		var sig, env;
		sig = PlayBuf.ar(2, bufnum, rate, trig, startPos, loop);
		env = EnvGen.kr(Env.adsr(atk, dec, sus, rel, curve: curve), gate, doneAction: 2);
		sig = sig * env * amp.dbamp;
		sig = XFade2.ar(sig, LPF.ar(sig, low_pass_freq), (low_pass_mix*2-1));
		sig = XFade2.ar(sig, HPF.ar(sig, high_pass_freq);, (high_pass_mix*2-1));
		Out.ar(0, sig);
	}).add;

	SynthDef(\pattern_buf, {
		arg atk=0, sus=0, rel=3, c1=6, c2=(-6),
		buf=0, rate=1, spos=0, freq=440, rq=1, bpfmix=0,
		pan_pos=0, amp=1.0, wet=0, distmix=0, out=~inputbus1, loop=1, combmix=0, delayTime=0.2, decayTime=1.0,
		low_pass_freq, low_pass_mix, high_pass_freq, high_pass_mix;
		var sig, env;
		env = EnvGen.kr(Env([0.0,0.2,0.2,0.0],[atk,sus,rel],[c1,0,c2]),doneAction:2);
		sig = PlayBuf.ar(1, buf, rate*BufRateScale.ir(buf),startPos:spos, loop: loop);
	    sig = XFade2.ar(sig, LPF.ar(sig, low_pass_freq), (low_pass_mix*2-1));
	    sig = XFade2.ar(sig, HPF.ar(sig, high_pass_freq);, (high_pass_mix*2-1));
	    sig = sig * env;
		sig = Pan2.ar(sig, pan_pos);
		Out.ar(out, sig * amp.dbamp.lag(0.1));
}).add;