	SynthDef(\ntube_fft_1_rms, {
		arg amp=(-3), loss=0.99, atk=0.05, dec=0.1, sus=1, rel=0.05, curve=(-10), gate=1, line_start=(-1), line_end=1, line_dur=10, mix_low=(-1.0), mix_high=(-1.0), input_bus, out;
		var sig, in, freq, hasFreq, env, chain, fft_sig, sig_mix;
		in = In.ar(input_bus); // replace with soundin for live sound
		env = EnvGen.kr(Env.adsr(atk, dec, sus, rel, curve: curve), gate, doneAction: 2);
		# freq, hasFreq = Pitch.kr(in, ampThreshold: 0.02, median: 7);
		in = HPF.ar(in, 50);
		sig = NTube.ar(in,`[0.97,1.0,1.0,1.0,0.97],`[0.5, LFNoise2.kr(LFNoise2.kr(300).range(10, 100)).range(-1.0, 1.0),0.2],`([0.01,0.02,0.01,0.005]*RMS.kr(in).linlin(0.0, 0.1, 0.2,1.0).clip( 0.2,1.0)));
		sig = Limiter.ar(sig, 0.7);
		sig = sig * RMS.kr(in).linlin(0.0, 0.1, 0.0, 0.8).clip(0.0, 0.8).lag(0.1);
		sig = HPF.ar(sig, 100);
		//FFT//
		chain = FFT(LocalBuf(1024), sig);
		chain = PV_MagSmooth(chain, 1 - RMS.ar(in).linlin(0.0, 0.1, 0.00001, 0.5));
		chain = PV_MagSmear(chain, RMS.ar(in).linlin(0.0, 0.1, 0.00001, 100));
		chain = PV_BinShift(chain, RMS.ar(in).linlin(0.0, 0.1, 0.25, 0.5));

		fft_sig = IFFT(chain);
		sig_mix = XFade2.ar(sig, fft_sig, RMS.kr(in).linlin(0.0, 0.1, mix_low, mix_high).clip(-1.0, 1.0)); /*fft_mix*/
		sig_mix = sig_mix * RMS.kr(in).linlin(0.0, 0.1, 0.5, 0.8).clip(0.2, 0.8).lag(0.1);
		sig_mix = sig_mix * amp.dbamp.lag(0.1) * env;
		Out.ar(out, sig_mix);
	}).add;