	e.add(\51 -> {
		c[1].children[50].value_(0);//Off
	    c[1].children[51].value_(1);//On

	    ~contact_mic_1.set(\gate, 0);
	    ~sub.set(\gate, 0);
	    ~metal_sheet_impulses.set(\gate, 0);
		~glitch_stream.stop;


	});