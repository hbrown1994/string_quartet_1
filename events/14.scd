	e.add(\14 -> {

	c[1].children[13].value_(0);//Off
	c[1].children[14].value_(1);//On


		~delay = Synth(\delay,[\amp, ~delay_numBox.value, \input_bus, ~cello_fx_send, \atk, 30, \dec, 0.1, \sus, 1, \rel, 10, \gate, 1, \curve, (-10),  \out, ~cello_out], target: ~fx).register;

});