	SynthDef(\friction_fft_1_rms, {
		arg bufnum1, bufnum2, amp=(-3), mass=1.0, lpf_freq=10000, noise_speed=20, atk=0.05, dec=0.1, sus=1, rel=0.05, curve=(-10), gate=1, line_start=(-1), line_end=1, line_dur=10, mix_low=(-1.0), mix_high=(-1.0), input_bus, out, smooth_speed=5,smooth_max=0.1, fx_out=~empty_bus, fft_mix=1.0;
		var sig, in, kernel, env, chain, fft_sig, sig_mix, trig;
		in = In.ar(input_bus); // replace with soundin for live sound


		env = EnvGen.kr(Env.adsr(atk, dec, sus, rel, curve: curve), gate, doneAction: 2);
		//FRIC//
		sig = Friction.ar(in,
			friction: RMS.kr(in).linlin(0.0, 0.1, 5.41322e-5, 3.75584e-5).clip(lo: 3.75584e-5, hi: 5.41322e-5),
			mass: LFBrownNoise2.kr(noise_speed).range(0.6, 1.0),
			spring: RMS.kr(in).linlin(0.0, 0.1, 0.4, 0.1).clip(lo: 0.1, hi: 0.4));
		sig = LPF.ar(sig, lpf_freq);
		sig = Limiter.ar(sig, 0.9);

		//FFT//
		chain = FFT(LocalBuf(512), in);
		trig = Onsets.kr(chain, 0.01);
	    chain = PV_BinShift(chain, RMS.kr(in).linlin(0.0, 0.1, TRand.kr(0.5, 1.0, trig), TRand.kr(1.2, 2.0, trig)).clip(0.8, 1.3).lag(0.2), RMS.kr(in).linlin(0.0, 0.1, TRand.kr(-4, -2, trig), TRand.kr(0.5, 1.0, trig)).clip(-2, 0.5).lag(0.2));
		chain = PV_BinScramble(chain, RMS.kr(in).linlin(0.0, 0.1, 0.001, 0.99).clip(0.001, 0.99), RMS.kr(in).linlin(0.0, 0.1, 0.001, TRand.kr(0.7, 0.99, trig)).clip(0.001, 0.99), trig);
	    fft_sig = IFFT(chain);

		sig_mix = XFade2.ar(sig, fft_sig, fft_mix);

		sig_mix = sig_mix * amp.dbamp.lag(0.1) * env;
		Out.ar(out, sig_mix);
		//Out.ar(fx_out, sig_mix);
	}).add;