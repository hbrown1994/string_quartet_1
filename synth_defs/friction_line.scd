	SynthDef(\friction_fft_1_line, {
		arg bufnum1, bufnum2, amp=(-3), mass=1.0, lpf_freq=10000, noise_speed=20, atk=0.05, dec=0.1, sus=1, rel=0.05, curve=(-10), gate=1, line_start=(-1), line_end=1, line_dur=10, input_bus, out, fx_out=~empty_bus, smooth_speed=5,smooth_max=0.1 ;
		var sig, in, kernel, env, chain, fft_sig, sig_mix, trig;
		in = In.ar(input_bus); // replace with soundin for live sound
		env = EnvGen.kr(Env.adsr(atk, dec, sus, rel, curve: curve), gate, doneAction: 2);

		//FRIC//
		sig = Friction.ar(in,
			friction: RMS.kr(in).linlin(0.0, 0.1, 5.41322e-5, 1.75584e-5).clip(lo: 1.75584e-5, hi: 5.41322e-5),
			mass: LFBrownNoise2.kr(noise_speed).range(0.2, 1.0),
			spring: RMS.kr(in).linlin(0.0, 0.1, 0.4, 0.1).clip(lo: 0.1, hi: 0.4));
		sig = LPF.ar(sig, lpf_freq);
		sig = Limiter.ar(sig, 0.9);

		//FFT//
		chain = FFT(LocalBuf(512), in);
	    chain = PV_BinShift(chain, RMS.kr(in).linlin(0.0, 0.1, 0.8, 1.3).clip(0.8, 1.3).lag(0.2),       RMS.kr(in).linlin(0.0, 0.1, -2, 0.5).clip(-2, 0.5).lag(0.2));
		chain = PV_MagSmooth(chain, 1 - LFBrownNoise2.kr(10).range(0.001, 0.0001));
	    fft_sig = IFFT(chain);

	    //MIX FRIC & FFT
		sig_mix = XFade2.ar(sig, fft_sig, Line.kr(line_start, line_end, line_dur));

		sig_mix = sig_mix * amp.dbamp.lag(0.1) * env;
		Out.ar(out, sig_mix);
	}).add;