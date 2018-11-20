	e.add(\stop_reset -> {
	        ~cue=0;
			s.freeAll;
		    c[0].children[0].value_(0);
		    ~glitch_stream.stop;
		    ~metal_stream.stop;
		    ~soft_glitch.stop;
		    ~low_freq_rumble.stop;

		    52.do{
			arg i=(-1);
		   {i = i + 1};
		c[1].children[i].value_(0)
		}
	});