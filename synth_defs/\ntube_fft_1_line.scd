	SynthDef(\ntube_fft_1_line, {
		arg amp=(-3), loss=0.99, atk=0.05, dec=0.1, sus=1, rel=0.05, curve=(-10), gate=1, line_start=(-1), line_end=1, line_dur=10, mix_low=(-1.0), mix_high=(-1.0), input_bus, out;
		var sig, in, freq, hasFreq, env, chain, fft_sig, sig_mix, lossarray, karray, delayarray;
	    lossarray = ~loss_array_7;
	    karray = ~k_array_7;
	    delayarray = ~delay_array_7;
		//in = In.ar(input_bus); // r1eplace with soundin for live sound
	    in = In.ar(input_bus);
		env = EnvGen.kr(Env.adsr(atk, dec, sus, rel, curve: curve), gate, doneAction: 2);
		in = HPF.ar(in, 50);
	    sig = NTube.ar(in, lossarray, karray, delayarray) ;
		sig = Limiter.ar(sig, 0.7);
		sig = sig * RMS.kr(in).linlin(0.0, 0.1, 0.0, 0.8).clip(0.0, 0.8).lag(0.1);
		sig = HPF.ar(sig, 100);


		//FFT//
		chain = FFT(LocalBuf(512), in);
	    chain = PV_BinShift(chain, RMS.kr(in).linlin(0.0, 0.1, 0.8, 1.3).clip(0.8, 1.3).lag(0.2),       RMS.kr(in).linlin(0.0, 0.1, -2, 0.5).clip(-2, 0.5).lag(0.2));
		chain = PV_MagSmooth(chain, 1 - LFBrownNoise2.kr(10).range(0.001, 0.0001));
	    fft_sig = IFFT(chain);

		sig_mix = XFade2.ar(sig, fft_sig, Line.kr(line_start, line_end, line_dur)); /*fft_mix*/

		sig_mix = sig_mix * amp.dbamp.lag(0.1) * env;
		Out.ar(out, sig_mix);
	}).add;