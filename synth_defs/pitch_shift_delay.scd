	SynthDef(\delay, {
	arg amp=(-6), out=2, atk=0.05, sus=0.6, dec=20, rel=0.05, curve=(-10), gate=1, time=180, predelay=0.1, input_bus;
		var env, sig, temp, in;
	    in = In.ar(input_bus);
		env = EnvGen.kr(Env.adsr(atk, dec, sus, rel, curve: curve), gate, doneAction: 2);

	    sig = 0;

	    temp = DelayN.ar(in, 0, 0.1, predelay, mul: 3);
	    temp = HPF.ar(temp, 1000);
	5.do{
		temp =  SwitchDelay.ar(temp, delaytime: {Rand(0.1, 1)} ,delayfactor: {Rand(0.01, 0.3)}, wetlevel: 1, drylevel: 0);
		temp = FreqShift.ar(temp, freq: ({Rand(-1000, -300 )} + {LFBrownNoise2.kr({Rand(1, 20)}).range(0, {Rand(-300, -600)})}), phase: 0, mul: 1, add: 0);
			sig = sig + temp;
		};
		sig = sig * env * amp.dbamp.lag(0.1);

	    Out.ar(out, sig);
	}).add;