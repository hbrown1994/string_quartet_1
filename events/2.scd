	e.add(\2 -> {

	"cue 1".postln;
	c[1].children[1].value_(0);//Off
	c[1].children[2].value_(1);//On
	~contact_mic_1.set(\gate, 0);
	~delay.set(\gate, 0);

});