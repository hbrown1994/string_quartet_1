
	MIDIdef.cc(\knob_1, {
		arg val;
		~knob_1 = val.linlin(0, 127, -60.0, 0.0);

		{c[2].children[4].valueAction_(~knob_1)}.defer;

	}, 1);

	MIDIdef.cc(\knob_2, {
		arg val;
		~knob_2 = val.linlin(0, 127, -60.0, 0.0);

		{c[2].children[5].valueAction_(~knob_2)}.defer;
	}, 2);

	MIDIdef.cc(\knob_3, {
		arg val;
		~knob_3 = val.linlin(0, 127, -60.0, 0.0);

		{c[2].children[6].valueAction_(~knob_3)}.defer;
	}, 3);

	MIDIdef.cc(\knob_4, {
		arg val;
		~knob_4 = val.linlin(0, 127, -60.0, 0.0);

		{c[2].children[7].valueAction_(~knob_4)}.defer;
	}, 4);

	MIDIdef.cc(\knob_5, {
		arg val;
		~knob_5 = val.linlin(0, 127, -60.0, 0.0);

		{c[3].children[4].valueAction_(~knob_5)}.defer;
	}, 5);

	MIDIdef.cc(\knob_6, {
		arg val;
		~knob_6 = val.linlin(0, 127, -60.0, 0.0);

		{c[3].children[5].valueAction_(~knob_6)}.defer;
	}, 6);

	MIDIdef.cc(\knob_7, {
		arg val;
		~knob_7 = val.linlin(0, 127, -60.0, 0.0);

		{c[3].children[6].valueAction_(~knob_7)}.defer;
	}, 7);

	MIDIdef.cc(\knob_8, {
		arg val;
		~knob_8 = val.linlin(0, 127, -60.0, 0.0);

		{c[3].children[7].valueAction_(~knob_8)}.defer;
	}, 8);

	MIDIdef.cc(\knob_9, {
		arg val;
		~knob_9 = val.linlin(0, 127, -60.0, 0.0);

		{c[6].children[3].valueAction_(~knob_9)}.defer;

	}, 9);

	MIDIdef.cc(\knob_10, {
		arg val;
		~knob_10 = val.linlin(0, 127, 100.0, 8000.0);

		{c[6].children[4].valueAction_(~knob_10)}.defer;

	}, 10);

	MIDIdef.cc(\knob_11, {
		arg val;
		~knob_11 = val.linlin(0, 127, -90.0, 0.0);

		{c[6].children[5].valueAction_(~knob_11)}.defer;


	}, 11);

	MIDIdef.cc(\knob_12, {
		arg val;
		~knob_12 = val.linlin(0, 127, -60.0, 0.0);
		{c[7].children[5].valueAction_(~knob_12)}.defer;

	}, 12);

	MIDIdef.cc(\knob_13, {
		arg val;
		~knob_13 = val.linlin(0, 127, -60.0, 0.0);

		{c[7].children[6].valueAction_(~knob_13)}.defer;

	}, 13);

	MIDIdef.cc(\knob_14, {
		arg val;
		~knob_14 = val.linlin(0, 127, -60.0, 0.0);

		{c[7].children[7].valueAction_(~knob_14)}.defer;
	}, 14);

	MIDIdef.cc(\knob_15, {
		arg val;
		~knob_15 = val.linlin(0, 127, -60.0, 0.0);

		{c[7].children[8].valueAction_(~knob_15)}.defer;
	}, 15);

	MIDIdef.cc(\knob_16, {
		arg val;
		~knob_16 = val.linlin(0, 127, -60.0, 0.0);

		{c[7].children[9].valueAction_(~knob_16)}.defer;
	}, 16);

	//////////////////////////////////////////////////////////////////////////////////

	MIDIdef.cc(\slider_1, {
		arg val;
		~slider_1 = val.linlin(0, 127, -60.0, 0.0);

		{c[4].children[5].valueAction_(~slider_1)}.defer;

	}, 17);

	MIDIdef.cc(\slider_2, {
		arg val;
		~slider_2 = val.linlin(0, 127, -60.0, 0.0);

		{c[4].children[6].valueAction_(~slider_2)}.defer;
	}, 18);

	MIDIdef.cc(\slider_3, {
		arg val;
		~slider_3 = val.linlin(0, 127, -60.0, 0.0);

		{c[4].children[7].valueAction_(~slider_3)}.defer;
	}, 19);

	MIDIdef.cc(\slider_4, {
		arg val;
		~slider_4 = val.linlin(0, 127, -60.0, 0.0);

		{c[4].children[8].valueAction_(~slider_4)}.defer;
	}, 20);

	MIDIdef.cc(\slider_5, {
		arg val;
		~slider_5 = val.linlin(0, 127, -60.0, 0.0);

		{c[4].children[9].valueAction_(~slider_5)}.defer;
	}, 21);

	MIDIdef.cc(\slider_6, {
		arg val;
		~slider_6 = val.linlin(0, 127, -60.0, 0.0);

		{c[5].children[4].valueAction_(~slider_6)}.defer;
	}, 22);

	MIDIdef.cc(\slider_7, {
		arg val;
		~slider_7 = val.linlin(0, 127, -60.0, 0.0);

		{c[5].children[5].valueAction_(~slider_7)}.defer;
	}, 23);

	MIDIdef.cc(\slider_8, {
		arg val;
		~slider_8 = val.linlin(0, 127, -60.0, 0.0);

		{c[5].children[6].valueAction_(~slider_8)}.defer;
	}, 24);

	MIDIdef.cc(\slider_9, {
		arg val;
		~slider_9 = val.linlin(0, 127, -60.0, 0.0);

		{c[5].children[7].valueAction_(~slider_9)}.defer;
	}, 25);