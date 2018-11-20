e.add(\2 -> {

	c[1].children[1].value_(0);//Previous Cue Button Off
	c[1].children[2].value_(1);//Current Cue Button On

	~contact_mic_1.set(\gate, 0);
	~delay.set(\gate, 0);

});