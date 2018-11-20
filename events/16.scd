e.add(\16 -> {
		c[1].children[15].value_(0);//Previous Cue Button Off
	    c[1].children[16].value_(1);//Current Cue Button On

		~friction_violin_1.set(\fft_mix, 0.5, \noise_speed, 20);
		~friction_violin_2.set(\fft_mix, 0.0, \noise_speed, 100);

});