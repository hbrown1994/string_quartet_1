	SynthDef(\pattern_buf_rumble, {
		arg atk=0, sus=0, rel=3, c1=6, c2=(-6),
		buf=0, rate=1, spos=0, freq=440, rq=1, bpfmix=0,
		pan_pos=0, amp=1.0, wet=0, distmix=0, out=~inputbus1, loop=1, combmix=0, delayTime=0.2, decayTime=1.0,
		low_pass_freq, low_pass_mix, high_pass_freq, high_pass_mix, out_sub;
		var sig, env, sig_1;
		env = EnvGen.kr(Env([0.0,0.2,0.2,0.0],[atk,sus,rel],[c1,0,c2]),doneAction:2);
		sig = PlayBuf.ar(1, buf, rate*BufRateScale.ir(buf),startPos:spos, loop: loop);
	    sig = XFade2.ar(sig, LPF.ar(sig, low_pass_freq), (low_pass_mix*2-1));
	    sig = XFade2.ar(sig, HPF.ar(sig, high_pass_freq);, (high_pass_mix*2-1));
	    sig = sig * env;
		sig_1 = Pan2.ar(sig, pan_pos);
		Out.ar(out, HPF.ar(sig_1 * amp.dbamp.lag(0.1), 100));
		Out.ar(out_sub, LPF.ar(sig * amp.dbamp.lag(0.1), 100));

}).add;