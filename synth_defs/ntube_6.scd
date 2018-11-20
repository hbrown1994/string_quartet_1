	SynthDef(\ntube_6, {
	arg amp=(-3), loss=0.99, atk=0.05, dec=0.1, sus=1, rel=0.05, curve=(-10), gate=1, line_start=(-1), line_end=1, line_dur=10, mix_low=(-1.0), mix_high=(-1.0), input_bus, out;
		var sig, in, freq, hasFreq, env, chain, fft_sig, sig_mix, lossarray, karray, delayarray;
	    lossarray = ~loss_array_6;
	    karray = ~k_array_6;
	    delayarray = ~delay_array_6;

	    in  = In.ar(input_bus);
		env = EnvGen.kr(Env.adsr(atk, dec, sus, rel, curve: curve), gate, doneAction: 2);
		in = HPF.ar(in, 50);
	    sig = NTube.ar(in, lossarray, karray, delayarray) ;
		sig = Limiter.ar(sig, 0.7);
		sig = sig * RMS.kr(in).linlin(0.0, 0.1, 0.0, 0.8).clip(0.0, 0.8).lag(0.1);
		sig = HPF.ar(sig, 100);

		//FFT//
		chain = FFT(LocalBuf(1024), sig);
		chain = PV_MagSmooth(chain, 1 - RMS.ar(in).linlin(0.0, 0.1, 0.00001, 0.5));
		chain = PV_MagSmear(chain, RMS.ar(in).linlin(0.0, 0.1, 0.001, 100));
		chain = PV_BinShift(chain, RMS.ar(in).linlin(0.0, 0.1, 0.5, 10));

		fft_sig = IFFT(chain);
		sig_mix = XFade2.ar(sig, fft_sig, RMS.kr(in).linlin(0.0, 0.1, mix_low, mix_high).clip(-1.0, 1.0));
		sig_mix = sig_mix * amp.dbamp.lag(0.1) * env;
		Out.ar(out, sig_mix);
	}).add;