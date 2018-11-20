	SynthDef(\reverb, {
		arg predelay=0.1, revtime=1.8,
		lpf=4500, mix=1, amp=(-40), out=0, sendsOut=~reverbOut, gate=1, atk=0, dec=10, sus=0.6, rel=0.05, c1=8, c2=(-8), input_bus;
		var dry, wet, temp, sig, env, temp1, in;
		in = In.ar(input_bus, 1);
		env = EnvGen.kr(Env.adsr(atk, dec, sus, rel, curve: -10), gate, doneAction:2);
		sig = 0;
		temp = DelayN.ar(in, 0, 0.1, predelay, mul: 1);
		temp = temp * env;
		30.do{
			temp = AllpassN.ar(temp, {Rand(0.001,0.5)}, {Rand(0.001,0.5)}, {Rand(30.0, 60.0)}, amp.dbamp.lag(0.1));
			temp = LPF.ar(temp, {Rand(700,10000)});
			sig = sig + temp;

		};
		Out.ar(out, sig);
	}).add;