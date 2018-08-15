
(
/*
String Quartet #1 (Metal & Feedback)
for String Quartet, Objects, Metal Sheets, and Computer
Hunter Brown
©2018

Last Updated: 05/17/18
1. Go to the Supercollider Menu and select Language->Evaluate File.
2. Wait for Script to Run
3. Once the program is finished booting -> Indicated by a "done" message in SuperCollider's Post Window -> Press the button labeled "Initialization." The string microphones and the "Dry String Sound" modules are activated. You can now test the dry string sounds.
4. Once you are ready to start the piece, press the "Cue" button to actuate the first rehearsal cue.
5. To Stop and Restart from any rehearsal cue -> Press "Stop & Reset" -> Press "Initialization" -> Select the rehearsal cue from which you wish to begin from the "Rehearsal Cues" Module -> Press "Cue" to actuate this rehearsal cue. -> Repeat as needed for rehearsal.
6. If for any reason the comptuer part crashes or glitches -> Go to the Supercollider Menu and select Server -> Kill All Servers -> Then Repeat Steps 1 through 4.

For more information, feel free to contact Hunter at hunterbrownmusic1@gmail.com
*/

//DO NOT ALTER ANY CODE BELOW THIS LINE////////////////////////////////////////////
//1. server config
s = Server.local;
s.newBusAllocators;
s.latency = 0.05;
ServerBoot.removeAll;
ServerTree.removeAll;
ServerQuit.removeAll;
Server.local.options.numOutputBusChannels = 8;    // change number of input and output channels
Server.local.options.numInputBusChannels = 6;
o=s.options;
o.memSize;
o.memSize = 2.pow(20);

s.meter;



//2. initialize global variables

~violin_1_in = 0;
~violin_2_in = 1;
~viola_in = 2;
~cello_in = 3;
~contact_mic_1_in = 4;
~contact_mic_2_in = 5;
~playback_out_1 = 0;
~playback_out_1 = 1;
~violin_1_out = 2;
~violin_2_out = 3;
~viola_out = 2;
~cello_out = 3;
~sheet_1_out = 4;
~sheet_2_out = 5;
~sub_out = 6;
~cue=0;
~glitch_stream_val = (-60);
~metal_stream_val = (-60);
~path = PathName(thisProcess.nowExecutingPath).parentPath++"buffers/";

//array declarations
~loss_array_4 = [ 0.96937382221222, 0.91289458274841, 0.99191476106644, 0.91026605367661, 0.90576647520065, 0.99007558822632, 0.94136657714844, 0.93109358549118, 0.90023225545883, 0.94878914356232, 0.92661600112915, 0.90381262302399, 0.91930780410767, 0.98759672641754, 0.99823919534683, 0.90153430700302, 0.90901844501495, 0.98888024091721, 0.91770838499069, 0.91542693376541 ];

~k_array_4 = [ 0.62583023309708, 0.57680070400238, 0.61150801181793, 0.77539193630219, 0.5752272605896, 0.89458668231964, 0.85569059848785, 0.89869546890259, 0.91691899299622, 0.79359477758408, 0.5292267203331, 0.6141260266304, 0.77743601799011, 0.54070752859116, 0.93347007036209, 0.93681252002716, 0.74986231327057, 0.9383310675621, 0.51878887414932, 0.63977336883545 ];

~delay_array_4 = [ 2.7145621180534, 1.9064935445786, 2.4650973677635, 3.1964515447617, 3.5313526988029, 0.78147530555725, 2.0603482723236, 3.4464999437332, 2.4604029655457, 3.7217353582382, 4.1939774155617, 3.9213061928749, 2.3554116487503, 3.7390956878662, 3.0506348609924, 2.8083686232567, 2.2089877128601, 3.6260652542114, 0.60400480031967, 3.8209894299507 ];

~loss_array_2 = [ 0.88846607923508, 0.89497729659081, 0.91504351019859, 0.97662096858025, 0.7997052693367, 0.73095183372498, 0.74413101196289, 0.83062840938568, 0.89918537974358, 0.89451449871063, 0.79217608332634, 0.95447370290756, 0.96757931470871, 0.84599314689636, 0.84554846405983, 0.72871085762978, 0.86892776012421, 0.89301938533783, 0.84835380673409, 0.70607749342918 ];

~k_array_2 = [ -0.3493275642395, 0.73945879936218, -0.10326457023621, 0.37189245223999, -0.94646334648132, 0.3930127620697, 0.90994548797607, -0.018390655517578, -0.042299747467041, 0.6820695400238, 0.22649574279785, 0.29764199256897, 0.52482175827026, -0.55906748771667, -0.52403426170349, -0.71353077888489, 0.30567336082458, -0.02752685546875, 0.43248820304871, -0.39289855957031 ];

~delay_array_2 =[ 1.2662182807922, 1.5786935329437, 1.2228981137276, 1.4679606437683, 0.83952366113663, 1.0320998907089, 1.8452694892883, 0.28613712787628, 0.15735033750534, 0.36904364824295 ];

~loss_array_1 = [ 0.86300566196442, 0.9006884098053, 0.73586266994476, 0.70479958772659, 0.84510585546494, 0.9327539730072, 0.85933124661446, 0.9850003862381, 0.85386333823204, 0.73268137097359, 0.74105477333069, 0.76328808546066, 0.97366876959801, 0.9568004488945, 0.85295236587524, 0.96138642430305, 0.92887780308723, 0.97570353150368, 0.76670729994774, 0.89559676885605 ];

~k_array_1 =[ 0.090422868728638, 0.82238602638245, -0.19784092903137, -0.48564672470093, -0.6104724407196, -0.64070558547974, 0.16852831840515, 0.9234414100647, 0.98905539512634, -0.5163722038269, -0.43314623832703, -0.075802803039551, 0.99932408332825, -0.75438594818115, -0.21860408782959, 0.52157187461853, -0.68718886375427, 0.037850618362427, -0.18243288993835, -0.71425437927246 ];

~delay_array_1 =[ 0.95874106884003, 0.96687897086143, 0.42726783633232, 0.66447532534599, 0.88164398789406, 0.30504355669022, 0.47603031754494, 0.29418152689934, 0.89146107554436, 0.5202636551857 ];

~loss_array_5 = [ 0.94796103239059, 0.9715970993042, 0.99131410121918, 0.9915856719017, 0.92466795444489, 0.91547116041183, 0.92809317111969, 0.98827686309814, 0.90775154829025, 0.91953439712524, 0.91088267564774, 0.97762252092361, 0.94142746925354, 0.9707840681076, 0.90384420156479, 0.94991869926453, 0.9073691368103, 0.99461797475815, 0.95837063789368, 0.95063555240631 ];

~k_array_5 = [ 0.62306326627731, 0.878153860569, 0.6239817738533, 0.89767473936081, 0.81593638658524, 0.56188523769379, 0.91800200939178, 0.57772725820541, 0.6437224149704, 0.97677093744278, 0.85185319185257, 0.86890923976898, 0.60142034292221, 0.8953070640564, 0.60674947500229, 0.94193422794342, 0.99989795684814, 0.96357405185699, 0.84301656484604, 0.68656796216965 ];

~delay_array_5 = [ 3.4560142755508, 3.7708793282509, 4.2416788935661, 1.2757264971733, 0.88915419578552, 1.2988423109055, 4.077366232872, 3.4070140719414, 1.4002786278725, 2.3254529833794, 3.5504081845284, 2.9800890088081, 1.9242572784424, 4.453999876976, 0.6595174074173, 3.1522857546806, 4.7113610506058, 2.964460849762, 2.4710829854012, 4.6767702102661 ];

~loss_array_6 = [ 0.84170231819153, 0.94297409057617, 0.85653557777405, 0.9596275806427, 0.9224214553833, 0.82305891513824, 0.97994046211243, 0.83652091026306, 0.80309219360352, 0.93469014167786, 0.92701959609985, 0.98909296989441, 0.98663191795349, 0.91383962631226, 0.81915123462677, 0.96901977062225, 0.94612686634064, 0.82331376075745, 0.90670688152313, 0.98065736293793 ];

~k_array_6 = [ 0.90479707717896, 0.92195267677307, 0.92996267080307, 0.92437303066254, 0.99244954586029, 0.94290665388107, 0.97665801048279, 0.96240893602371, 0.90467557907104, 0.90395483970642, 0.95048950910568, 0.91864706277847, 0.94882205724716, 0.9729239821434, 0.90734416246414, 0.95884075164795, 0.91900454759598, 0.91219396591187, 0.99262874126434, 0.90931832790375 ];

~delay_array_6 = [ 0.022421363592148, 0.020732258558273, 0.063973298072815, 0.048794677257538, 0.014339470863342, 0.041041913032532, 0.061983206272125, 0.019500019550323, 0.059908345937729, 0.073623296022415, 0.091670110225677, 0.025563979148865, 0.07596363067627, 0.028674504756927, 0.088992739915848, 0.060037682056427, 0.067005438804626, 0.070808854103088, 0.076022703647614, 0.022791004180908 ];

~loss_array_7 = [ 0.85484352111816, 0.86867983341217, 0.80986189842224, 0.8138797044754, 0.8083705663681, 0.99507155418396, 0.81039311885834, 0.9411509513855, 0.85548119544983, 0.93178989887238, 0.8976989030838, 0.85792555809021, 0.89856770038605, 0.88852677345276, 0.83537001609802, 0.86254754066467, 0.88079137802124, 0.84289655685425, 0.89623880386353, 0.90620696544647 ];

~k_array_7 = [ 0.91040909290314, 0.99274717569351, 0.94739081859589, 0.9883987903595, 0.99209419488907, 0.92980036735535, 0.94370967149734, 0.92101655006409, 0.91576026678085, 0.93679882287979, 0.91255408525467, 0.99419524669647, 0.97085974216461, 0.9479118347168, 0.92195718288422, 0.92627515792847, 0.92815617322922, 0.97180465459824, 0.95097804069519, 0.92028032541275 ];

~delay_array_7 = [ 0.001, 0.101, 0.102, 0.203, 0.305, 0.508, 0.813, 1.321, 2.134, 3.455, 5.589, 9.044, 14.633, 23.677, 38.31, 61.987, 100.297, 162.284, 262.581, 424.865 ];

~loss_array_8 = [ 0.99502861499786, 0.84700436592102, 0.83048324584961, 0.83189072608948, 0.83996946811676, 0.96390874385834, 0.87452392578125, 0.81543650627136, 0.97804133892059, 0.97240886688232, 0.90397193431854, 0.95339550971985, 0.93424141407013, 0.82383887767792, 0.95078732967377, 0.85752923488617, 0.89842047691345, 0.98920197486877, 0.96293725967407, 0.98039858341217 ];

~k_array_8 = [ 0.26302938461304, 0.062321043014526, 0.78069214820862, 0.078706979751587, 0.14471707344055, 0.36220688819885, 0.41623287200928, 0.37874360084534, 0.89775762557983, -0.090945529937744, 0.20123901367187, 0.22376327514648, 0.44908156394958, 0.16149024963379, 0.96081342697144, -0.1877601146698, 0.27600083351135, 0.13265328407288, 0.5972806930542, 0.64260802268982 ];

~delay_array_8 = [ 1.0181214809418, 2.7409237623215, 1.0747682213783, 1.705560696125, 4.1735540986061, 2.7783270716667, 1.0136681079865, 4.9879307985306, 2.3500000953674, 4.6823864221573 ];


~loss_array_9 = [ 0.56068764980094, 0.60439366399134, 0.66472447167464, 0.82250236014891, 0.79978428353231, 0.72585711235279, 0.6988353709268, 0.66954183770335, 0.63046902544878, 0.51045853598424, 0.62348276021568, 0.85210867046143, 0.61875742898953, 0.64855329516243, 0.7241574035892, 0.62394540904437, 0.62004164419509, 0.69613463280103, 0.94979879328967, 0.50840178942471 ];

~k_array_9 = [ 0.35961736480519, 0.54185684115395, 0.81036857448557, 0.27669474813296, 0.18552699700506, 0.12856696022539, 0.70887165609089, 0.80620744226355, 0.85287797897581, 0.35484526774553, 0.1246124788601, 0.13857900964892, 0.13798746691318, 0.69125050755873, 0.25106484425693, 0.1031817964071, 0.11585387464291, 0.13871113375347, 0.14480700616067, 0.12431167259924 ];

~delay_array_9 = [ 4.8263739466667, 1.1166459321976, 1.2549808740616, 3.2197787642479, 3.8403601408005, 0.66730620861053, 0.45339068174362, 1.6672969698906, 1.705451464653, 0.30714025497437 ];

//3. Make Buffers
~makeBuffers = {
b = Dictionary.new;
PathName(~path).entries.do{
	arg subfolder;
	b.add(
		subfolder.folderName.asSymbol ->
		Array.fill(
			subfolder.entries.size,
			{
				arg i;
					Buffer.read(s, subfolder.entries[i].fullPath);
				}
			)
		);
	};

m = Dictionary.new;
PathName(~path).entries.do{
	arg subfolder;
	m.add(
		subfolder.folderName.asSymbol ->
		Array.fill(
			subfolder.entries.size,
			{
				arg i;
					Buffer.readChannel(s, subfolder.entries[i].fullPath, channels: 0);
				}
			)
		);
	};

};


//4. Make Nodes
~makeNodes = {
	~samples = Group.new;
	~patterns = Group.after(~samples);
	~input = Group.after(~patterns);
	~fx = Group.after(~input);
	~sheets = Group.after(~fx);

};

//4. Make MIDI
~makeMIDI = {

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
};

//5. Make Events/MIDI
~makeEvents = {

	MIDIClient.init(4, 4, verbose: true);

	MIDIIn.connectAll;

	e = Dictionary.new;

	//SynthDef init
	e.add(\init -> {


	~violin_1 = Synth(\violin_1, [\atk, 0.005, \rel, 20, \amp, -60], target: ~input).register;

	~violin_2 = Synth(\violin_2, [\atk, 0.005, \rel, 20, \amp, -60], target: ~input).register;

	~viola = Synth(\viola, [\atk, 0.005, \rel, 20, \amp, -60] ,target: ~input).register;

    ~cello = Synth(\cello, [\atk, 0.005, \rel, 20], target: ~input).register;

		s.plotTree;

});

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

	e.add(\0 -> {

	"cue 0".postln;
	c[1].children[0].value_(1);//On

		Routine({

	~delay = Synth(\delay,[\amp, ~delay_numBox.value, \input_bus, ~violin_1_fx_send, \atk, 30, \dec, 0.1, \sus, 1, \rel, 30, \gate, 1, \out, ~violin_1_out], target: ~fx).register;

	 70 .wait;

			~delay.set(\gate, 0);

		}).play(AppClock);

	});

	e.add(\1 -> {
	c[1].children[0].value_(0);//Off
	c[1].children[1].value_(1);//On


	~contact_mic_1 = Synth(\feedback_1, [\atk, 17 , \rel, 20, \amp, ~contact_mic_1_numBox.value, \input_bus_left, ~contact_mic_1_in,  \input_bus_right, ~contact_mic_2_in, \freq, ~contact_mic_1_freq_numBox.value, \gate, 1, \out_left, ~sheet_1_out, \out_right, ~sheet_2_out ], target: ~input).register;


	~delay = Synth(\delay,[\amp, ~delay_numBox.value, \input_bus, ~violin_2_fx_send, \atk, 5, \dec, 0.1, \sus, 1, \rel, 15, \gate, 1, \out, ~violin_2_out], target: ~fx).register;


});

	e.add(\2 -> {

	"cue 1".postln;
	c[1].children[1].value_(0);//Off
	c[1].children[2].value_(1);//On
	~contact_mic_1.set(\gate, 0);
	~delay.set(\gate, 0);

});

	e.add(\3 -> {

	"cue 2".postln;
	c[1].children[2].value_(0);//Off
	c[1].children[3].value_(1);//On

	~glitch_stream = Pdef(
	\glitch1,
	Pbind(
		\instrument, \pattern_buf,
		\dur, Pif(Ptime(inf) < 50.0, Pwhite(Pseg(Pseq([2.0, 0.01], inf), Pseq([50.0, 50.0], inf), \linear), Pseg(Pseq([3.0, 0.2], inf), Pseq([50.0, 50.0], inf), \linear)), Pexprand(0.01, 0.2),inf),
		\atk, Pexprand(0.02,0.08),
		\rel, Pif(Ptime(inf) < 50.0, Pwhite(Pseg(Pseq([0.05, 0.5], inf), Pseq([50.0, 50.0], inf), \linear), Pseg(Pseq([0.2, 3], inf), Pseq([50.0, 50.0], inf), \linear)), Pexprand(0.5, 3),inf),

		\buf, Prand(m[\no_input_glitch][(0..12)], inf),
		\rate, Pexprand(0.2, 3.0),
		\spos, Pwhite(0, 10000),
		\amp, Pfunc({~glitch_stream_val}),
		\pan_pos, Pwhite(-1.0, 1.0),
		\low_pass_mix, 1,
		\low_pass_freq, 5000,
		\high_pass_mix, 1,
		\high_pass_freq, 30,
		\out, 0,
		\group, ~patterns,
		);
		).play(TempoClock(1));

});



	e.add(\4 -> {

	"cue 3".postln;
	c[1].children[3].value_(0);//Off
	c[1].children[4].value_(1);//On

	~ringmod_cello = Synth(\ringmod, [\amp, ~ringmod_cello_numBox.value, \out, ~cello_out, \in_bus, ~cello_fx_send, \low_pass_mix, 1, \high_pass_mix, 1, \high_pass_freq, 450, \low_pass_freq, 6000, \gate, 1, \buf, b[\no_input_noise][11], \rate_low, 1, \rate_high, 1, \atk, 2, \dec, 0.1, \sus, 1, \rel, 16, \mul, 4], target: ~fx).register;


	~ringmod_viola = Synth(\ringmod, [\amp, ~ringmod_viola_numBox.value, \out, ~viola_out, \in_bus, ~viola_fx_send, \low_pass_mix, 1, \high_pass_mix, 1, \high_pass_freq, 100, \low_pass_freq, 4000, \gate, 1, \buf, b[\cringle][0], \rate_low, 0.01, \rate_high, 1.0, \atk, 10, \dec, 0.1, \sus, 1, \rel, 10, \mul, 4], target: ~fx).register;



	~violin_2_glitch = Synth(\grain_delay, [\amp, ~violin_2_glitch_numBox.value, \in_bus, ~violin_2_fx_send, \grain_trig_low, 1, \grain_trig_high, 10, \grain_dev, 1, \grain_size_low, 0.01, \grain_size_high, 0.05, \trig_fft_low, 5, \trig_fft_high, 20, \fft_dev, 1, \trig_freeze_low, 2, \trig_freeze_high, 20, \freeze_dev, 1, \trig_freq_low, 5, \trig_freq_high, 50, \atk, 3, \dec, 0.1, \sus, 1, \rel, 16, \gate, 1, \out, ~violin_2_out], target: ~fx).register;



	~violin_1_glitch = Synth(\grain_delay, [\amp, ~violin_1_glitch_numBox.value, \in_bus, ~violin_1_fx_send, \grain_trig_low, 1, \grain_trig_high, 10, \grain_dev, 1, \grain_size_low, 0.01, \grain_size_high, 0.05, \trig_fft_low, 5, \trig_fft_high, 20, \fft_dev, 1, \trig_freeze_low, 2, \trig_freeze_high, 20, \freeze_dev, 1, \trig_freq_low, 5, \trig_freq_high, 50, \atk, 8, \dec, 0.1, \sus, 1, \rel, 16, \gate, 1, \out, ~violin_1_out], target: ~fx).register;

			~glitch_stream = Pdef(
	\glitch1,
	Pbind(
		\instrument, \pattern_buf,
		\dur, Pif(Ptime(inf) < 50.0, Pwhite(Pseg(Pseq([2.0, 0.01], inf), Pseq([50.0, 50.0], inf), \linear), Pseg(Pseq([3.0, 0.2], inf), Pseq([50.0, 50.0], inf), \linear)), Pexprand(0.01, 0.2),inf),
		\atk, Pexprand(0.02,0.08),
		\rel, Pif(Ptime(inf) < 50.0, Pwhite(Pseg(Pseq([0.05, 0.5], inf), Pseq([50.0, 50.0], inf), \linear), Pseg(Pseq([0.2, 3], inf), Pseq([50.0, 50.0], inf), \linear)), Pexprand(0.5, 3),inf),

		\buf, Prand(m[\no_input_glitch][(0..12)], inf),
		\rate, Pexprand(0.2, 3.0),
		\spos, Pwhite(0, 10000),
		\amp, Pfunc({~glitch_stream_val}),
		\pan_pos, Pwhite(-1.0, 1.0),
		\low_pass_mix, 1,
		\low_pass_freq, 8000,
		\high_pass_mix, 1,
		\high_pass_freq, 30,
		\out, 0,
		\group, ~patterns,
		);
		).play(TempoClock(1));

});

	e.add(\5 -> {

	"cue 4".postln;
	c[1].children[4].value_(0);//Off
	c[1].children[5].value_(1);//On
	~ringmod_cello.set(\gate, 0);
	~ringmod_viola.set(\gate, 0);
	~violin_2_glitch.set(\gate, 0);
	~violin_1_glitch.set(\gate, 0);

    ~glitch_stream = Pdef(
	\glitch1,
	Pbind(
		\instrument, \pattern_buf,
		\dur, Pseries(0.01, 0.1, 20),
		\atk, Pexprand(0.02,0.08),
		\rel, Pseries(5, -0.1, 20),
		\buf, Prand(m[\no_input_glitch][(0..12)], inf),
		\rate, Pexprand(0.2, 3.0),
		\spos, Pwhite(0, 10000),
		\amp, Pseries(~glitch_stream_val, (-1), 30),
		\pan_pos, Pwhite(-1.0, 1.0),
		\low_pass_mix, 1,
		\low_pass_freq, 13000,
		\high_pass_mix, 1,
		\high_pass_freq, 30,
		\out, 0,
		\group, ~patterns,
		);
		).play(TempoClock(1));

		~contact_mic_1 = Synth(\feedback_1, [\atk, 8 , \rel, 16, \amp, ~contact_mic_1_numBox.value, \input_bus_left, ~contact_mic_1_in,  \input_bus_right, ~contact_mic_2_in, \freq, ~contact_mic_1_freq_numBox.value, \gate, 1, \out_left, ~sheet_1_out, \out_right, ~sheet_2_out], target: ~input).register;


});


	e.add(\6 -> {

	c[1].children[5].value_(0);//Off
	c[1].children[6].value_(1);//On

	~contact_mic_1.set(\gate, 0);



	//alter processes
	~ringmod_cello = Synth(\ringmod, [\amp, ~ringmod_cello_numBox.value, \out,~cello_out, \in_bus, ~cello_fx_send, \low_pass_mix, 1, \high_pass_mix, 1, \high_pass_freq, 450, \low_pass_freq, 6000, \gate, 1, \buf, b[\no_input_noise][11], \rate_low, 1, \rate_high, 1, \atk, 2, \dec, 0.1, \sus, 1, \rel, 0.005, \mul, 4], target: ~fx).register;


	~ringmod_viola = Synth(\ringmod, [\amp, ~ringmod_viola_numBox.value, \out, ~viola_out, \in_bus, ~viola_fx_send, \low_pass_mix, 1, \high_pass_mix, 1, \high_pass_freq, 100, \low_pass_freq, 4000, \gate, 1, \buf, b[\cringle][0], \rate_low, 0.01, \rate_high, 1.0, \atk, 10, \dec, 0.1, \sus, 1, \rel, 0.005, \mul, 4], target: ~fx).register;


	~violin_2_glitch = Synth(\grain_delay, [\amp, ~violin_2_glitch_numBox.value, \in_bus, ~violin_2_fx_send, \grain_trig_low, 1, \grain_trig_high, 10, \grain_dev, 1, \grain_size_low, 0.01, \grain_size_high, 0.05, \trig_fft_low, 5, \trig_fft_high, 20, \fft_dev, 1, \trig_freeze_low, 2, \trig_freeze_high, 20, \freeze_dev, 1, \trig_freq_low, 5, \trig_freq_high, 50, \atk, 3, \dec, 0.1, \sus, 1, \rel, 0.005, \gate, 1, \out, ~violin_2_out], target: ~fx).register;


	~violin_1_glitch = Synth(\grain_delay, [\amp, ~violin_1_glitch_numBox.value, \in_bus, ~violin_1_fx_send, \grain_trig_low, 1, \grain_trig_high, 10, \grain_dev, 1, \grain_size_low, 0.01, \grain_size_high, 0.05, \trig_fft_low, 5, \trig_fft_high, 20, \fft_dev, 1, \trig_freeze_low, 2, \trig_freeze_high, 20, \freeze_dev, 1, \trig_freq_low, 5, \trig_freq_high, 50, \atk, 8, \dec, 0.1, \sus, 1, \rel, 0.005, \gate, 1, \out, ~violin_1_out], target: ~fx).register;



});


	e.add(\7 -> {

    c[1].children[6].value_(0);//Off
	c[1].children[7].value_(1);//On


	~glitch_stream = Pdef(
	\glitch1,
	Pbind(
		\instrument, \pattern_buf,
		\dur, Pif(Ptime(inf) < 50.0, Pwhite(Pseg(Pseq([2.0, 0.01], inf), Pseq([50.0, 50.0], inf), \linear), Pseg(Pseq([3.0, 0.2], inf), Pseq([50.0, 50.0], inf), \linear)), Pexprand(0.01, 0.2),inf),
		\atk, Pexprand(0.02,0.08),
		\rel, Pif(Ptime(inf) < 50.0, Pwhite(Pseg(Pseq([0.05, 0.5], inf), Pseq([50.0, 50.0], inf), \linear), Pseg(Pseq([0.2, 3], inf), Pseq([50.0, 50.0], inf), \linear)), Pexprand(0.5, 3),inf),

		\buf, Prand(m[\no_input_glitch][(0..12)]++m[\no_input_rhythm][(0..3)]++m[\no_input_noise][(0..12)], inf),
		\rate, Pexprand(0.2, 3.0),
		\spos, Pwhite(0, 10000),
		\amp, Pfunc({~glitch_stream_val}),
		\pan_pos, Pwhite(-1.0, 1.0),
		\low_pass_mix, 1,
		\low_pass_freq, Pif(Ptime(inf) < 50.0, Pwhite(Pseg(Pseq([3000, 15000], inf), Pseq([50.0, 50.0], inf), \linear), Pseg(Pseq([4000, 15000], inf), Pseq([50.0, 50.0], inf), \linear)), 15000 ,inf),
		\high_pass_mix, 1,
		\high_pass_freq, 30,
		\out, 0,
		\group, ~patterns,
		);
		).play(TempoClock(1));
});

	e.add(\8 -> {

	c[1].children[7].value_(0);//Off
	c[1].children[8].value_(1);//On

	~noise_1 = Synth(\playbuf, [\bufnum, b[\no_input_stable_drone][3], \loop, 1, \gate, 1,
	\low_pass_freq, 300, \low_pass_mix, 1, \high_pass_mix, 0, \atk, 25 , \rel, 0.005, \amp, ~noise_1_numBox.value, \curve, -2], target: ~samples).register;

   ~grit_noise_1 = Synth(\playbuf, [\bufnum, b[\no_input_unstable_drone][5], \loop, 1, \gate, 1,
	\high_pass_freq, 100, \low_pass_mix, 0, \high_pass_mix, 1, \atk, 25, \rel, 0.005, \amp, ~noise_1_numBox.value, \curve, -2], target: ~samples).register;


});

	e.add(\9 -> {

	c[1].children[8].value_(0);//Off
	c[1].children[9].value_(1);//On

	~contact_mic_1 = Synth(\feedback_1, [\atk, 20, \rel, 0.05, \dec, 0.1, \sus, 1,  \amp, ~contact_mic_1_numBox.value, \input_bus_left, ~contact_mic_1_in,  \input_bus_right, ~contact_mic_2_in, \freq, ~contact_mic_1_freq_numBox.value, \gate, 1, \out_left, ~sheet_1_out, \out_right, ~sheet_2_out], target: ~input).register;


	~noise_2 = Synth(\playbuf, [\bufnum, b[\no_input_high][2], \loop, 1, \gate, 1,
	\high_pass_freq, 500, \low_pass_mix, 0, \high_pass_mix, 1, \amp, ~noise_2_numBox.value, \atk, 0.005, \rel, 10]).register;

	Routine({

	~violin_1_glitch.set(\gate, 0);
	~violin_2_glitch.set(\gate, 0);
	~ringmod_cello.set(\gate, 0);
	~ringmod_viola.set(\gate, 0);
	~noise_1.set(\gate, 0);
	~grit_noise_1.set(\gate, 0);
	~glitch_stream.stop;

	s.sync;

	~patterns.free;

    s.sync;

    ~patterns = Group.before(~input);

		}).play(AppClock);

});

	e.add(\10 -> {

	c[1].children[9].value_(0);//Off
	c[1].children[10].value_(1);//On


	~noise_1 = Synth(\playbuf, [\bufnum, b[\no_input_stable_drone][3], \loop, 1, \gate, 1,
	\low_pass_freq, 300, \low_pass_mix, 1, \high_pass_mix, 0, \atk, 0.005 , \rel, 60, \amp, ~noise_1_numBox.value, \dec, 0.1, \sus, 1], target: ~samples).register;

   ~grit_noise_1 = Synth(\playbuf, [\bufnum, b[\no_input_unstable_drone][5], \loop, 1, \gate, 1,
	\high_pass_freq, 100, \low_pass_mix, 0, \high_pass_mix, 1, \atk, 0.005, \rel, 60, \amp, ~noise_1_numBox.value, \dec, 0.1, \sus, 1], target: ~samples).register;

		//alter processes
	~ringmod_cello = Synth(\ringmod, [\amp, ~ringmod_cello_numBox.value, \out, ~cello_out, \in_bus, ~cello_fx_send, \low_pass_mix, 1, \high_pass_mix, 1, \high_pass_freq, 450, \low_pass_freq, 6000, \gate, 1, \buf, b[\no_input_noise][11], \rate_low, 1, \rate_high, 1, \atk, 0.005, \dec, 0.1, \sus, 1, \rel, 6, \mul, 4], target: ~fx).register;

	~ringmod_viola = Synth(\ringmod, [\amp, ~ringmod_viola_numBox.value, \out, ~viola_out, \in_bus, ~viola_fx_send, \low_pass_mix, 1, \high_pass_mix, 1, \high_pass_freq, 100, \low_pass_freq, 4000, \gate, 1, \buf, b[\cringle][0], \rate_low, 0.01, \rate_high, 1.0, \atk, 0.005, \dec, 0.1, \sus, 1, \rel, 20, \mul, 4], target: ~fx).register;

	~violin_2_glitch = Synth(\grain_delay, [\amp, ~violin_2_glitch_numBox.value, \in_bus, ~violin_2_fx_send, \grain_trig_low, 1, \grain_trig_high, 10, \grain_dev, 1, \grain_size_low, 0.01, \grain_size_high, 0.05, \trig_fft_low, 5, \trig_fft_high, 20, \fft_dev, 1, \trig_freeze_low, 2, \trig_freeze_high, 20, \freeze_dev, 1, \trig_freq_low, 5, \trig_freq_high, 50, \atk, 0.005, \dec, 0.1, \sus, 1, \rel, 20, \gate, 1, \out, ~violin_2_out], target: ~fx).register;

	~violin_1_glitch = Synth(\grain_delay, [\amp, ~violin_1_glitch_numBox.value, \in_bus, ~violin_1_fx_send, \grain_trig_low, 1, \grain_trig_high, 10, \grain_dev, 1, \grain_size_low, 0.01, \grain_size_high, 0.05, \trig_fft_low, 5, \trig_fft_high, 20, \fft_dev, 1, \trig_freeze_low, 2, \trig_freeze_high, 20, \freeze_dev, 1, \trig_freq_low, 5, \trig_freq_high, 50, \atk, 0.005, \dec, 0.1, \sus, 1, \rel, 20, \gate, 1, \out, ~violin_1_out], target: ~fx).register;
});

	e.add(\11 -> {

	c[1].children[10].value_(0);//Off
	c[1].children[11].value_(1);//On

	~noise_1.set(\gate, 0);
	~grit_noise_1.set(\gate, 0);
	~noise_2.set(\gate, 0);

});

	e.add(\12 -> {

	c[1].children[11].value_(0);//Off
	c[1].children[12].value_(1);//On

	~ringmod_cello.set(\gate, 0);
	~ringmod_viola.set(\gate, 0);
	~violin_2_glitch.set(\gate, 0);
	~violin_1_glitch.set(\gate, 0);

});

	e.add(\13 -> {

	c[1].children[12].value_(0);//Off
	c[1].children[13].value_(1);//On


	~low_freq_rumble = Pdef(
	\metal2,
	Pbind(
		\instrument, \pattern_buf_rumble,
		\dur, Pwhite(1, 2),
		\atk, Pwhite(5, 3),
		\rel, Pwhite(10, 20),
		\buf, Prand(m[\superball][(0..6)], inf),
		\rate,  Prand([Pexprand(-0.05, -0.4), Pwhite(0.05, 0.4)], inf),
		\stretch,  1,
		\spos, Pwhite(0, 3000),
		\amp, Pfunc({~low_freq_val}),
		\loop, 1,
		\pan_pos, Pwhite(-1.0, 1.0),
		\low_pass_mix, 1,
		\low_pass_freq, 250,
		\high_pass_mix, 0,
		\high_pass_freq, 10,
		\out, 0,
		\out_sub, 6,
		\group, ~patterns,
		);
		).play(TempoClock(1));



});



	e.add(\14 -> {

	c[1].children[13].value_(0);//Off
	c[1].children[14].value_(1);//On




		// ntube?

		/*~delay = Synth(\ntube_4, [\amp, ~tube_delay_numBox.value, \mix_low, -1.0, \mix_high, -1.0, \input_bus, ~cello_fx_send, \atk, 30, \dec, 0.1, \sus, 1, \rel, 30, \gate, 1, \out, ~cello_out], target: ~fx).register;*/

		~delay = Synth(\delay,[\amp, ~delay_numBox.value, \input_bus, ~cello_fx_send, \atk, 30, \dec, 0.1, \sus, 1, \rel, 10, \gate, 1, \curve, (-10),  \out, ~cello_out], target: ~fx).register;


});

	e.add(\15 -> {

		c[1].children[14].value_(0);//Off
	    c[1].children[15].value_(1);//On

		~contact_mic_1.set(\gate, 0);

		~friction_violin_1 = Synth(\friction_fft_1_rms, [\amp, ~friction_numBox.value, \lpf_freq, 16000, \noise_speed, 1000, \input_bus, ~violin_1_fx_send, \atk, 15, \dec, 0.1, \sus, 1, \rel, 0.05, \gate, 1, \out, ~violin_1_out, \fft_mix, -1.0, \curve, -8], ~fx).register;



		~friction_violin_2 = Synth(\friction_fft_1_rms, [\amp, ~friction_numBox.value, \lpf_freq, 8000, \noise_speed, 5, \input_bus, ~violin_2_fx_send, \atk, 15, \dec, 0.1, \sus, 1, \rel, 0.05, \gate, 1, \out, ~violin_2_out, \fft_mix, -1.0], ~fx).register;

	    ~viola_ntube = Synth(\ntube_2, [\amp, ~tube_delay_numBox.value, \mix_low, -1.0, \mix_high, -1.0, \input_bus, ~viola_fx_send, \atk, 0.1, \dec, 0.1, \sus, 1, \rel, 10, \gate, 1, \out, ~viola_out], target: ~fx).register;

		~cello_ntube = Synth(\ntube_2, [\amp, ~tube_delay_numBox.value, \mix_low, -0.5, \mix_high, -1.0, \input_bus, ~cello_fx_send, \atk, 0.1, \dec, 0.1, \sus, 1, \rel, 10, \gate, 1, \out, ~cello_out], target: ~fx).register;

		~delay.set(\gate, 0);

	});

	e.add(\16 -> {
		c[1].children[15].value_(0);//Off
	    c[1].children[16].value_(1);//On
		~friction_violin_1.set(\fft_mix, 0.5, \noise_speed, 20);
		~friction_violin_2.set(\fft_mix, 0.0, \noise_speed, 100);
	});

	e.add(\17 -> {
		c[1].children[16].value_(0);//Off
	    c[1].children[17].value_(1);//On

		Routine({
		~viola_ntube.set(\gate, 0);
		~cello_ntube.set(\gate, 0);
	    ~friction_violin_2.set(\fft_mix, -1.0, \noise_speed, 10000);

		s.sync;

		~viola_ntube_1 = Synth(\ntube_1, [\amp, ~tube_delay_numBox.value, \mix_low, -0.5, \mix_high, -1.0, \input_bus, ~viola_fx_send, \atk, 0.1, \dec, 0.1, \sus, 1, \rel, 10, \gate, 1, \out, ~viola_out], target: ~fx).register;

		~cello_ntube_1 = Synth(\ntube_6, [\amp, ~tube_delay_numBox.value, \mix_low, -1.0, \mix_high, -1.0, \input_bus, ~cello_fx_send, \atk, 0.1, \dec, 0.1, \sus, 1, \rel, 10, \gate, 1, \out, ~cello_out], target: ~fx).register;

		}).play(AppClock);

	});

	e.add(\18 -> {
		c[1].children[17].value_(0);//Off
	    c[1].children[18].value_(1);//On

		// set to match parmeters below
		~friction_violin_1.set(\lpf_freq, 10000, \noise_speed, 20000, \fft_mix, -1.0);



		~metal_sheet_impulses = Synth(\metal_sheet_impulses_line, [\amp, ~metal_sheet_impulses_1_numBox.value, \atk, 0.5, \dec, 0.1, \sus, 1,  \rel,0.1, \curve, -4,  \gate, 1,\line_start, 0.01, \line_end, 20, \line_dur, 120, \out_left, ~sheet_1_out, \out_right, ~sheet_2_out], target: ~sheets).register;



	});

	e.add(\19 -> {
		c[1].children[18].value_(0);//Off
	    c[1].children[19].value_(1);//On

		Routine({
		~viola_ntube_1.set(\gate, 0);
		~cello_ntube_1.set(\gate, 0);


		1.wait;

		~viola_ntube = Synth(\ntube_2, [\amp, ~tube_delay_numBox.value, \mix_low, -1.0, \mix_high, -1.0, \input_bus, ~viola_fx_send, \atk, 5, \dec, 0.1, \sus, 1, \rel, 0.1, \gate, 1, \out, ~viola_out], target: ~fx).register;

		~cello_ntube = Synth(\ntube_2, [\amp, ~tube_delay_numBox.value, \mix_low, -0.5, \mix_high, -1.0, \input_bus, ~cello_fx_send, \atk, 5, \dec, 0.1, \sus, 1, \rel, 10, \gate, 1, \out, ~cello_out], target: ~fx).register;

		}).play(AppClock);
	});


	e.add(\20 -> {
		c[1].children[19].value_(0);//Off
	    c[1].children[20].value_(1);//On

		Routine({

		~viola_ntube.set(\gate, 0);
		~cello_ntube.set(\gate, 0);
		~friction_violin_1.set(\lpf_freq, 18000, \noise_speed, 2000, \fft_mix, -0.4);
        ~friction_violin_2.set(\lpf_freq, 7000, \noise_speed, 100, \fft_mix, -1.0);
		~glitch_loops= Pdef(
			\glitch1,
			Pbind(
				\instrument, \pattern_buf,
				\dur, Pwhite(8, 10),
				\atk, Pwhite(5, 10),
				\rel, Pwhite(5, 8),
				\c1, Pwhite(1, 8),
				\c2, Pwhite(-1, -8),
				\buf, Pwrand(m[\no_input_rhythm][(0..3)]++m[\no_input_gesture][(0..2)], [10, 10, 10, 10, 2, 2, 2].normalizeSum, inf),
				\rate, Prand([Pwhite(-0.5, -2.0), Pwhite(0.5, 2.0)], inf),
				\spos, Pwhite(0, 20000),
				\amp, Pfunc({~glitch_stream_val}),
				\pan_pos, Pwhite(-1.0, 1.0),
				\low_pass_mix, 1,
				\low_pass_freq, 1000,
				\high_pass_mix, 1,
				\high_pass_freq, 100,
				\out, 0,
				\group, ~patterns,
			);
		).play(TempoClock(1));

			s.sync;

		~viola_glitch = Synth(\grain_delay, [\amp, ~viola_glitch_numBox.value, \in_bus, ~viola_fx_send, \grain_trig_low, 1, \grain_trig_high, 10, \grain_dev, 1, \grain_size_low, 0.01, \grain_size_high, 0.05, \trig_fft_low, 5, \trig_fft_high, 20, \fft_dev, 1, \trig_freeze_low, 2, \trig_freeze_high, 20, \freeze_dev, 1, \trig_freq_low, 5, \trig_freq_high, 50, \atk, 3, \dec, 0.1, \sus, 1, \rel, 10, \gate, 1, \out, ~viola_out], target: ~fx).register;

		~cello_ntube_1 = Synth(\ntube_7, [\amp, ~tube_delay_numBox.value, \mix_low, -1.0, \mix_high, -1.0, \input_bus, ~cello_fx_send, \atk, 10, \dec, 0.1, \sus, 1, \rel, 10, \gate, 1, \out, ~cello_out], target: ~fx).register;


			8.wait;


		    ~viola_glitch.set(\gate, 0);

			~viola_ntube_1 = Synth(\ntube_4, [\amp, ~tube_delay_numBox.value, \mix_low, -0.5, \mix_high, -1.0, \input_bus, ~viola_fx_send, \atk, 0.1, \dec, 0.1, \sus, 1, \rel, 10, \gate, 1, \out, ~viola_out], target: ~fx).register;

		}).play(AppClock)

	});

	e.add(\21 -> {
		c[1].children[20].value_(0);//Off
	    c[1].children[21].value_(1);//On
		/*dsp here*/
		//update ~glitch_loops

	     ~friction_violin_1.set(\lpf_freq, 18000, \noise_speed, 2000, \fft_mix, 0.5);

		 ~friction_violin_2.set(\lpf_freq, 7000, \noise_speed, 500, \fft_mix, 0.0);

		~cello_glitch = Synth(\grain_delay, [\amp, ~cello_glitch_numBox.value, \in_bus, ~cello_fx_send, \grain_trig_low, 1, \grain_trig_high, 10, \grain_dev, 1, \grain_size_low, 0.01, \grain_size_high, 0.05, \trig_fft_low, 5, \trig_fft_high, 20, \fft_dev, 1, \trig_freeze_low, 2, \trig_freeze_high, 20, \freeze_dev, 1, \trig_freq_low, 5, \trig_freq_high, 50, \atk, 3, \dec, 0.1, \sus, 1, \rel, 0.05, \gate, 1, \out, ~cello_out], target: ~fx).register;

		//add amp control

		~glitch_loops= Pdef(
			\glitch1,
			Pbind(
				\instrument, \pattern_buf,
				\dur, Pwhite(7, 10),
				\atk, Pwhite(3, 10),
				\rel, Pwhite(6, 9),
				\c1, Pwhite(1, 8),
				\c2, Pwhite(-1, -8),
				\buf, Pwrand(m[\no_input_rhythm][(0..3)]++m[\no_input_gesture][(0..2)], [10, 10, 10, 10, 2, 2, 2].normalizeSum, inf),
				\rate, Prand([Pwhite(-0.5, -3.0), Pwhite(0.5, 3.0)], inf),
				\spos, Pwhite(0, 20000),
				\amp, Pfunc({~glitch_stream_val}),
				\pan_pos, Pwhite(-1.0, 1.0),
				\low_pass_mix, 1,
				\low_pass_freq, 2000,
				\high_pass_mix, 1,
				\high_pass_freq, 100,
				\out, 0,
				\group, ~patterns,
			);
		).play(TempoClock(1));
	});

	e.add(\22 -> {
		c[1].children[21].value_(0);//Off
	    c[1].children[22].value_(1);//On
		/*dsp here*/
		//update ~glitch_loops
		//viola

		~cello_glitch.set(\gate, 0);

		~viola_glitch = Synth(\grain_delay, [\amp, ~viola_glitch_numBox.value, \in_bus, ~viola_fx_send, \grain_trig_low, 1, \grain_trig_high, 10, \grain_dev, 1, \grain_size_low, 0.01, \grain_size_high, 0.05, \trig_fft_low, 5, \trig_fft_high, 20, \fft_dev, 1, \trig_freeze_low, 2, \trig_freeze_high, 20, \freeze_dev, 1, \trig_freq_low, 5, \trig_freq_high, 50, \atk, 0.05, \dec, 0.1, \sus, 1, \rel, 0.05, \gate, 1, \out, ~viola_out], target: ~fx).register;

		~glitch_loops= Pdef(
			\glitch1,
			Pbind(
				\instrument, \pattern_buf,
				\dur, Pwhite(6, 10),
				\atk, Pwhite(2, 10),
				\rel, Pwhite(6, 10),
				\c1, Pwhite(1, 6),
				\c2, Pwhite(-1, -6),
				\buf, Pwrand(m[\no_input_rhythm][(0..3)]++m[\no_input_gesture][(0..2)], [10, 10, 10, 10, 2, 2, 2].normalizeSum, inf),
				\rate, Prand([Pwhite(-0.5, -4.0), Pwhite(0.5, 4.0)], inf),
				\spos, Pwhite(0, 20000),
				\amp, Pfunc({~glitch_stream_val}),
				\pan_pos, Pwhite(-1.0, 1.0),
				\low_pass_mix, 1,
				\low_pass_freq, 3000,
				\high_pass_mix, 1,
				\high_pass_freq, 100,
				\out, 0,
				\group, ~patterns,
			);
		).play(TempoClock(1));

	});

	e.add(\23 -> {
		c[1].children[22].value_(0);//Off
	    c[1].children[23].value_(1);//On
		/*dsp here*/
		//update ~glitch_loops

		Routine({

		~viola_ntube_1.set(\gate, 0);
		~cello_ntube_1.set(\gate, 0);


	    ~friction_violin_1.set(\lpf_freq, 18000, \noise_speed, 600, \fft_mix, 1.0);

		~friction_violin_2.set(\lpf_freq, 17000, \noise_speed, 10000, \fft_mix, -1.0);

		~cello_glitch = Synth(\grain_delay, [\amp, ~cello_glitch_numBox.value, \in_bus, ~cello_fx_send, \grain_trig_low, 1, \grain_trig_high, 10, \grain_dev, 1, \grain_size_low, 0.01, \grain_size_high, 0.05, \trig_fft_low, 5, \trig_fft_high, 20, \fft_dev, 1, \trig_freeze_low, 2, \trig_freeze_high, 20, \freeze_dev, 1, \trig_freq_low, 5, \trig_freq_high, 50, \atk, 3, \dec, 0.1, \sus, 1, \rel, 0.05, \gate, 1, \out, ~cello_out], target: ~fx).register;


		//add amp control
		~glitch_loops= Pdef(
			\glitch1,
			Pbind(
				\instrument, \pattern_buf,
				\dur, Pwhite(5, 10),
				\atk, Pwhite(2, 10),
				\rel, Pwhite(6, 10),
				\c1, Pwhite(1, 5),
				\c2, Pwhite(-1, -5),
				\buf, Pwrand(m[\no_input_rhythm][(0..3)]++m[\no_input_gesture][(0..2)], [10, 10, 10, 10, 2, 2, 2].normalizeSum, inf),
				\rate, Prand([Pwhite(-0.4, -5.0), Pwhite(0.4, 5.0)], inf),
				\spos, Pwhite(0, 20000),
				\amp, Pfunc({~glitch_stream_val}),
				\pan_pos, Pwhite(-1.0, 1.0),
				\low_pass_mix, 1,
				\low_pass_freq, 5000,
				\high_pass_mix, 1,
				\high_pass_freq, 100,
				\out, 0,
				\group, ~patterns,
			);
		).play(TempoClock(1));



		~viola_glitch.set(\gate, 0);


     	~metal_stream = Pdef(
			\metal1,
			Pbind(
				\instrument, \pattern_buf,
				\dur,  Pif(Ptime(inf) < 50, Pwhite(Pseg(Pseq([2, 0.01], inf), Pseq([50, 50], inf), \linear), Pseg(Pseq([4.0, 0.1], inf), Pseq([50, 50], inf), \linear)), Pwhite(0.01, 0.1),inf),
				\atk, Pwhite(0.05, 0.01),
				\rel, Pif(Ptime(inf) < 50, Pwhite(0.1, Pseg(Pseq([0.5, 3], inf), Pseq([50, 50], inf), \linear)), Pwhite(0.1, 3),inf),
				\buf, Prand(m[\cringle][(0..0)]++m[\shake][(0..3)]++m[\struck][(0..2)], inf),
				\rate,  Prand([Pwhite(-0.01, Pif(Ptime(inf) < 50, Pseg(Pseq([-5, -2], inf), Pseq([50, 50], inf), \linear), -2)), Pwhite(0.01, Pif(Ptime(inf) < 50, Pseg(Pseq([10, 2], inf), Pseq([50, 50], inf), \linear), 2))], inf),
				\stretch,  1,
				\spos, Pwhite(0, 10000),
				\amp, Pfunc({~metal_stream_val}),
				\loop, 1,
				\pan_pos, Pwhite(-1.0, 1.0),
				\low_pass_mix, 0,
				\low_pass_freq, 13000,
				\high_pass_mix, 1,
				\high_pass_freq, 30,
				\out, 0,
				\group, ~patterns,
			);
		).play(TempoClock(1));




		s.sync;

		~viola_ntube = Synth(\ntube_7, [\amp, ~tube_delay_numBox.value, \mix_low, -1.0, \mix_high, -1.0, \input_bus, ~viola_fx_send, \atk, 10, \dec, 0.1, \sus, 1, \rel, 10, \gate, 1, \out, ~viola_out], target: ~fx).register;

		~cello_ntube = Synth(\ntube_8, [\amp, ~tube_delay_numBox.value, \mix_low, -1.0, \mix_high, -1.0, \input_bus, ~cello_fx_send, \atk, 10, \dec, 0.1, \sus, 1, \rel, 10, \gate, 1, \out, ~cello_out], target: ~fx).register;

		}).play(AppClock);



	});

	e.add(\24 -> {
		c[1].children[23].value_(0);//Off
	    c[1].children[24].value_(1);//On
		/*dsp here*/
		//update ~glitch_loops

	    ~friction_violin_1.set(\lpf_freq, 15000, \noise_speed, 100, \fft_mix, 0.8);

		~friction_violin_2.set(\lpf_freq, 15000, \noise_speed, 160, \fft_mix, 0.5);

		//add amp control
		~glitch_loops= Pdef(
			\glitch1,
			Pbind(
				\instrument, \pattern_buf,
				\dur, Pwhite(4, 8),
				\atk, Pwhite(1, 7),
				\rel, Pwhite(6, 13),
				\c1, Pwhite(1, 3),
				\c2, Pwhite(-1, -3),
				\buf, Pwrand(m[\no_input_rhythm][(0..3)]++m[\no_input_gesture][(0..2)], [10, 10, 10, 10, 2, 2, 2].normalizeSum, inf),
				\rate, Prand([Pwhite(-0.3, -6.0), Pwhite(0.3, 6.0)], inf),
				\spos, Pwhite(0, 20000),
				\amp, Pfunc({~glitch_stream_val}),
				\pan_pos, Pwhite(-1.0, 1.0),
				\low_pass_mix, 1,
				\low_pass_freq, 5000,
				\high_pass_mix, 1,
				\high_pass_freq, 100,
				\out, 0,
				\group, ~patterns,
			);
		).play(TempoClock(1));

		~cello_glitch.set(\gate, 0);

		~violin_1_glitch = Synth(\grain_delay, [\amp, ~violin_1_glitch_numBox.value, \in_bus, ~violin_1_fx_send, \grain_trig_low, 1, \grain_trig_high, 10, \grain_dev, 1, \grain_size_low, 0.01, \grain_size_high, 0.05, \trig_fft_low, 5, \trig_fft_high, 20, \fft_dev, 1, \trig_freeze_low, 2, \trig_freeze_high, 20, \freeze_dev, 1, \trig_freq_low, 5, \trig_freq_high, 50, \atk, 3, \dec, 0.1, \sus, 1, \rel, 0.05, \gate, 1, \out, ~violin_1_out], target: ~fx).register;

	});

	e.add(\25 -> {
		c[1].children[24].value_(0);//Off
	    c[1].children[25].value_(1);//On
		/*dsp here*/
		//update ~glitch_loops

		Routine({

		~friction_violin_1.set(\gate, 0);
		~friction_violin_2.set(\gate, 0);
		~viola_ntube.set(\gate, 0);
		~cello_ntube.set(\gate, 0);

		    //add amp control
			~glitch_loops= Pdef(
			\glitch1,
			Pbind(
				\instrument, \pattern_buf,
				\dur, Pwhite(3, 8),
				\atk, Pwhite(0.5, 6),
				\rel, Pwhite(10, 16),
				\c1, Pwhite(1, 3),
				\c2, Pwhite(-1, -3),
				\buf, Pwrand(m[\no_input_rhythm][(0..3)]++m[\no_input_gesture][(0..2)], [10, 10, 10, 10, 2, 2, 2].normalizeSum, inf),
				\rate, Prand([Pwhite(-0.2, -6.0), Pwhite(0.2, 6.0)], inf),
				\spos, Pwhite(0, 20000),
				\amp, Pfunc({~glitch_stream_val}),
				\pan_pos, Pwhite(-1.0, 1.0),
				\low_pass_mix, 1,
				\low_pass_freq, 6000,
				\high_pass_mix, 1,
				\high_pass_freq, 100,
				\out, 0,
				\group, ~patterns,
			);
		).play(TempoClock(1));

		s.sync;


		~violin_1_glitch.set(\gate, 0);

		~viola_glitch = Synth(\grain_delay, [\amp, ~viola_glitch_numBox.value, \in_bus, ~viola_fx_send, \grain_trig_low, 1, \grain_trig_high, 10, \grain_dev, 1, \grain_size_low, 0.01, \grain_size_high, 0.05, \trig_fft_low, 5, \trig_fft_high, 20, \fft_dev, 1, \trig_freeze_low, 2, \trig_freeze_high, 20, \freeze_dev, 1, \trig_freq_low, 5, \trig_freq_high, 50, \atk, 0.05, \dec, 0.1, \sus, 1, \rel, 5, \gate, 1, \out, ~viola_out], target: ~fx).register;

		~contact_mic_1 = Synth(\feedback_1, [\atk, 8 , \rel, 30, \amp, ~contact_mic_1_numBox.value, \input_bus_left, ~contact_mic_1_in,  \input_bus_right, ~contact_mic_2_in, \freq, ~contact_mic_1_freq_numBox.value, \gate, 1, \out_left, ~sheet_1_out, \out_right, ~sheet_2_out], target: ~input).register;

		~friction_violin_1 = Synth(\friction_fft_1_line, [\amp, ~friction_numBox.value, \lpf_freq, 18000, \noise_speed, 200, \line_start, (-1), \line_end, 1, \line_dur, 20, \input_bus, ~violin_1_fx_send, \fx_out, ~fft_fx_out_1, \atk, 0.05, \dec, 0.1, \sus, 1, \rel, 0.05, \gate, 1, \out, ~violin_1_out], target: ~fx).register;

		~friction_violin_2 = Synth(\friction_fft_1_line, [\amp, ~friction_numBox.value, \lpf_freq, 18000, \noise_speed, 100, \line_start, (-1), \line_end, 1, \line_dur, 20, \input_bus, ~violin_2_fx_send, \fx_out, ~fft_fx_out_1, \atk, 0.05, \dec, 0.1, \sus, 1, \rel, 0.05, \gate, 1, \out, ~violin_2_out], target: ~fx).register;

			s.sync;

		~viola_ntube_1 = Synth(\ntube_fft_1_line, [\amp, ~tube_delay_numBox.value, \mix_low, 1.0, \mix_high, -1.0, \input_bus, ~viola_fx_send, \atk, 10, \dec, 0.1, \sus, 1, \rel, 0.05, \gate, 1, \line_start, (-1), \line_end, 1, \line_dur, 20, \fx_out, ~fft_fx_out_3, \out, ~viola_out], target: ~fx).register;

		~cello_ntube_1 = Synth(\ntube_fft_1_line, [\amp, ~tube_delay_numBox.value, \mix_low, 1.0, \mix_high, -1.0, \input_bus, ~cello_fx_send, \atk, 10, \dec, 0.1, \sus, 1, \rel, 0.05, \gate, 1, \line_start, (-1), \line_end, 1, \line_dur, 20, \fx_out, ~fft_fx_out_4, \out, ~cello_out], target: ~fx).register;

		}).play(AppClock);


	});

	e.add(\26 -> {
		c[1].children[25].value_(0);//Off
	    c[1].children[26].value_(1);//On
		/*dsp here*/
		//update ~glitch_loops

			~glitch_loops= Pdef(
			\glitch1,
			Pbind(
				\instrument, \pattern_buf,
				\dur, Pwhite(0.5, 2),
				\atk, Pwhite(0.5, 6),
				\rel, Pwhite(20, 25),
				\c1, Pwhite(1, 9),
				\c2, Pwhite(-1, -9),
				\buf, Pwrand(m[\no_input_rhythm][(0..3)]++m[\no_input_gesture][(0..2)], [10, 10, 10, 10, 2, 2, 2].normalizeSum, inf),
				\rate, Prand([Pwhite(-0.1, -10.0), Pwhite(0.1, 10.0)], inf),
				\spos, Pwhite(0, 20000),
				\amp, Pfunc({~glitch_stream_val}),
				\pan_pos, Pwhite(-1.0, 1.0),
				\low_pass_mix, 1,
				\low_pass_freq, 12000,
				\high_pass_mix, 1,
				\high_pass_freq, 100,
				\out, 0,
				\group, ~patterns,
			);
		).play(TempoClock(1));

		~viola_glitch.set(\gate, 0);

		~reverb = Synth(\reverb, [\amp, ~reverb_numBox.value, \gate, 1, \atk, 12, \dec, 1, \sus, 1, \rel, 0.05, \input_bus, ~cello_fx_send, \out, ~cello_out], target: ~fx).register;

		~reverb_violin_1 = Synth(\reverb, [\amp, ~reverb_numBox.value, \gate, 1, \atk, 12, \dec, 1, \sus, 1, \rel, 0.05, \input_bus, ~violin_1_fx_send, \out, ~violin_1_out], target: ~fx).register;

		~reverb_violin_2 = Synth(\reverb, [\amp, ~reverb_numBox.value, \gate, 1, \atk, 12, \dec, 1, \sus, 1, \rel, 0.05, \input_bus, ~violin_2_fx_send, \out, ~violin_2_out], target: ~fx).register;

	    ~reverb_viola = Synth(\reverb, [\amp, ~reverb_numBox.value, \gate, 1, \atk, 12, \dec, 1, \sus, 1, \rel, 0.05, \input_bus, ~viola_fx_send, \out, ~viola_out], target: ~fx).register;


	});

	e.add(\27 -> {
		c[1].children[26].value_(0);//Off
	    c[1].children[27].value_(1);//On
		/*dsp here*/

		~sub = Synth(\sub, [\amp,  ~sub_numBox.value, \gate, 1, \out_bus, ~sub_out]).register;

		~low_freq_rumble.stop;

		~metal_sheet_impulses.set(\gate, 0);

		~contact_mic_1.set(\gate, 0);


			~glitch_loops= Pdef(
			\glitch1,
			Pbind(
				\instrument, \pattern_buf,
				\dur, Pwhite(Pif(Ptime(inf) < 10, Pseg(Pseq([0.5, 6], inf), Pseq([10, 10], inf), \linear), 6), Pif(Ptime(inf) < 10, Pseg(Pseq([2, 10], inf), Pseq([10, 10], inf), \linear), 10)),
				\atk, Pwhite(Pif(Ptime(inf) < 10, Pseg(Pseq([0.5, 3], inf), Pseq([10, 10], inf), \linear), 3), Pif(Ptime(inf) < 10, Pseg(Pseq([2, 8], inf), Pseq([10, 10], inf), \linear), 8)),
				\rel, Pwhite(Pif(Ptime(inf) < 10, Pseg(Pseq([20, 10], inf), Pseq([10, 10], inf), \linear), 10), Pif(Ptime(inf) < 10, Pseg(Pseq([25, 40], inf), Pseq([10, 10], inf), \linear), 40)),
				\c1, 8,
				\c2, Pwhite(-4, -8),
				\buf, Pif(Ptime(inf) < 20, Pwrand(m[\no_input_rhythm][(0..3)]++m[\no_input_gesture][(0..2)], [10, 10, 10, 10, 2, 2, 2].normalizeSum, inf), Prand(m[\no_input_stable_drone][(0..6)]++m[\no_input_gesture][(0..4)], inf)),
				\rate, Pwhite(0.1, Pif(Ptime(inf) < 30, Pseg(Pseq([1.0, 0.5], inf), Pseq([30, 30], inf), \linear), 0.5)),
				\spos, Pwhite(0, 10000),
				\amp, Pfunc({~glitch_stream_val}),
				\loop, 1,
				\pan_pos, Prand([-1, 0, 1], inf),
				\low_pass_mix, 1,
				\low_pass_freq, Pif(Ptime(inf) < 30, Pseg(Pseq([12000, 500], inf), Pseq([30, 30], inf), \linear), 500),
				\high_pass_mix, 1,
				\high_pass_freq, 50,
				\out, 0,
				\group, ~patterns,
			);
		).play(TempoClock(1));

		~metal_stream = Pdef(
	\metal1,
	Pbind(
		\instrument, \pattern_buf,
		\dur, Pwhite(0.01, 0.1),
		\atk, Pwhite(0.05, 0.01),
		\rel, Pwhite(2, 4),
		\buf, Prand(m[\cringle][(0..0)]++m[\shake][(0..3)], inf),
		\rate,Pseg(Pseq([3.0, 0.5], 1), Pseq([20, 20], 1), -10),
		\spos, Pwhite(0, 10000),
		\amp, Pseg(Pseq([Pfunc({~metal_stream_val}), 0.1], 1), Pseq([20, 20], 1), -10),
		\loop, 1,
		\pan_pos, Pwhite(-1.0, 1.0),
		\low_pass_mix, 1,
		\low_pass_freq, Pseg(Pseq([13000, 8000], 1), Pseq([20, 20], 1), -10),
		\high_pass_mix, 1,
		\high_pass_freq, 30,
		\out, 0,
		\group, ~patterns,
		);
		).play(TempoClock(1));

	~metal_stream_2 = Pdef(
	\metal2,
	Pbind(
		\instrument, \pattern_buf,
		\dur, Pwhite(1, 4),
		\atk, Pwhite(0.1, 5),
		\rel, Pwhite(6, 10),
		\buf, Prand(m[\cringle][(0..0)]++m[\shake][(0..3)]++m[\scrape][(0..4)]++m[\bowed][(0..3)], inf),
		\rate,  Prand([Pexprand(-0.1, -0.5), Pwhite(0.1, 0.5)], inf),
		\stretch,  1,
		\spos, Pwhite(0, 3000),
		\amp, Pfunc({~metal_stream_val}),
		\loop, 1,
		\pan_pos, Pwhite(-1.0, 1.0),
		\low_pass_mix, 1,
		\low_pass_freq, 8000,
		\high_pass_mix, 1,
		\high_pass_freq, 100,
		\out, 0,
		\group, ~patterns,
		);
		).play(TempoClock(1));
	});

	e.add(\28 -> {
		c[1].children[27].value_(0);//Off
	    c[1].children[28].value_(1);//On

		~contact_mic_1 = Synth(\feedback_1, [\atk, 30 , \rel, 30, \amp, ~contact_mic_1_numBox.value, \input_bus_left, ~contact_mic_1_in,  \input_bus_right, ~contact_mic_2_in, \freq, ~contact_mic_1_freq_numBox.value, \gate, 1, \out_left, ~sheet_1_out, \out_right, ~sheet_2_out], target: ~input).register;

	});

	e.add(\29 -> {
		c[1].children[28].value_(0);//Off
	    c[1].children[29].value_(1);//On

		~contact_mic_1.set(\gate, 0);

		~metal_stream_2 = Pdef(
	\metal2,
	Pbind(
		\instrument, \pattern_buf,
		\dur, Pwhite(0.5, 3),
		\atk, Pwhite(0.1, 3),
		\rel, Pwhite(6, 10),
		\buf, Prand(m[\cringle][(0..0)]++m[\shake][(0..3)]++m[\scrape][(0..4)]++m[\bowed][(0..3)], inf),
		\rate,  Prand([Pexprand(-0.1, -0.3), Pwhite(0.1, 0.3)], inf),
		\stretch,  1,
		\spos, Pwhite(0, 3000),
		\amp, Pfunc({~metal_stream_val}),
		\loop, 1,
		\pan_pos, Pwhite(-1.0, 1.0),
		\low_pass_mix, 1,
		\low_pass_freq, 10000,
		\high_pass_mix, 1,
		\high_pass_freq, 100,
		\out, 0,
		\group, ~patterns,
		);
		).play(TempoClock(1));

	});


	e.add(\30 -> {
		c[1].children[29].value_(0);//Off
	    c[1].children[30].value_(1);//On

		~contact_mic_1 = Synth(\feedback_1, [\atk, 30 , \rel, 30, \amp, ~contact_mic_1_numBox.value, \input_bus_left, ~contact_mic_1_in,  \input_bus_right, ~contact_mic_2_in, \freq, ~contact_mic_1_freq_numBox.value, \gate, 1, \out_left, ~sheet_1_out, \out_right, ~sheet_2_out], target: ~input).register;

	});

	e.add(\31 -> {
		c[1].children[30].value_(0);//Off
	    c[1].children[31].value_(1);//On

		~contact_mic_1.set(\gate, 0);

  ~metal_stream_2 = Pdef(
	\metal2,
	Pbind(
		\instrument, \pattern_buf,
		\dur, Pwhite(0.5, 3),
		\atk, Pwhite(0.1, 3),
		\rel, Pwhite(6, 10),
		\buf, Prand(m[\cringle][(0..0)]++m[\shake][(0..3)]++m[\scrape][(0..4)]++m[\bowed][(0..3)], inf),
		\rate,  Prand([Pexprand(-0.1, -0.6), Pwhite(0.1, 0.6)], inf),
		\stretch,  1,
		\spos, Pwhite(0, 3000),
		\amp, Pfunc({~metal_stream_val}),
		\loop, 1,
		\pan_pos, Pwhite(-1.0, 1.0),
		\low_pass_mix, 1,
		\low_pass_freq, 12000,
		\high_pass_mix, 1,
		\high_pass_freq, 50,
		\out, 0,
		\group, ~patterns,
		);
		).play(TempoClock(1));

	});

	e.add(\32 -> {
		c[1].children[31].value_(0);//Off
	    c[1].children[32].value_(1);//On

		~contact_mic_1 = Synth(\feedback_1, [\atk, 30 , \rel, 60, \amp, ~contact_mic_1_numBox.value, \input_bus_left, ~contact_mic_1_in,  \input_bus_right, ~contact_mic_2_in, \freq, ~contact_mic_1_freq_numBox.value, \gate, 1, \out_left, ~sheet_1_out, \out_right, ~sheet_2_out], target: ~input).register;


	~metal_stream_2 = Pdef(
	\metal2,
	Pbind(
		\instrument, \pattern_buf,
		\dur, Pwhite(Pif(Ptime(inf) < 30, Pseg(Pseq([0.5, 0.1], inf), Pseq([30, 30], inf), \linear), 0.1), Pif(Ptime(inf) < 30, Pseg(Pseq([3, 1], inf), Pseq([30, 30], inf), \linear), 1)),
		\atk, Pwhite(0.1, 3),
		\rel, Pwhite(6, 10),
		\buf, Prand(m[\cringle][(0..0)]++m[\shake][(0..3)]++m[\scrape][(0..4)]++m[\bowed][(0..3)], inf),
		\rate,  Pwhite(Pif(Ptime(inf) < 30, Pseg(Pseq([0.1, 1.0], inf), Pseq([30, 30], inf), \linear), 1.0), Pif(Ptime(inf) < 30, Pseg(Pseq([0.6, 2], inf), Pseq([30, 30], inf), \linear), 2)),
		\stretch,  1,
		\spos, Pwhite(0, 3000),
		\amp, Pfunc({~metal_stream_val}),
		\loop, 1,
		\pan_pos, Pwhite(-1.0, 1.0),
		\low_pass_mix, 1,
		\low_pass_freq, 12000,
		\high_pass_mix, 1,
		\high_pass_freq, 50,
		\out, 0,
		\group, ~patterns,
		);
		).play(TempoClock(1));

	});

	e.add(\33 -> {
		c[1].children[32].value_(0);//Off
	    c[1].children[33].value_(1);//On

		~reverb.set(\gate, 0);
		~reverb_violin_1.set(\gate, 0);
		~reverb_violin_2.set(\gate, 0);
		~reverb_viola.set(\gate, 0);

		~friction_violin_1.set(\gate, 0);
		~friction_violin_2.set(\gate, 0);
		~viola_ntube_1.set(\gate, 0);
		~cello_ntube_1.set(\gate, 0);

	~metal_stream_2 = Pdef(
	\metal2,
	Pbind(
		\instrument, \pattern_buf,
		\dur, Pwhite(Pif(Ptime(inf) < 50, Pseg(Pseq([0.1, 1], inf), Pseq([50, 50], inf), \linear), 1), Pif(Ptime(inf) < 50, Pseg(Pseq([0.5, 2], inf), Pseq([50, 50], inf), \linear), 1)),
		\atk, Pwhite(0.1, 3),
		\rel, Pwhite(6, 10),
		\buf, Prand(m[\cringle][(0..0)]++m[\shake][(0..3)]++m[\scrape][(0..4)]++m[\bowed][(0..3)], inf),
		\rate,  Pwhite(Pif(Ptime(inf) < 50, Pseg(Pseq([2, 0.5], inf), Pseq([50, 50], inf), \linear), 0.5), Pif(Ptime(inf) < 30, Pseg(Pseq([1, 0.1], inf), Pseq([50, 50], 1), \linear), 0.1)),
		\stretch,  1,
		\spos, Pwhite(0, 3000),
		\amp, Pfunc({~metal_stream_val}),
		\loop, 1,
		\pan_pos, Pwhite(-1.0, 1.0),
		\low_pass_mix, 1,
		\low_pass_freq, Pseg(Pseq([13000, 200], 1), Pseq([50, 50], 1), -10),
		\high_pass_mix, 1,
		\high_pass_freq, 50,
		\out, 0,
		\group, ~patterns,
		);
		).play(TempoClock(1));

		~metal_stream.stop;
		~glitch_loops.stop;

		// CUT METAL STREAM

	});



	e.add(\34 -> {
		c[1].children[33].value_(0);//Off
	    c[1].children[34].value_(1);//On

		~sub.set(\gate, 0);
        ~contact_mic_1.set(\gate, 0);


		~soft_glitch = Pdef(
	\glitch1,
	Pbind(
		\instrument, \pattern_buf,
		\dur, Pwhite(1, 2),
		\atk, Pexprand(0.1,0.2),
		\rel, Pwhite(0.02, 0.1),
		\buf, Prand(m[\no_input_glitch][(0..12)]++m[\no_input_rhythm][(0..3)]++m[\no_input_noise][(0..12)]++m[\no_input_stable_drone][(0..6)]++m[\no_input_unstable_drone][(0..5)]++m[\no_input_gesture][(0..4)]++m[\no_input_high][(0..3)], inf),
		\rate, Pexprand(0.5, 3.0),
		\spos, Pwhite(0, 10000),
		\amp, Pfunc({~soft_glitch_val}),
		\pan_pos, Pwhite(-1.0, 1.0),
		\low_pass_mix, 1,
		\low_pass_freq, 3000,
		\high_pass_mix, 1,
		\high_pass_freq, 30,
		\out, 0,
		\group, ~patterns,
		);
		).play(TempoClock(1));


	});

	e.add(\35 -> {
		c[1].children[34].value_(0);//Off
	    c[1].children[35].value_(1);//On

		//alter processes
		~ringmod_violin_2 = Synth(\ringmod, [\amp, ~violin_2_ringmod_numBox.value, \out,~violin_2_out, \in_bus, ~violin_2_fx_send, \low_pass_mix, 1, \high_pass_mix, 1, \high_pass_freq, 450, \low_pass_freq, 6000, \gate, 1, \buf,m[\no_input_noise][11], \rate_low, 1, \rate_high, 1, \atk, 2, \dec, 0.1, \sus, 1, \rel, 0.1, \mul, 4], target: ~fx).register;

		~soft_glitch = Pdef(
	\glitch1,
	Pbind(
		\instrument, \pattern_buf,
		\dur, Pwhite(0.5, 1.5),
		\atk, Pexprand(0.1,0.2),
		\rel, Pwhite(0.02, 0.2),
		\buf, Prand(m[\no_input_glitch][(0..12)]++m[\no_input_rhythm][(0..3)]++m[\no_input_noise][(0..12)]++m[\no_input_stable_drone][(0..6)]++m[\no_input_unstable_drone][(0..5)]++m[\no_input_gesture][(0..4)]++m[\no_input_high][(0..3)], inf),
		\rate, Pexprand(0.2, 4.0),
		\spos, Pwhite(0, 10000),
		\amp, Pfunc({~soft_glitch_val}),
		\pan_pos, Pwhite(-1.0, 1.0),
		\low_pass_mix, 1,
		\low_pass_freq, 3000,
		\high_pass_mix, 1,
		\high_pass_freq, 30,
		\out, 0,
		\group, ~patterns,
		);
		).play(TempoClock(1));



	});

	e.add(\36 -> {
		c[1].children[35].value_(0);//Off
	    c[1].children[36].value_(1);//On

		//alter processes
		~ringmod_viola = Synth(\ringmod, [\amp, ~ringmod_viola_numBox.value, \out, ~viola_out, \in_bus, ~viola_fx_send, \low_pass_mix, 1, \high_pass_mix, 1, \high_pass_freq, 100, \low_pass_freq, 4000, \gate, 1, \buf, b[\cringle][0], \rate_low, 0.01, \rate_high, 1.0, \atk, 10, \dec, 0.1, \sus, 1, \rel, 0.1, \mul, 4], target: ~fx).register;


		~soft_glitch = Pdef(
	\glitch1,
	Pbind(
		\instrument, \pattern_buf,
		\dur, Pexprand(0.05, 2),
		\atk, Pexprand(0.1,0.2),
		\rel, Pwhite(0.02, 0.2),
		\buf, Prand(m[\no_input_glitch][(0..12)]++m[\no_input_rhythm][(0..3)]++m[\no_input_noise][(0..12)]++m[\no_input_stable_drone][(0..6)]++m[\no_input_unstable_drone][(0..5)]++m[\no_input_gesture][(0..4)]++m[\no_input_high][(0..3)], inf),

		\rate, Pexprand(0.2, 6.0),
		\spos, Pwhite(0, 10000),
		\amp, Pfunc({~soft_glitch_val}),
		\pan_pos, Pwhite(-1.0, 1.0),
		\low_pass_mix, 1,
		\low_pass_freq, 5000,
		\high_pass_mix, 1,
		\high_pass_freq, 30,
		\out, 0,
		\group, ~patterns,
		);
		).play(TempoClock(1));


	});

	e.add(\37 -> {
		c[1].children[36].value_(0);//Off
	    c[1].children[37].value_(1);//On

		Routine({
		~patterns.free;
		~soft_glitch.stop;

		s.sync;

		~patterns = Group.before(~input);

		}).play;

		~ringmod_viola.set(\gate, 0);
		~ringmod_violin_2.set(\gate, 0);

		~violin_2_glitch = Synth(\grain_delay, [\amp, ~violin_2_glitch_numBox.value, \in_bus, ~violin_2_fx_send, \grain_trig_low, 1, \grain_trig_high, 10, \grain_dev, 1, \grain_size_low, 0.01, \grain_size_high, 0.05, \trig_fft_low, 5, \trig_fft_high, 20, \fft_dev, 1, \trig_freeze_low, 2, \trig_freeze_high, 20, \freeze_dev, 1, \trig_freq_low, 5, \trig_freq_high, 50, \atk, 3, \dec, 0.1, \sus, 1, \rel, 0.1, \gate, 1, \out, ~violin_2_out], target: ~fx).register;



	~violin_1_glitch = Synth(\grain_delay, [\amp, ~violin_1_glitch_numBox.value, \in_bus, ~violin_1_fx_send, \grain_trig_low, 1, \grain_trig_high, 10, \grain_dev, 1, \grain_size_low, 0.01, \grain_size_high, 0.05, \trig_fft_low, 5, \trig_fft_high, 20, \fft_dev, 1, \trig_freeze_low, 2, \trig_freeze_high, 20, \freeze_dev, 1, \trig_freq_low, 5, \trig_freq_high, 50, \atk, 8, \dec, 0.1, \sus, 1, \rel, 0.1, \gate, 1, \out, ~violin_1_out], target: ~fx).register;

	~cello_glitch = Synth(\grain_delay, [\amp, ~cello_glitch_numBox.value, \in_bus, ~cello_fx_send, \grain_trig_low, 1, \grain_trig_high, 10, \grain_dev, 1, \grain_size_low, 0.01, \grain_size_high, 0.05, \trig_fft_low, 5, \trig_fft_high, 20, \fft_dev, 1, \trig_freeze_low, 2, \trig_freeze_high, 20, \freeze_dev, 1, \trig_freq_low, 5, \trig_freq_high, 50, \atk, 8, \dec, 0.1, \sus, 1, \rel, 0.1, \gate, 1, \out, ~cello_out], target: ~fx).register;

	});

	e.add(\38 -> {
		c[1].children[37].value_(0);//Off
	    c[1].children[38].value_(1);//On

		~cello_glitch.set(\gate, 0);
		~violin_1_glitch.set(\gate, 0);
		~violin_2_glitch.set(\gate, 0);

	~noise_1 = Synth(\playbuf, [\bufnum, b[\no_input_stable_drone][0], \loop, 1, \gate, 1,
	\low_pass_freq, 500, \low_pass_mix, 1, \high_pass_mix, 0, \atk, 0.05 , \rel, 0.005, \amp, ~noise_1_numBox.value], target: ~samples).register;


	~noise_2 = Synth(\playbuf, [\bufnum, b[\no_input_high][1], \loop, 1, \gate, 1,
	\high_pass_freq, 500, \low_pass_mix, 1,\low_pass_freq, 10000, \high_pass_mix, 1, \amp, ~noise_2_numBox.value, \atk, 0.005, \rel, 0.005]).register;

	~contact_mic_1 = Synth(\feedback_1, [\atk, 20 , \rel, 0.1, \amp, ~contact_mic_1_numBox.value, \input_bus_left, ~contact_mic_1_in,  \input_bus_right, ~contact_mic_2_in, \freq, ~contact_mic_1_freq_numBox.value, \gate, 1, \out_left, ~sheet_1_out, \out_right, ~sheet_2_out], target: ~input).register;

		~viola_ntube = Synth(\ntube_5, [\amp, ~tube_delay_numBox.value, \mix_low, -1.0, \mix_high, -1.0, \input_bus, ~viola_fx_send, \atk, 10, \dec, 0.1, \sus, 1, \rel, 0.1, \gate, 1, \out, ~viola_out], target: ~fx).register;

		~cello_ntube = Synth(\ntube_7, [\amp, ~tube_delay_numBox.value, \mix_low, -1.0, \mix_high, -1.0, \input_bus, ~cello_fx_send, \atk, 30, \dec, 0.1, \sus, 1, \rel, 0.1, \gate, 1, \out, ~cello_out], target: ~fx).register;



	});

	e.add(\39 -> {
		c[1].children[38].value_(0);//Off
	    c[1].children[39].value_(1);//On

		~noise_1.set(\gate, 0);
		~viola_ntube.set(\gate, 0);
		~cello_ntube.set(\gate, 0);

		~grit_noise_1.set(\gate, 0);
		~noise_2.set(\gate, 0);

		~sub = Synth(\sub, [\amp, ~sub_numBox.value, \gate, 1, \time, 10, \out_bus, ~sub_out]).register;

	~glitch_stream = Pdef(
	\glitch1,
	Pbind(
		\instrument, \pattern_buf,
		\dur, Pwhite(0.001, 0.01),
		\atk, Pexprand(0.002,0.008),
		\rel, Pwhite(0.02, 0.1),
		\buf, Prand(m[\no_input_glitch][(0..12)]++m[\no_input_noise][(0..12)], inf),
		\rate, Pwhite(-0.2, -5.0),
		\spos, Pwhite(0, 10000),
		\amp, Pfunc({~glitch_stream_val}),
		\pan_pos, Pwhite(-1.0, 1.0),
		\low_pass_mix, 0,
		\low_pass_freq, 16000,
		\high_pass_mix, 1,
		\high_pass_freq, 50,
		\out, 0,
		\group, ~patterns,
		);
		).play(TempoClock(1));

});

	e.add(\40 -> {
		c[1].children[39].value_(0);//Off
	    c[1].children[40].value_(1);//On

		~sub.set(\gate, 0);
		~contact_mic_1.set(\gate, 0);
	    ~glitch_stream.stop;

		~metal_sheet_impulses = Synth(\metal_sheet_impulses_line, [\amp, ~metal_sheet_impulses_1_numBox.value, \atk, 0.5, \dec, 0.1, \sus, 1,  \rel,0.1, \curve, (-6),  \gate, 1,\line_start, 40, \line_end, 3, \line_dur, 5, \out_left, ~sheet_1_out, \out_right, ~sheet_2_out], target: ~sheets).register;


	});

	e.add(\41 -> {
		c[1].children[40].value_(0);//Off
	    c[1].children[41].value_(1);//On

	  ~delay = Synth(\delay,[\amp, ~delay_numBox.value, \input_bus, ~violin_1_fx_send, \atk, 10, \dec, 0.1, \sus, 1, \rel, 30, \gate, 1, \out, ~violin_1_out], target: ~fx).register;

	~viola_ntube = Synth(\ntube_5, [\amp, ~tube_delay_numBox.value, \mix_low, -1.0, \mix_high, -1.0, \input_bus, ~viola_fx_send, \atk, 45, \dec, 0.1, \sus, 1, \rel, 0.05, \gate, 1, \out, ~viola_out], target: ~fx).register; //violin_2

		~metal_sheet_impulses.set(\gate, 0);




	});

	e.add(\42 -> {
		c[1].children[41].value_(0);//Off
	    c[1].children[42].value_(1);//On

	   ~cello_ntube = Synth(\ntube_5, [\amp, ~tube_delay_numBox.value, \mix_low, -1.0, \mix_high, -1.0, \input_bus, ~cello_fx_send, \atk, 5, \dec, 0.1, \sus, 1, \rel, 30, \gate, 1, \out, ~cello_out, \curve, (-10)], target: ~fx).register;


	~ringmod_violin_2 = Synth(\ringmod, [\amp, ~violin_2_ringmod_numBox.value, \out, ~violin_2_out, \in_bus, ~violin_2_fx_send, \low_pass_mix, 1, \high_pass_mix, 1, \high_pass_freq, 100, \low_pass_freq, 4000, \gate, 1, \buf, b[\cringle][0], \rate_low, 0.01, \rate_high, 1.0, \atk, 10, \dec, 0.1, \sus, 1, \rel, 30, \mul, 4], target: ~fx).register;



	});

	e.add(\43 -> {
		c[1].children[42].value_(0);//Off
	    c[1].children[43].value_(1);//On


	    ~cello_ntube.set(\gate, 0);
	    ~ringmod_violin_2.set(\gate, 0);
		~delay.set(\gate, 0);

	});

	e.add(\44 -> {
		c[1].children[43].value_(0);//Off
	    c[1].children[44].value_(1);//On

		~viola_ntube.set(\gate, 0);

		~sub = Synth(\sub, [\amp, ~sub_numBox.value, \gate, 1, \time, 15, \out_bus, ~sub_out, \rel, 0.1]).register;

	   ~violin_2_glitch = Synth(\grain_delay, [\amp, ~violin_2_glitch_numBox.value, \in_bus, ~violin_2_fx_send, \grain_trig_low, 1, \grain_trig_high, 10, \grain_dev, 1, \grain_size_low, 0.01, \grain_size_high, 0.05, \trig_fft_low, 5, \trig_fft_high, 20, \fft_dev, 1, \trig_freeze_low, 2, \trig_freeze_high, 20, \freeze_dev, 1, \trig_freq_low, 5, \trig_freq_high, 50, \atk, 3, \dec, 0.1, \sus, 1, \rel, 0.1, \gate, 1, \out, ~violin_2_out], target: ~fx).register;

	 ~violin_1_glitch = Synth(\grain_delay, [\amp, ~violin_1_glitch_numBox.value, \in_bus, ~violin_1_fx_send, \grain_trig_low, 1, \grain_trig_high, 10, \grain_dev, 1, \grain_size_low, 0.01, \grain_size_high, 0.05, \trig_fft_low, 5, \trig_fft_high, 20, \fft_dev, 1, \trig_freeze_low, 2, \trig_freeze_high, 20, \freeze_dev, 1, \trig_freq_low, 5, \trig_freq_high, 50, \atk, 8, \dec, 0.1, \sus, 1, \rel, 0.1, \gate, 1, \out, ~violin_1_out], target: ~fx).register;

	 ~cello_glitch = Synth(\grain_delay, [\amp, ~cello_glitch_numBox.value, \in_bus, ~cello_fx_send, \grain_trig_low, 1, \grain_trig_high, 10, \grain_dev, 1, \grain_size_low, 0.01, \grain_size_high, 0.05, \trig_fft_low, 5, \trig_fft_high, 20, \fft_dev, 1, \trig_freeze_low, 2, \trig_freeze_high, 20, \freeze_dev, 1, \trig_freq_low, 5, \trig_freq_high, 50, \atk, 8, \dec, 0.1, \sus, 1, \rel, 0.1, \gate, 1, \out, ~cello_out], target: ~fx).register;

	});

	e.add(\45 -> {
		c[1].children[44].value_(0);//Off
	    c[1].children[45].value_(1);//On

	    ~cello_glitch.set(\gate, 0);
		~violin_1_glitch.set(\gate, 0);
		~violin_2_glitch.set(\gate, 0);
	    ~sub.set(\gate, 0);


	});

	e.add(\46 -> {
		c[1].children[45].value_(0);//Off
	    c[1].children[46].value_(1);//On


		~glitch_stream = Pdef(
	\glitch1,
	Pbind(
		\instrument, \pattern_buf,
		\dur, Pexprand(0.01, 2),
		\atk, Pexprand(0.005,0.01),
		\rel, Pwhite(0.02, 0.2),
		\buf, Prand(m[\no_input_glitch][(0..12)]++m[\no_input_rhythm][(0..3)]++m[\no_input_noise][(0..5)]++m[\no_input_stable_drone][(0..6)]++m[\no_input_unstable_drone][(0..5)]++m[\no_input_gesture][(0..4)]++m[\no_input_high][(0..3)]++m[\cringle][(0..0)]++m[\shake][(0..3)]++m[\struck][(0..2)]++m[\superball][(0..6)]++m[\scrape][(0..4)]++m[\rod][(0..5)], inf),

		\rate, Pexprand(0.2, 6.0),
		\spos, Pwhite(0, 10000),
		\amp, Pfunc({~glitch_stream_val}),
		\pan_pos, Pwhite(-1.0, 1.0),
		\low_pass_mix, 0,
		\low_pass_freq, 17000,
		\high_pass_mix, 1,
		\high_pass_freq, 30,
		\out, 0,
		\group, ~patterns,
		);
		).play(TempoClock(1));

		 Routine({
	~noise_2 = Synth(\playbuf, [\bufnum, b[\no_input_high][4], \loop, 1, \gate, 1,
	\high_pass_freq, 500, \low_pass_mix, 0, \high_pass_mix, 1, \amp, ~noise_2_numBox.value, \atk, 100, \rel, 0.1, \curve, (-6)]).register;

	~noise_1 = Synth(\playbuf, [\bufnum, b[\no_input_stable_drone][2], \loop, 1, \gate, 1,
	\low_pass_freq, 300, \low_pass_mix, 1, \high_pass_mix, 0, \atk, 100 , \rel, 0.1, \amp, ~noise_1_numBox.value, \curve, (-6)], target: ~samples).register;

   ~grit_noise_1 = Synth(\playbuf, [\bufnum, b[\no_input_gesture][2], \loop, 1, \gate, 1,
	\high_pass_freq, 100, \low_pass_mix, 0, \high_pass_mix, 1, \atk, 100, \rel, 0.1, \amp, ~noise_2_numBox.value, \curve, (-6)], target: ~samples).register;


		19.wait;

		~metal_sheet_impulses = Synth(\metal_sheet_impulses_line, [\amp, ~metal_sheet_impulses_1_numBox.value, \atk, 0.5, \dec, 0.1, \sus, 1,  \rel,0.1, \curve, (-6),  \gate, 1,\line_start, 0.01, \line_end, 30, \line_dur, 120, \out_left, ~sheet_1_out, \out_right, ~sheet_2_out], target: ~sheets).register;

		~delay = Synth(\delay,[\amp, ~delay_numBox.value, \input_bus, ~violin_1_fx_send, \atk, 30, \dec, 0.1, \sus, 1, \rel, 0.1, \gate, 1, \out, ~violin_1_out, \curve, (-10)], target: ~fx).register;


		}).play(AppClock);



	});

	e.add(\47 -> {
		c[1].children[46].value_(0);//Off
	    c[1].children[47].value_(1);//On


	~glitch_stream = Pdef(
	\glitch1,
	Pbind(
		\instrument, \pattern_buf,
		\dur, Pexprand(0.01, 2),
		\atk, Pexprand(0.005,0.01),
		\rel, Pwhite(0.02, 0.5),
		\buf, Prand(m[\no_input_glitch][(0..12)]++m[\no_input_rhythm][(0..3)]++m[\no_input_noise][(0..5)]++m[\no_input_stable_drone][(0..6)]++m[\no_input_unstable_drone][(0..5)]++m[\no_input_gesture][(0..4)]++m[\no_input_high][(0..3)]++m[\cringle][(0..0)]++m[\shake][(0..3)]++m[\struck][(0..2)]++m[\superball][(0..6)]++m[\scrape][(0..4)]++m[\rod][(0..5)], inf),

		\rate, Pexprand(0.2, 3.0),
		\spos, Pwhite(0, 10000),
		\amp, Pfunc({~glitch_stream_val}),
		\pan_pos, Pwhite(-1.0, 1.0),
		\low_pass_mix, 0,
		\low_pass_freq, 17000,
		\high_pass_mix, 1,
		\high_pass_freq, 30,
		\out, 0,
		\group, ~patterns,
		);
		).play(TempoClock(1));

		~contact_mic_1 = Synth(\feedback_1, [\atk, 10 , \rel, 0.1, \amp, ~contact_mic_1_numBox.value, \input_bus_left, ~contact_mic_1_in,  \input_bus_right, ~contact_mic_2_in, \freq, ~contact_mic_1_freq_numBox.value, \gate, 1, \out_left, ~sheet_1_out, \out_right, ~sheet_2_out], target: ~input).register;

		~friction_violin_2 = Synth(\friction_fft_1_rms, [\amp, ~friction_numBox.value, \lpf_freq, 8000, \noise_speed, 100, \input_bus, ~violin_2_fx_send, \atk, 10, \dec, 0.1, \sus, 1, \rel, 0.05, \gate, 1, \out, ~violin_2_out, \fft_mix, -1.0], ~fx).register;

	});

	e.add(\48 -> {
		c[1].children[47].value_(0);//Off
	    c[1].children[48].value_(1);//On

		~glitch_stream = Pdef(
	\glitch1,
	Pbind(
		\instrument, \pattern_buf,
		\dur, Pexprand(0.01, 1.5),
		\atk, Pexprand(0.005,0.01),
		\rel, Pwhite(0.02, 1.0),
		\buf, Prand(m[\no_input_glitch][(0..12)]++m[\no_input_rhythm][(0..3)]++m[\no_input_noise][(0..5)]++m[\no_input_stable_drone][(0..6)]++m[\no_input_unstable_drone][(0..5)]++m[\no_input_gesture][(0..4)]++m[\no_input_high][(0..3)]++m[\cringle][(0..0)]++m[\shake][(0..3)]++m[\struck][(0..2)]++m[\superball][(0..6)]++m[\scrape][(0..4)]++m[\rod][(0..5)], inf),

		\rate, Pexprand(0.2, 3.0),
		\spos, Pwhite(0, 10000),
		\amp, Pfunc({~glitch_stream_val}),
		\pan_pos, Pwhite(-1.0, 1.0),
		\low_pass_mix, 0,
		\low_pass_freq, 17000,
		\high_pass_mix, 1,
		\high_pass_freq, 30,
		\out, 0,
		\group, ~patterns,
		);
		).play(TempoClock(1));

		 Routine({

		~sub = Synth(\sub, [\amp, ~sub_numBox.value, \gate, 1, \atk, 80, \rel, 0.1, \dec, 0.1, \sus, 1, \out_bus, ~sub_out]).register;

		10.wait;


	 ~cello_glitch = Synth(\grain_delay, [\amp, ~cello_glitch_numBox.value, \in_bus, ~cello_fx_send, \grain_trig_low, 1, \grain_trig_high, 10, \grain_dev, 1, \grain_size_low, 0.01, \grain_size_high, 0.05, \trig_fft_low, 5, \trig_fft_high, 20, \fft_dev, 1, \trig_freeze_low, 2, \trig_freeze_high, 20, \freeze_dev, 1, \trig_freq_low, 5, \trig_freq_high, 50, \atk, 60, \dec, 0.1, \sus, 1, \rel, 30, \gate, 1, \out, ~cello_out], target: ~fx).register;

	 ~viola_glitch = Synth(\grain_delay, [\amp, ~viola_glitch_numBox.value, \in_bus, ~viola_fx_send, \grain_trig_low, 1, \grain_trig_high, 10, \grain_dev, 1, \grain_size_low, 0.01, \grain_size_high, 0.05, \trig_fft_low, 5, \trig_fft_high, 20, \fft_dev, 1, \trig_freeze_low, 2, \trig_freeze_high, 20, \freeze_dev, 1, \trig_freq_low, 5, \trig_freq_high, 50, \atk, 60, \dec, 0.1, \sus, 1, \rel, 30, \gate, 1, \out, ~viola_out], target: ~fx).register;

		}).play(AppClock)

	});

	e.add(\49 -> {
		c[1].children[48].value_(0);//Off
	    c[1].children[49].value_(1);//On



		~glitch_stream = Pdef(
	\glitch1,
	Pbind(
		\instrument, \pattern_buf,
		\dur, Pif(Ptime(inf) < 50.0, Pwhite(Pseg(Pseq([0.005, 0.001], inf), Pseq([50.0, 50.0], inf), \linear), Pseg(Pseq([0.8, 0.002], inf), Pseq([50.0, 50.0], inf), \linear)),  Pwhite(0.001, 0.002)),
		\atk, Pif(Ptime(inf) < 50.0, Pwhite(Pseg(Pseq([0.01, 0.002], inf), Pseq([50.0, 50.0], inf), \linear), Pseg(Pseq([0.01, 0.008], inf), Pseq([50.0, 50.0], inf), \linear)), Pexprand(0.002,0.008)),
		\rel, Pif(Ptime(inf) < 50.0, Pwhite(Pseg(Pseq([0.02, 0.01], inf), Pseq([50.0, 50.0], inf), \linear), Pseg(Pseq([1.5, 0.05], inf), Pseq([50.0, 50.0], inf), \linear)), Pwhite(0.01, 0.05)),
		\buf, Prand(m[\no_input_glitch][(0..12)]++m[\no_input_rhythm][(0..3)]++m[\no_input_noise][(0..5)]++m[\no_input_stable_drone][(0..6)]++m[\no_input_unstable_drone][(0..5)]++m[\no_input_gesture][(0..4)]++m[\no_input_high][(0..3)]++m[\cringle][(0..0)]++m[\shake][(0..3)]++m[\struck][(0..2)]++m[\superball][(0..6)]++m[\scrape][(0..4)]++m[\rod][(0..5)], inf),
				\rate, 	Pif(Ptime(inf) < 50.0, Pwhite(Pseg(Pseq([0.2, 0.5], 1), Pseq([50.0, 50.0], inf), \linear), Pseg(Pseq([1.5, 20.0], inf), Pseq([50.0, 50.0], inf), \linear)), Pwhite(3.0, 20.0)),
		\spos, Pwhite(0, 10000),
		\amp, Pfunc({~glitch_stream_val}),
		\pan_pos, Pwhite(-1.0, 1.0),
		\low_pass_mix, 0,
		\low_pass_freq, 16000,
		\high_pass_mix, 1,
		\high_pass_freq, 50,
		\out, 0,
		\group, ~patterns,
		);
		).play(TempoClock(1));




	 ~viola_ntube = Synth(\ntube_7, [\amp, ~tube_delay_numBox.value, \mix_low, -1.0, \mix_high, -1.0, \input_bus, ~violin_1_fx_send, \atk, 5, \dec, 0.1, \sus, 1, \rel, 0.1, \gate, 1, \out, ~violin_1_out], target: ~fx).register;

	 ~cello_ntube = Synth(\ntube_5, [\amp, ~tube_delay_numBox.value, \mix_low, -1.0, \mix_high, -1.0, \input_bus, ~violin_1_fx_send, \atk, 10, \dec, 0.1, \sus, 1, \rel, 0.1, \gate, 1, \out, ~violin_1_out], target: ~fx).register; //violin_1

	});

	e.add(\50 -> {
		c[1].children[49].value_(0);//Off
	    c[1].children[50].value_(1);//On

 	    ~friction_violin_1.set(\gate, 0);
		~friction_violin_2.set(\gate, 0);
		~viola_ntube.set(\gate, 0);
		~cello_ntube.set(\gate, 0);
		~violin_2_glitch.set(\gate, 0);
		~violin_1_glitch.set(\gate, 0);
		~cello_glitch.set(\gate, 0);
		~viola_glitch.set(\gate, 0);
	    ~ringmod_violin_2.set(\gate, 0);
	    ~ringmod_viola.set(\gate, 0);
		~delay.set(\gate, 0);
		~noise_2.set(\gate, 0);
	    ~noise_1.set(\gate, 0);
	    ~grit_noise_1.set(\gate, 0);

		~glitch_stream = Pdef(
	\glitch1,
	Pbind(
		\instrument, \pattern_buf_4,
		\dur, Pwhite(0.001, 0.0015),
		\atk, Pexprand(0.002,0.004),
		\rel, Pwhite(0.01, 0.2),
		\buf, Prand(m[\no_input_glitch][(0..12)]++m[\no_input_rhythm][(0..3)]++m[\no_input_noise][(0..5)]++m[\no_input_stable_drone][(0..6)]++m[\no_input_unstable_drone][(0..5)]++m[\no_input_gesture][(0..4)]++m[\no_input_high][(0..3)]++m[\cringle][(0..0)]++m[\shake][(0..3)]++m[\struck][(0..2)]++m[\superball][(0..6)]++m[\scrape][(0..4)]++m[\rod][(0..5)], inf),
		\rate, Pwhite(-0.5, -20.0),
		\spos, Pwhite(0, 10000),
		\amp, Pfunc({~glitch_stream_val}),
		\pan_pos_x, Pwhite(-1.0, 1.0),
		\pan_pos_y, Pwhite(-1.0, 1.0),
		\low_pass_mix, 0,
		\low_pass_freq, 16000,
		\high_pass_mix, 1,
		\high_pass_freq, 50,
		\out, 0,
		\group, ~patterns,
		);
		).play(TempoClock(1));

	});

	e.add(\51 -> {
		c[1].children[50].value_(0);//Off
	    c[1].children[51].value_(1);//On

	    ~contact_mic_1.set(\gate, 0);
	    ~sub.set(\gate, 0);
	    ~metal_sheet_impulses.set(\gate, 0);
		~glitch_stream.stop;


	});
};



//6. Make GUI
// GUI////////////////////////////////////////////////////////////////////////////////
~makeGui = {
Window.closeAll;
w = Window("String Quartet #1", Rect(750,50,1200,800))
.front
.alwaysOnTop_(true);

// Composite View 0//////////////
StaticText(w, Rect(0,0,580,40))
.string_("String Quartet #1")
.align_(\center)
.front
.stringColor_(Color(1, 1, 1))
.font_(Font(size: 30));

StaticText(w, Rect(0,35,580,40))
.string_("By Hunter Brown")
.align_(\center)
.front
.stringColor_(Color(1, 1, 1))
.font_(Font(size: 30));

/*
StaticText(w, Rect(410,30,190, 180))
	.string_("To Reset: Once stopped, nagivate to the 'Language' menu & select 'Evaluate File'")
.align_(\center)
.front
.font_(Font(size: 15));
*/

// Composite View 1//////////////
StaticText(w, Rect(602,0,580,30))
.string_("Rehearsal Cues")
.align_(\center)
.front
.font_(Font(size: 30));

// Composite View 2//////////////
StaticText(w, Rect(460,250,100,100))
.string_("Dry String Sound")
.align_(\center)
.front
.font_(Font(size: 30));

StaticText(w, Rect(5,200,70,30))
.string_("Violin 1")
.align_(\center)
.front
.font_(Font(size: 20));

StaticText(w, Rect(123,200,70,30))
.string_("Violin 2")
.align_(\center)
.front
.font_(Font(size: 20));

StaticText(w, Rect(240,200,70,30))
.string_("Viola")
.align_(\center)
.front
.font_(Font(size: 20));

StaticText(w, Rect(360,200,70,30))
.string_("Cello")
.align_(\center)
.front
.font_(Font(size: 20));

StaticText(w, Rect(400,370,70,30))
.string_("dbs")
.align_(\center)
.front
.font_(Font(size: 15));

StaticText(w, Rect(280,370,70,30))
.string_("dbs")
.align_(\center)
.front
.font_(Font(size: 15));

StaticText(w, Rect(160,370,70,30))
.string_("dbs")
.align_(\center)
.front
.font_(Font(size: 15));

StaticText(w, Rect(40,370,70,30))
.string_("dbs")
.align_(\center)
.front
.font_(Font(size: 15));

// Composite View 3//////////////
StaticText(w, Rect(1010,260,200,80))
.string_("Buffer Amplitude")
.align_(\center)
.front
.font_(Font(size: 30));

StaticText(w, Rect(640,370,70,30))
.string_("dbs")
.align_(\center)
.front
.font_(Font(size: 15));

StaticText(w, Rect(760,370,70,30))
.string_("dbs")
.align_(\center)
.front
.font_(Font(size: 15));

StaticText(w, Rect(880,370,70,30))
.string_("dbs")
.align_(\center)
.front
.font_(Font(size: 15));

StaticText(w, Rect(1000,370,70,30))
.string_("dbs")
.align_(\center)
.front
.font_(Font(size: 15));

StaticText(w, Rect(593,200,90,30))
.string_("Glitch Stream | Loops")
.align_(\center)
.front
.font_(Font(size: 10));

StaticText(w, Rect(720,200,70,30))
.string_("Metal Stream")
.align_(\center)
.front
.font_(Font(size: 10));

StaticText(w, Rect(840,200,70,30))
.string_("Noise 1 | Sub")
.align_(\center)
.front
.font_(Font(size: 10));

StaticText(w, Rect(960,200,70,30))
.string_("Noise 2 | Low Freq Rumble")
.align_(\center)
.front
.font_(Font(size: 10));



// Composite View 4//////////////
StaticText(w, Rect(0,399,70,30))
.string_("Cello RingMod")
.align_(\center)
.front
.font_(Font(size: 10));

StaticText(w, Rect(120,400,70,30))
.string_("Viola RingMod")
.align_(\center)
.front
.font_(Font(size: 10));

StaticText(w, Rect(240,400,70,30))
.string_("Violin 1 Glitch")
.align_(\center)
.front
.font_(Font(size: 10));

StaticText(w, Rect(360,400,70,30))
.string_("Violin 2 Glitch")
.align_(\center)
.front
.font_(Font(size: 10));

StaticText(w, Rect(480,400,70,30))
.string_("Viola Glitch")
.align_(\center)
.front
.font_(Font(size: 10));


StaticText(w, Rect(40,570,70,30))
.string_("dbs")
.align_(\center)
.front
.font_(Font(size: 15));

StaticText(w, Rect(160,570,70,30))
.string_("dbs")
.align_(\center)
.front
.font_(Font(size: 15));

StaticText(w, Rect(280,570,70,30))
.string_("dbs")
.align_(\center)
.front
.font_(Font(size: 15));

StaticText(w, Rect(400,570,70,30))
.string_("dbs")
.align_(\center)
.front
.font_(Font(size: 15));

StaticText(w, Rect(520,570,70,30))
.string_("dbs")
.align_(\center)
.front
.font_(Font(size: 15));


// Composite View 5//////////////

StaticText(w, Rect(600,400,70,30))
.string_("Cello Glitch")
.align_(\center)
.front
.font_(Font(size: 10));

StaticText(w, Rect(720,400,70,30))
.string_("Friction")
.align_(\center)
.front
.font_(Font(size: 10));

StaticText(w, Rect(840,400,70,30))
.string_("Tube Delay")
.align_(\center)
.front
.font_(Font(size: 10));

StaticText(w, Rect(960,400,70,30))
.string_("Reverb")
.align_(\center)
.front
.font_(Font(size: 10));


StaticText(w, Rect(1010,430,200,150))
.string_("Live Processing")
.align_(\center)
.front
.font_(Font(size: 30));

StaticText(w, Rect(640,570,70,30))
.string_("dbs")
.align_(\center)
.front
.font_(Font(size: 15));

StaticText(w, Rect(760,570,70,30))
.string_("dbs")
.align_(\center)
.front
.font_(Font(size: 15));

StaticText(w, Rect(880,570,70,30))
.string_("dbs")
.align_(\center)
.front
.font_(Font(size: 15));

StaticText(w, Rect(1000,570,70,30))
.string_("dbs")
.align_(\center)
.front
.font_(Font(size: 15));

// Composite View 6//////////////

StaticText(w, Rect(400,660,100,80))
.string_("Metal Sheets")
.align_(\center)
.front
.stringColor_(Color(1, 1, 1))
.font_(Font(size:30));

StaticText(w, Rect(0,600,70,30))
.string_("Amp")
.align_(\center)
.front
.stringColor_(Color(1, 1, 1))
.font_(Font(size: 18));

StaticText(w, Rect(120,600,70,30))
.string_("Freq")
.align_(\center)
.front
.stringColor_(Color(1, 1, 1))
.font_(Font(size: 18));

StaticText(w, Rect(225,600,100,30))
.string_("Impulses")
.align_(\center)
.front
.stringColor_(Color(1, 1, 1))
.font_(Font(size: 18));

StaticText(w, Rect(40,770,70,30))
.string_("dbs")
.align_(\center)
.front
.stringColor_(Color(1, 1, 1))
.font_(Font(size: 15));

StaticText(w, Rect(170,770,60,30))
.string_("hertz")
.align_(\center)
.front
.stringColor_(Color(1, 1, 1))
.font_(Font(size: 15));

StaticText(w, Rect(280,770,70,30))
.string_("dbs")
.align_(\center)
.front
.stringColor_(Color(1, 1, 1))
.font_(Font(size: 15));



// Composite View 7//////////////


StaticText(w, Rect(600,600,70,30))
.string_("Sub")
.align_(\center)
.front
.font_(Font(size: 10));

StaticText(w, Rect(720,600,70,30))
.string_("Soft Glitch")
.align_(\center)
.front
.font_(Font(size: 10));

StaticText(w, Rect(840,600,70,30))
.string_("Violin 2 RingMod")
.align_(\center)
.front
.font_(Font(size: 10));

StaticText(w, Rect(960,600,70,30))
.string_("Low Rumble")
.align_(\center)
.front
.font_(Font(size: 10));

StaticText(w, Rect(1080,600,70,30))
.string_("Delay")
.align_(\center)
.front
.font_(Font(size: 10));



StaticText(w, Rect(640,770,70,30))
.string_("dbs")
.align_(\center)
.front
.font_(Font(size: 15));

StaticText(w, Rect(1000,770,70,30))
.string_("dbs")
.align_(\center)
.front
.font_(Font(size: 15));


StaticText(w, Rect(880,770,70,30))
.string_("dbs")
.align_(\center)
.front
.font_(Font(size: 15));


StaticText(w, Rect(1120,770,70,30))
.string_("dbs")
.align_(\center)
.front
.font_(Font(size: 15));


w.view.decorator_(FlowLayout(w.bounds, 0@0, 0@0));

// composite views
c = Array.fill( 8, {
	arg view;
	view = CompositeView(w, 600@200)
	.background_();

	view.decorator_(FlowLayout(view.bounds, 10@25, 70@0));
});
//Fills the various composite views
c[0].background_(Color(0, 0, 0));
c[0].decorator_(FlowLayout(c[0].bounds, 90@40, 15@15)); // Array 0
c[0].decorator.nextLine;
c[0].decorator.nextLine;
c[0].decorator.nextLine;
Array.fill(1, {Button(c[0], 200@50).font_(Font(size: 30)).states_([["Initialization", Color.black, Color.gray(0.8)],["Initialized", Color.white, Color(0,0,0)]])}); //Dry Strings: Array 0

Array.fill(1, {Button(c[0], 200@50).font_(Font(size: 30)).states_([["Stop & Reset", Color.black, Color.gray(0.8)]])});

c[0].decorator.nextLine;
c[0].decorator_(FlowLayout(c[0].bounds, 190@140, 15@15)); // Array 0
Array.fill(1, {Button(c[0], 200@50).font_(Font(size: 30)).states_([["Cue", Color.black, Color.gray(0.8)]])}); //Dry Strings: Array 0


c[1].background_(Color(1, 1, 1));
c[1].decorator_(FlowLayout(c[0].bounds, 30@15, 10@10)); // Array 1
c[1].decorator.nextLine;
c[1].decorator.nextLine;
Array.fill(52, {
		arg i=(-1);
		{i = i + 1};
		Button(c[1], 30@30).states_([[i.asString, Color.black, Color.gray(0.8)],[i.asString, Color.white, Color(0,0,0)]])});//Dry Strings: Array 0

c[2].background_(Color(0, (75/255), (168/255)));
c[3].background_(Color((137/255), (2/255), (62/255)));
c[4].background_(Color(1, 1, 1));
c[5].background_(Color(1, 1, 1));
c[6].background_(Color(00, 0, 0));
c[7].background_(Color(1, 1, 1));
Array.fill(4, {Slider(c[2], 50@150)});//Dry Strings: Array 2
c[2].decorator.nextLine;
Array.fill(4, {NumberBox(c[2], 50@20)}); //Dry Strings: Array 2

Array.fill(4, {Slider(c[3], 50@150)}); //Samples (Grain Buf, PLayBuf): Array 3
c[3].decorator.nextLine;
Array.fill(4, {NumberBox(c[3], 50@20)});

Array.fill(5, {Slider(c[4], 50@150)}); //FX Bank 1: Array 4
c[4].decorator.nextLine;
Array.fill(5, {NumberBox(c[4], 50@20)});

Array.fill(4, {Slider(c[5], 50@150)}); //FX Bank 2: Array 5
c[5].decorator.nextLine;
Array.fill(4, {NumberBox(c[5], 50@20)});

Array.fill(3, {Slider(c[6], 50@150)}); //Feedback Module 1: Array 6
c[6].decorator.nextLine;
Array.fill(3, {NumberBox(c[6], 50@20)});

Array.fill(5, {Slider(c[7], 50@150)}); //Feedback Module 2: Array 7
c[7].decorator.nextLine;
Array.fill(5, {NumberBox(c[7], 50@20)});

//Controls/////////////////////////////////////////////////
//Compositie View 0 Dry Strings/////////////////////////////////////////////////
c[2].children[4].valueAction_(-60.0);
c[2].children[5].valueAction_(-60.0);
c[2].children[6].valueAction_(-60.0);
c[2].children[7].valueAction_(-60.0);

c[3].children[4].valueAction_(-60.0);
c[3].children[5].valueAction_(-60.0);
c[3].children[6].valueAction_(-60.0);
c[3].children[7].valueAction_(-60.0);

c[4].children[5].valueAction_(-60.0);
c[4].children[6].valueAction_(-60.0);
c[4].children[7].valueAction_(-60.0);
c[4].children[8].valueAction_(-60.0);
c[4].children[9].valueAction_(-60.0);

c[5].children[4].valueAction_(-60.0);
c[5].children[5].valueAction_(-60.0);
c[5].children[6].valueAction_(-60.0);
c[5].children[7].valueAction_(-60.0);

c[6].children[3].valueAction_(-60.0);
c[6].children[4].valueAction_(-60.0);
c[6].children[5].valueAction_(-60.0);

c[7].children[3].valueAction_(-60.0);
c[7].children[4].valueAction_(-60.0);
c[7].children[5].valueAction_(-60.0);
c[7].children[6].valueAction_(-60.0);
c[7].children[7].valueAction_(-60.0);
c[7].children[8].valueAction_(-60.0);
c[7].children[9].valueAction_(-60.0);


~init_button = c[0].children[0]
.action_({
	arg obj;
	if(obj.value == 1, {e[\init].value;"init".postln},{nil});
});

~stop_button = c[0].children[1]
	.mouseDownAction_({e[\stop_reset].value})

	.mouseUpAction_({~init_button.valueAction = 0});

~next_cue_button = c[0].children[2]
.mouseDownAction_({e[~cue.asSymbol].value;
})
.mouseUpAction_({
		//arg obj;
		//if(obj.value == 1, {~cue = ~cue + 1.postln},{nil});
		~cue = ~cue + 1;
});

~rehearsal_cue_button_0 = c[1].children[0]
.mouseDownAction_({
		~cue=0;
});

~rehearsal_cue_button_1 = c[1].children[1]
.mouseDownAction_({
		~cue=1;
});

~rehearsal_cue_button_2 = c[1].children[2]
.mouseDownAction_({
		~cue=2;
});

~rehearsal_cue_button_3 = c[1].children[3]
.mouseDownAction_({
		~cue=3;
});

~rehearsal_cue_button_4 = c[1].children[4]
.mouseDownAction_({
		~cue=4;
});

~rehearsal_cue_button_5 = c[1].children[5]
.mouseDownAction_({
		~cue=5;
});

~rehearsal_cue_button_6 = c[1].children[6]
.mouseDownAction_({
		~cue=6;
});

~rehearsal_cue_button_7 = c[1].children[7]
.mouseDownAction_({
		~cue=7;
});


~rehearsal_cue_button_8 = c[1].children[8]
.mouseDownAction_({
		~cue=8;
});

~rehearsal_cue_button_9 = c[1].children[9]
.mouseDownAction_({
		~cue=9;
});

~rehearsal_cue_button_10 = c[1].children[10]
.mouseDownAction_({
		~cue=10;
});

~rehearsal_cue_button_11 = c[1].children[11]
.mouseDownAction_({
		~cue=11;
});

~rehearsal_cue_button_12 = c[1].children[12]
.mouseDownAction_({
		~cue=12;
});

~rehearsal_cue_button_13 = c[1].children[13]
.mouseDownAction_({
		~cue=13;
});

~rehearsal_cue_button_14 = c[1].children[14]
.mouseDownAction_({
		~cue=14;
});

~rehearsal_cue_button_15 = c[1].children[15]
.mouseDownAction_({
		~cue=15;
});

~rehearsal_cue_button_16 = c[1].children[16]
.mouseDownAction_({
		~cue=16;
});

~rehearsal_cue_button_17 = c[1].children[17]
.mouseDownAction_({
		~cue=17;
});

~rehearsal_cue_button_18 = c[1].children[18]
.mouseDownAction_({
		~cue=18;
});

~rehearsal_cue_button_19 = c[1].children[19]
.mouseDownAction_({
		~cue=19;
});


~rehearsal_cue_button_20 = c[1].children[20]
.mouseDownAction_({
		~cue=20;
});

~rehearsal_cue_button_21 = c[1].children[21]
.mouseDownAction_({
		~cue=21;
});

~rehearsal_cue_button_22 = c[1].children[22]
.mouseDownAction_({
		~cue=22;
});

~rehearsal_cue_button_23 = c[1].children[23]
.mouseDownAction_({
		~cue=23;
});

~rehearsal_cue_button_24 = c[1].children[24]
.mouseDownAction_({
		~cue=24;
});

~rehearsal_cue_button_25 = c[1].children[25]
.mouseDownAction_({
		~cue=25;
});

~rehearsal_cue_button_26 = c[1].children[26]
.mouseDownAction_({
		~cue=26;
});

~rehearsal_cue_button_27 = c[1].children[27]
.mouseDownAction_({
		~cue=27;
});

~rehearsal_cue_button_28 = c[1].children[28]
.mouseDownAction_({
		~cue=28;
});

~rehearsal_cue_button_29 = c[1].children[29]
.mouseDownAction_({
		~cue=29;
});

~rehearsal_cue_button_30 = c[1].children[30]
.mouseDownAction_({
		~cue=30;
});

~rehearsal_cue_button_31 = c[1].children[31]
.mouseDownAction_({
		~cue=31;
});

~rehearsal_cue_button_32 = c[1].children[32]
.mouseDownAction_({
		~cue=32;
});

~rehearsal_cue_button_33 = c[1].children[33]
.mouseDownAction_({
		~cue=33;
});

~rehearsal_cue_button_34 = c[1].children[34]
.mouseDownAction_({
		~cue=34;
});

~rehearsal_cue_button_35 = c[1].children[35]
.mouseDownAction_({
		~cue=35;
});

~rehearsal_cue_button_36 = c[1].children[36]
.mouseDownAction_({
		~cue=36;
});

~rehearsal_cue_button_37 = c[1].children[37]
.mouseDownAction_({
		~cue=37;
});

~rehearsal_cue_button_38 = c[1].children[38]
.mouseDownAction_({
		~cue=38;
});

~rehearsal_cue_button_39 = c[1].children[39]
.mouseDownAction_({
		~cue=39;
});

~rehearsal_cue_button_40 = c[1].children[40]
.mouseDownAction_({
		~cue=40;
});

~rehearsal_cue_button_41 = c[1].children[41]
.mouseDownAction_({
		~cue=41;
});

~rehearsal_cue_button_42 = c[1].children[42]
.mouseDownAction_({
		~cue=42;
});

~rehearsal_cue_button_43 = c[1].children[43]
.mouseDownAction_({
		~cue=43;
});

~rehearsal_cue_button_44 = c[1].children[44]
.mouseDownAction_({
		~cue=44;
});

~rehearsal_cue_button_45 = c[1].children[45]
.mouseDownAction_({
		~cue=45;
});

~rehearsal_cue_button_46 = c[1].children[46]
.mouseDownAction_({
		~cue=46;
});

~rehearsal_cue_button_47 = c[1].children[47]
.mouseDownAction_({
		~cue=47;
});

~rehearsal_cue_button_48 = c[1].children[48]
.mouseDownAction_({
		~cue=48;
});

~rehearsal_cue_button_49 = c[1].children[49]
.mouseDownAction_({
		~cue=49;
});

~rehearsal_cue_button_50 = c[1].children[50]
.mouseDownAction_({
		~cue=50;
});



~violin_1_slider = c[2].children[0].action_({
	arg obj;
	var amp;
	amp = obj.value.linlin(0.0,1.0, -60.0,-0.0);
	~violin_1_val=obj.value;
	if(~violin_1.isPlaying,
	{~violin_1.set(\amp, amp)}
);
	~violin_1_numBox.value_(obj.value.linlin(0.0,1.0,-60.0,0.0)); // updates numberbox with freq information.
});

~violin_1_numBox = c[2].children[4]
.decimals_(1)
.clipLo_(-60.0)
.clipHi_(0.0)
.action_({
	arg obj;
	~violin_1_slider.valueAction_(obj.value.linlin(-60.0,0.0, 0.0,1.0)) // allows you to move slider via typing numbers
});

~violin_2_slider = c[2].children[1].action_({
	arg obj;
	var amp;
	amp = obj.value.linlin(0.0,1.0,-60.0,-0.0);
	~violin_2_val=obj.value;
	if(~violin_2.isPlaying,
	{~violin_2.set(\amp, amp)}
);
	~violin_2_numBox.value_(obj.value.linlin(0.0,1.0,-60.0,0.0)); // updates numberbox with freq information.
});

~violin_2_numBox = c[2].children[5]
.decimals_(1)
.clipLo_(-60.0)
.clipHi_(0.0)
.action_({
	arg obj;
	c[2].children[1].valueAction_(obj.value.linlin(-60.0,0.0, 0.0,1.0)) // allows you to move slider via typing numbers
});

~viola_slider = c[2].children[2]
.action_({
	arg obj;
	var amp;
	amp = obj.value.linlin(0.0,1.0,-60.0,-0.0);
	~viola_val=obj.value;
	if(~viola.isPlaying,
	{~viola.set(\amp, amp)}
);
	~viola_numBox.value_(obj.value.linlin(0.0,1.0,-60.0,0.0)); // updates numberbox with freq information.
});
~viola_numBox = c[2].children[6]
.decimals_(1)
.clipLo_(-60.0)
.clipHi_(0.0)
.action_({
	arg obj;
	~viola_slider.valueAction_(obj.value.linlin(-60.0,0.0, 0.0,1.0)) // allows you to move slider via typing numbers
});

~cello_slider = c[2].children[3]
.action_({
	arg obj;
	var amp;
	amp = obj.value.linlin(0.0,1.0,-60.0,-0.0);
	~cello_val=obj.value;
	if(~cello.isPlaying,
	{~cello.set(\amp, amp)}
);
	~cello_numBox.value_(obj.value.linlin(0.0,1.0,-60.0,0.0)); // updates numberbox with freq information.
});
~cello_numBox = c[2].children[7]
.decimals_(1)
.clipLo_(-60.0)
.clipHi_(0.0)
.action_({
	arg obj;
	~cello_slider.valueAction_(obj.value.linlin(-60.0,0.0, 0.0,1.0)) // allows you to move slider via typing numbers
});

//comp view 4
~ringmod_cello_slider = c[4].children[0]
.action_({
	arg obj;
	var amp;
	amp = obj.value.linlin(0.0,1.0,-60.0,0.0);
	if(~ringmod_cello.isPlaying,
	{~ringmod_cello.set(\amp, amp)}
);

	~ringmod_cello_numBox.value_(obj.value.linlin(0.0,1.0,-60.0,0.0)); // updates numberbox with freq information.
});
~ringmod_cello_numBox = c[4].children[5]
.decimals_(1)
.clipLo_(-60.0)
.clipHi_(0.0)
.action_({
	arg obj;
	~ringmod_cello_slider.valueAction_(obj.value.linlin(-60.0,0.0, 0.0,1.0)) // allows you to move slider via typing numbers
});

~ringmod_viola_slider = c[4].children[1]
.action_({
	arg obj;
	var amp;
	amp = obj.value.linlin(0.0,1.0,-60.0,0.0);
	if(~ringmod_viola.isPlaying,
	{~ringmod_viola.set(\amp, amp)}
);

	~ringmod_viola_numBox.value_(obj.value.linlin(0.0,1.0,-60.0,0.0)); // updates numberbox with freq information.
});
~ringmod_viola_numBox = c[4].children[6]
.decimals_(1)
.clipLo_(-60.0)
.clipHi_(0.0)
.action_({
	arg obj;
	~ringmod_viola_slider.valueAction_(obj.value.linlin(-60.0,0.0, 0.0,1.0)) // allows you to move slider via typing numbers
});

~violin_1_glitch_slider = c[4].children[2]
.action_({
	arg obj;
	var amp;
	amp = obj.value.linlin(0.0,1.0,-60.0,0.0);
	if(~violin_1_glitch.isPlaying,
	{~violin_1_glitch.set(\amp, amp)}
);
	~violin_1_glitch_numBox.value_(obj.value.linlin(0.0,1.0,-60.0,0.0)); // updates numberbox with freq information.
});
~violin_1_glitch_numBox = c[4].children[7]
.decimals_(1)
.clipLo_(-60.0)
.clipHi_(0.0)
.action_({
	arg obj;
	~violin_1_glitch_slider.valueAction_(obj.value.linlin(-60.0,0.0, 0.0,1.0))
});

~violin_2_glitch_slider = c[4].children[3]
.action_({
	arg obj;
	var amp;
	amp = obj.value.linlin(0.0,1.0,-60.0,0.0);
	if(~violin_2_glitch.isPlaying,
	{~violin_2_glitch.set(\amp, amp)}
);
	~violin_2_glitch_numBox.value_(obj.value.linlin(0.0,1.0,-60.0,0.0)); // updates numberbox with freq information.
});
~violin_2_glitch_numBox = c[4].children[8]
.decimals_(1)
.clipLo_(-60.0)
.clipHi_(0.0)
.action_({
	arg obj;
	~violin_2_glitch_slider.valueAction_(obj.value.linlin(-60.0,0.0, 0.0,1.0))
});

~viola_glitch_slider = c[4].children[4]
.action_({
	arg obj;
	var amp;
	amp = obj.value.linlin(0.0,1.0,-60.0,0.0);
	if(~viola_glitch.isPlaying,
	{~viola_glitch.set(\amp, amp)}
);
	~viola_glitch_numBox.value_(obj.value.linlin(0.0,1.0,-60.0,0.0)); // updates numberbox with freq information.
});
~viola_glitch_numBox = c[4].children[9]
.decimals_(1)
.clipLo_(-60.0)
.clipHi_(0.0)
.action_({
	arg obj;
	~viola_glitch_slider.valueAction_(obj.value.linlin(-60.0,0.0, 0.0,1.0))
});

~cello_glitch_slider = c[5].children[0]
.action_({
	arg obj;
	var amp;
	amp = obj.value.linlin(0.0,1.0,-60.0,0.0);
	if(~cello_glitch.isPlaying,
	{~cello_glitch.set(\amp, amp)}
);
	~cello_glitch_numBox.value_(obj.value.linlin(0.0,1.0,-60.0,0.0)); // updates numberbox with freq information.
});
~cello_glitch_numBox = c[5].children[4]
.decimals_(1)
.clipLo_(-60.0)
.clipHi_(0.0)
.action_({
	arg obj;
	~cello_glitch_slider.valueAction_(obj.value.linlin(-60.0,0.0, 0.0,1.0))
});

~friction_slider = c[5].children[1]
.action_({
	arg obj;
	var amp;
	amp = obj.value.linlin(0.0,1.0,-60.0,0.0);
	if(~friction_violin_1.isPlaying,
	{~friction_violin_1.set(\amp, amp);
});

	if(~friction_violin_2.isPlaying,
	{~friction_violin_2.set(\amp, amp);
});
	~friction_numBox.value_(obj.value.linlin(0.0,1.0,-60.0,0.0)); // updates numberbox with freq information.
});
~friction_numBox = c[5].children[5]
.decimals_(1)
.clipLo_(-60.0)
.clipHi_(0.0)
.action_({
	arg obj;
	~friction_slider.valueAction_(obj.value.linlin(-60.0,0.0, 0.0,1.0))
});


~tube_delay_slider = c[5].children[2]
.action_({
	arg obj;
	var amp;
	amp = obj.value.linlin(0.0,1.0,-60.0,0.0);
	if(~cello_ntube.isPlaying,
	{~cello_ntube.set(\amp, amp)}
);

	if(~viola_ntube.isPlaying,
	{~viola_ntube.set(\amp, amp)}
);

	if(~cello_ntube_1.isPlaying,
	{~cello_ntube_1.set(\amp, amp)}
);

	if(~viola_ntube_1.isPlaying,
	{~viola_ntube_1.set(\amp, amp)}
);
	~tube_delay_numBox.value_(obj.value.linlin(0.0,1.0,-60.0,0.0)); // updates numberbox with freq information.
});
~tube_delay_numBox = c[5].children[6]
.decimals_(1)
.clipLo_(-60.0)
.clipHi_(0.0)
.action_({
	arg obj;
	~tube_delay_slider.valueAction_(obj.value.linlin(-60.0,0.0, 0.0,1.0))
});

~reverb_slider = c[5].children[3]
.action_({
	arg obj;
	var amp;
	amp = obj.value.linlin(0.0,1.0,-60.0,0.0);
	if(~reverb.isPlaying,
	{~reverb.set(\amp, amp)}
	);

	if(~reverb.isPlaying,
	{~reverb_violin_1.set(\amp, amp)}
	);

	if(~reverb.isPlaying,
	{~reverb_violin_2.set(\amp, amp)}
	);

	if(~reverb.isPlaying,
	{~reverb_viola.set(\amp, amp)}
	);

	~reverb_numBox.value_(obj.value.linlin(0.0,1.0,-60.0,0.0)); // updates numberbox with freq information.
});
~reverb_numBox = c[5].children[7]
.decimals_(1)
.clipLo_(-60.0)
.clipHi_(0.0)
.action_({
	arg obj;
	~reverb_slider.valueAction_(obj.value.linlin(-60.0,0.0, 0.0,1.0))
});



~glitch_stream_slider = c[3].children[0]
.action_({
	arg obj;
	var amp;
	~glitch_stream_val = obj.value.linlin(0.0,1.0,-60.0,0.0);
	~glitch_stream_numBox.value_(obj.value.linlin(0.0,1.0,-60.0,0.0)); // updates numberbox with freq information.
});
~glitch_stream_numBox = c[3].children[4]
.decimals_(1)
.clipLo_(-60.0)
.clipHi_(0.0)
.action_({
	arg obj;
	~glitch_stream_slider.valueAction_(obj.value.linlin(-60.0,0.0, 0.0,1.0))
});

~metal_stream_slider = c[3].children[1]
.action_({
	arg obj;
	var amp;
	~metal_stream_val = obj.value.linlin(0.0,1.0,-60.0,0.0);
	~metal_stream_numBox.value_(obj.value.linlin(0.0,1.0,-60.0,0.0)); // updates numberbox with freq information.
});
~metal_stream_numBox = c[3].children[5]
.decimals_(1)
.clipLo_(-60.0)
.clipHi_(0.0)
.action_({
	arg obj;
	~metal_stream_slider.valueAction_(obj.value.linlin(-60.0,0.0, 0.0,1.0))
});


~noise_1_slider = c[3].children[2]
.action_({
	arg obj;
	var amp;
	amp = obj.value.linlin(0.0,1.0,-60.0,0.0);
	if(~noise_1.isPlaying,
	{~noise_1.set(\amp, amp)}
);


	if(~grit_noise_1.isPlaying,
	{~grit_noise_1.set(\amp, amp)}
);
	~noise_1_numBox.value_(obj.value.linlin(0.0,1.0,-60.0,0.0)); // updates numberbox with freq information.
});
~noise_1_numBox = c[3].children[6]
.decimals_(1)
.clipLo_(-60.0)
.clipHi_(0.0)
.action_({
	arg obj;
	~noise_1_slider.valueAction_(obj.value.linlin(-60.0,0.0, 0.0,1.0))
});

~noise_2_slider = c[3].children[3]
.action_({
	arg obj;
	var amp;
	amp = obj.value.linlin(0.0,1.0,-60.0,0.0);
	if(~noise_2.isPlaying,
	{~noise_2.set(\amp, amp)}
);
	~noise_2_numBox.value_(obj.value.linlin(0.0,1.0,-60.0,0.0)); // updates numberbox with freq information.
});
~noise_2_numBox = c[3].children[7]
.decimals_(1)
.clipLo_(-60.0)
.clipHi_(0.0)
.action_({
	arg obj;
	~noise_2_slider.valueAction_(obj.value.linlin(-60.0,0.0, 0.0,1.0))
});

//comp view6
~contact_mic_1_slider = c[6].children[0]
.action_({
	arg obj;
	var amp;
	amp = obj.value.linlin(0.0,1.0,-60.0, 0.0);
	if(~contact_mic_1.isPlaying,
	{~contact_mic_1.set(\amp, amp)}
);
	~contact_mic_1_numBox.value_(obj.value.linlin(0.0,1.0,-60.0,0.0)); // updates numberbox with freq information.
});
~contact_mic_1_numBox = c[6].children[3]
.decimals_(1)
.clipLo_(-60.0)
.clipHi_(0.0)
.action_({
	arg obj;
	~contact_mic_1_val = obj.value.linlin(0.0, 1.0, -60.0,0.0);
	~contact_mic_1_slider.valueAction_(obj.value.linlin(-60.0,0.0, 0.0,1.0)) // allows you to move slider via typing numbers
});


~contact_mic_1_freq_slider = c[6].children[1]
.action_({
	arg obj;
	var freq;
	freq = obj.value.linlin(0.0,1.0,100.0,8000.0);
	~contact_mic_1_freq_val=obj.value;
	if(~contact_mic_1.isPlaying,
	{~contact_mic_1.set(\freq, freq)}
);	~contact_mic_1_freq_numBox.value_(obj.value.linlin(0.0,1.0,100.0,8000.0)); // updates numberbox with freq information.
});

~contact_mic_1_freq_numBox = c[6].children[4]
.decimals_(1)
.clipLo_(100.0)
.clipHi_(8000.0)
.action_({
	arg obj;
	~contact_mic_1_freq_slider.valueAction_(obj.value.linlin(100.0,8000.0, 0.0,1.0)) // allows you to move slider via typing numbers
});


~metal_sheet_impulses_1_slider = c[6].children[2]
.action_({
	arg obj;
	var amp;
	amp = obj.value.linlin(0.0,1.0,-90.0,0);
	~metal_sheet_impulses_val=obj.value;
	if(~metal_sheet_impulses.isPlaying,
	{~metal_sheet_impulses.set(\amp, amp)}
);
	~metal_sheet_impulses_1_numBox.value_(obj.value.linlin(0.0,1.0,-90.0,0)); // updates numberbox with freq information.
});

~metal_sheet_impulses_1_numBox = c[6].children[5]
.decimals_(1)
.clipLo_(-90.0)
.clipHi_(0.0)
.action_({
	arg obj;
	~metal_sheet_impulses_1_slider.valueAction_(obj.value.linlin(-90.0,0, 0.0,1.0)); // allows you to move slider via typing numbers
	});

~sub_slider = c[7].children[0]
.action_({
	arg obj;
	var amp;
	amp = obj.value.linlin(0.0,1.0,-60.0,0);
	~sub_val=obj.value;
	if(~sub.isPlaying,
	{~sub.set(\amp, amp)}
);
	~sub_numBox.value_(obj.value.linlin(0.0,1.0,-60.0,0)); // updates numberbox with freq information.
});

~sub_numBox = c[7].children[5]
.decimals_(1)
.clipLo_(-60.0)
.clipHi_(0.0)
.action_({
	arg obj;
	~sub_slider.valueAction_(obj.value.linlin(-60.0,0, 0.0,1.0)); // allows you to move slider via typing numbers
	});

~soft_glitch_slider = c[7].children[1]
.action_({
	arg obj;
	var amp;
	~soft_glitch_val = obj.value.linlin(0.0,1.0,-60.0, 0);

	~soft_glitch_numBox.value_(obj.value.linlin(0.0,1.0,-60.0,0)); // updates numberbox with freq information.
});

~soft_glitch_numBox = c[7].children[6]
.decimals_(1)
.clipLo_(-60.0)
.clipHi_(0.0)
.action_({
	arg obj;
	~soft_glitch_slider.valueAction_(obj.value.linlin(-60.0,0, 0.0,1.0)); // allows you to move slider via typing numbers
	});

~violin_2_ringmod_slider = c[7].children[2]
.action_({
	arg obj;
	var amp;
	amp = obj.value.linlin(0.0,1.0,-60.0,0);
	if(~ringmod_violin_2.isPlaying,
	{~ringmod_violin_2.set(\amp, amp)}
);
	~violin_2_ringmod_numBox.value_(obj.value.linlin(0.0,1.0,-60.0,0)); // updates numberbox with freq information.
});

~violin_2_ringmod_numBox = c[7].children[7]
.decimals_(1)
.clipLo_(-60.0)
.clipHi_(0.0)
.action_({
	arg obj;
	~violin_2_ringmod_slider.valueAction_(obj.value.linlin(-60.0,0, 0.0,1.0)); // allows you to move slider via typing numbers
	});

~low_freq_slider = c[7].children[3]
.action_({
	arg obj;
	var amp;
	~low_freq_val = obj.value.linlin(0.0,1.0,-60.0,0);

	~low_freq_numBox.value_(obj.value.linlin(0.0,1.0,-60.0,0)); // updates numberbox with freq information.
});

~low_freq_numBox = c[7].children[8]
.decimals_(1)
.clipLo_(-60.0)
.clipHi_(0.0)
.action_({
	arg obj;
	~low_freq_slider.valueAction_(obj.value.linlin(-60.0,0, 0.0,1.0)); // allows you to move slider via typing numbers
	});

~delay_slider = c[7].children[4]
.action_({
	arg obj;
	var amp;
	amp = obj.value.linlin(0.0,1.0,-60.0,0);
	if(~delay.isPlaying,
	{~delay.set(\amp, amp)}
);
	~delay_numBox.value_(obj.value.linlin(0.0,1.0,-60.0,0)); // updates numberbox with freq information.
});

~delay_numBox = c[7].children[9]
.decimals_(1)
.clipLo_(-60.0)
.clipHi_(0.0)
.action_({
	arg obj;
	~delay_slider.valueAction_(obj.value.linlin(-60.0,0, 0.0,1.0)); // allows you to move slider via typing numbers
	});

};

//7. Make CleanUp
~cleanup = { // kills all processes on server quit
	s.newBusAllocators;
	ServerBoot.removeAll;
	ServerTree.removeAll;
	ServerQuit.removeAll;
};



ServerBoot.add(~makeGui);
ServerBoot.add(~makeBuffers); // "ServerBoot" happens when server boots.
ServerQuit.add(~cleanup); // "ServerQuit" happens when server is Quit.

//9. Make Busses & SynthDefs /////////////////////////////////////////////////////////////////////////////////////////////////////////

s.waitForBoot({ // Wait to boot server once contained functions have been evaluated.

	s.sync;

	//Busses Here
	~violin_1_fx_send = Bus.audio(s, 1);
	~violin_2_fx_send = Bus.audio(s, 1);
	~viola_fx_send = Bus.audio(s, 1);
	~cello_fx_send = Bus.audio(s, 1);
	~ringmod_cello_out = Bus.audio(s, 2);
	~empty_bus = Bus.audio(s, 1);
	~fft_fx_out_1 = Bus.audio(s, 1);
	~fft_fx_out_2 = Bus.audio(s, 1);
	~fft_fx_out_3 = Bus.audio(s, 1);
	~fft_fx_out_4 = Bus.audio(s, 1);

	s.sync; // Server syncs to language

	//Violin 1
	SynthDef(\violin_1, {
		arg amp = (-60), gate=1, rel=30, atk=0.005, sus=0, freq, high_pass_freq=40, high_pass_mix=1;
		var env, sig, sig_dry;
		sig = SoundIn.ar(~violin_1_in);
		env = EnvGen.kr(Env.adsr(sustainLevel: 1.0), gate, doneAction:2);
		sig_dry = sig * amp.dbamp.lag(0.1);
		sig_dry = XFade2.ar(sig, HPF.ar(sig_dry, high_pass_freq), (high_pass_mix*2-1));
		Out.ar(~violin_1_out, sig_dry);
		Out.ar(~violin_1_fx_send, sig);
	}).add;

	SynthDef(\violin_2, {
		arg amp = (-60), gate=1, rel=30, atk=0.005, sus=0, freq, high_pass_freq=40, high_pass_mix=1;
		var env, sig, sig_dry;
		sig = SoundIn.ar(~violin_2_in);
env = EnvGen.kr(Env.adsr(sustainLevel: 1.0), gate, doneAction:2);
		sig_dry = sig * amp.dbamp.lag(0.1);
		sig_dry = XFade2.ar(sig, HPF.ar(sig_dry, high_pass_freq), (high_pass_mix*2-1));
		Out.ar(~violin_2_out, sig_dry);
		Out.ar(~violin_2_fx_send, sig);
	}).add;

	SynthDef(\viola, {
		arg amp = (-60), gate=1, rel=30, atk=0.005, sus=0, freq, high_pass_freq=40, high_pass_mix=1;
		var env, sig, sig_dry;
		sig = SoundIn.ar(~viola_in);
		env = EnvGen.kr(Env.adsr(sustainLevel: 1.0), gate, doneAction:2);
		sig_dry = sig * amp.dbamp.lag(0.1);
		sig_dry = XFade2.ar(sig, HPF.ar(sig_dry, high_pass_freq), (high_pass_mix*2-1));
		Out.ar(~viola_out, sig_dry);
		Out.ar(~viola_fx_send, sig);
	}).add;

	SynthDef(\cello, {
		arg amp = (-60), gate=1, rel=30, atk=0.005, sus=0, high_pass_freq=40, high_pass_mix=1;
		var env, sig, sig_dry;
		sig = SoundIn.ar(~cello_in);
		env = EnvGen.kr(Env.adsr(sustainLevel: 1.0), gate, doneAction:2);
		sig_dry = sig * amp.dbamp.lag(0.1);
		sig_dry = XFade2.ar(sig, HPF.ar(sig_dry, high_pass_freq), (high_pass_mix*2-1));
		Out.ar(~cello_out, sig_dry);
		Out.ar(~cello_fx_send, sig);
	}).add;

	// Contact Mic Input to Tranducer NEED TO TEST
	SynthDef(\feedback_1, {
		arg amp = (-60), gate=1, rel=30, atk=0.005, sus=1, freq=12000, input_bus_left=~contact_mic_1_in, input_bus_right=~contact_mic_2_in, dec=0.05, curve=(-8), mod_amp=(-60), in_mod_bus=~cello_fx_send, out_left, out_right;
		var in, env, sig_left, sig_right, in_left, in_right;
		in_left = SoundIn.ar(input_bus_left);
		in_right = SoundIn.ar(input_bus_right);
		env = EnvGen.kr(Env.adsr(atk, dec, sus, rel, curve: curve), gate, doneAction:2);
		sig_left = LPF.ar(in_left, freq.lag(0.1));
		sig_right = LPF.ar(in_right, freq.lag(0.1));
		sig_left = sig_left * amp.dbamp.lag(0.1) * env;
		sig_right = sig_right * amp.dbamp.lag(0.1) * env;
		Out.ar(out_left, sig_left);
		Out.ar(out_right, sig_right);
	}).add;

	SynthDef(\ringmod, {
		arg amp = 0, buf, rate_low, rate_high, gate=1, atk, dec, sus, rel, curve=(-10), pan_freq = 2, low_pass_freq=1000, low_pass_mix=0, high_pass_freq=100, high_pass_mix=0, in_bus, mod_amp=0, out, mul=1;
		var car, mod, sig, mod1, mod2, env, amp_trig, chain, onset;
		env = EnvGen.kr(Env.adsr(atk, dec, sus, rel, curve: curve), gate, doneAction: 2);
		car = In.ar(in_bus);
		mod = PlayBuf.ar(1, buf, RMS.kr(car).linlin(0.0, 0.1, rate_low, rate_high), 1, 0, 1);
		sig = DiodeRingMod.ar(car: car, mod: mod)* RMS.kr(car).linlin(0.0, 0.1, 0.0, 1.0);
		sig = XFade2.ar(sig, LPF.ar(sig, low_pass_freq), (low_pass_mix*2-1));
	    sig = XFade2.ar(sig, HPF.ar(sig, high_pass_freq), (high_pass_mix*2-1));
		sig = sig * env * amp.dbamp.lag(0.1) * mul;
		Out.ar(out, sig);
	}).add;

	SynthDef(\grain_delay, {
		arg trig_freq_low, trig_freq_high, grain_dev, trig_fft_low, trig_fft_high, fft_dev, trig_freeze_low, trig_freeze_high, freeze_dev, grain_size_low, grain_size_high, gate, amp, in_bus, morph_amount=1.0, atk, dec, sus, rel, curve=(-8), out;
		var pan, env, in, sig, buf, temp, sig1, chain, sig2, fft_mix=0, trig, sig3, trig1, trig2, chainA, chainB;
		//in = In.ar(in_bus);
		in = In.ar(in_bus);
		sig3=0;
		sig1 =0;
		env = EnvGen.kr(Env.adsr(atk, dec, sus, rel, curve: curve), gate, doneAction: 2);
		trig = GaussTrig.kr(RMS.ar(in).linlin(0.0, 0.1, trig_freq_low, trig_freq_high), grain_dev);
		trig1 = GaussTrig.kr(RMS.ar(in).linlin(0.0, 0.1, trig_fft_low, trig_fft_high), fft_dev);
		trig2 = GaussTrig.kr(RMS.ar(in).linlin(0.0, 0.1, trig_freeze_low, trig_freeze_high), freeze_dev);

		10.do{
			temp = DelayN.ar(in, 3.0, {Rand(0.1, 3.0)});
			temp = GrainIn.ar(1,
				GaussTrig.kr(RMS.ar(in).linlin(0.0, 0.1, {Rand(1, 3)}, {Rand(10, 30)}),
					grain_dev), TRand.kr(grain_size_low, grain_size_high, trig), temp);
			sig1 = sig1 + temp;
		};

		chainA = FFT(LocalBuf(1024), sig1);
		chainB = FFT(LocalBuf(1024), sig1);
		chainA = PV_BinScramble(chainA, RMS.ar(in).linlin(0.0, 0.1, 0.0, 0.3), 0.5, trig);
		chainA = PV_Freeze(chainA, ToggleFF.kr(trig2));
		chainB = PV_MagSmooth(chainB, 1 - RMS.ar(in).linlin(0.0, 0.1, 0.00001, 0.5));
		chainB = PV_MagSmear(chainB, RMS.ar(in).linlin(0.0, 0.1, 0.00001, 100));
		chainB = PV_BinShift(chainB, RMS.ar(in).linlin(0.0, 0.1, 0.25, 0.5));

		chain = PV_Morph(chainB, chainA, RMS.ar(in).linlin(0.0, 0.1, 0.0, morph_amount));
		sig3 = IFFT(chain);
        sig3 = Limiter.ar(sig3, 1.0);
		sig3 = sig3 * env * amp.dbamp.lag(0.1);
		Out.ar(out, sig3);
		//Out.ar(0, buf*amp.dbamp.lag(0.1));
	}).add;

	SynthDef(\playbuf, {
		arg bufnum, rate=1, trig, startPos=0, loop=1, amp=(-20), atk=0.05, dec=0.1, sus=1, rel=0.05, curve= (-8), gate=1, high_pass_freq=900, low_pass_freq=100, low_pass_mix=0, high_pass_mix=0;
		var sig, env;
		sig = PlayBuf.ar(2, bufnum, rate, trig, startPos, loop);
		env = EnvGen.kr(Env.adsr(atk, dec, sus, rel, curve: curve), gate, doneAction: 2);
		sig = sig * env * amp.dbamp;
		sig = XFade2.ar(sig, LPF.ar(sig, low_pass_freq), (low_pass_mix*2-1));
		sig = XFade2.ar(sig, HPF.ar(sig, high_pass_freq);, (high_pass_mix*2-1));
		Out.ar(0, sig);
	}).add;

	SynthDef(\pattern_buf, {
		arg atk=0, sus=0, rel=3, c1=6, c2=(-6),
		buf=0, rate=1, spos=0, freq=440, rq=1, bpfmix=0,
		pan_pos=0, amp=1.0, wet=0, distmix=0, out=~inputbus1, loop=1, combmix=0, delayTime=0.2, decayTime=1.0,
		low_pass_freq, low_pass_mix, high_pass_freq, high_pass_mix;
		var sig, env;
		env = EnvGen.kr(Env([0.0,0.2,0.2,0.0],[atk,sus,rel],[c1,0,c2]),doneAction:2);
		sig = PlayBuf.ar(1, buf, rate*BufRateScale.ir(buf),startPos:spos, loop: loop);
	    sig = XFade2.ar(sig, LPF.ar(sig, low_pass_freq), (low_pass_mix*2-1));
	    sig = XFade2.ar(sig, HPF.ar(sig, high_pass_freq);, (high_pass_mix*2-1));
	    sig = sig * env;
		sig = Pan2.ar(sig, pan_pos);
		Out.ar(out, sig * amp.dbamp.lag(0.1));
}).add;



 SynthDef(\pattern_buf_4, {
		arg atk=0, sus=0, rel=3, c1=6, c2=(-6),
		buf=0, rate=1, spos=0, freq=440, rq=1, bpfmix=0,
		pan_pos=0, amp=1.0, wet=0, distmix=0, out=~inputbus1, loop=1, combmix=0, delayTime=0.2, decayTime=1.0,
		low_pass_freq, low_pass_mix, high_pass_freq, high_pass_mix, pan_pos_x, pan_pos_y;
		var sig, env;
		env = EnvGen.kr(Env([0.0,0.2,0.2,0.0],[atk,sus,rel],[c1,0,c2]),doneAction:2);
		sig = PlayBuf.ar(1, buf, rate*BufRateScale.ir(buf),startPos:spos, loop: loop);
	    sig = XFade2.ar(sig, LPF.ar(sig, low_pass_freq), (low_pass_mix*2-1));
	    sig = XFade2.ar(sig, HPF.ar(sig, high_pass_freq);, (high_pass_mix*2-1));
	    sig = sig * env;
		sig = Pan4.ar(sig, pan_pos_x, pan_pos_y);
		Out.ar(out, sig * amp.dbamp.lag(0.1));
}).add;

	SynthDef(\pattern_buf_rumble, {
		arg atk=0, sus=0, rel=3, c1=6, c2=(-6),
		buf=0, rate=1, spos=0, freq=440, rq=1, bpfmix=0,
		pan_pos=0, amp=1.0, wet=0, distmix=0, out=~inputbus1, loop=1, combmix=0, delayTime=0.2, decayTime=1.0,
		low_pass_freq, low_pass_mix, high_pass_freq, high_pass_mix, out_sub;
		var sig, env, sig_1;
		env = EnvGen.kr(Env([0.0,0.2,0.2,0.0],[atk,sus,rel],[c1,0,c2]),doneAction:2);
		sig = PlayBuf.ar(1, buf, rate*BufRateScale.ir(buf),startPos:spos, loop: loop);
	    sig = XFade2.ar(sig, LPF.ar(sig, low_pass_freq), (low_pass_mix*2-1));
	    sig = XFade2.ar(sig, HPF.ar(sig, high_pass_freq);, (high_pass_mix*2-1));
	    sig = sig * env;
		sig_1 = Pan2.ar(sig, pan_pos);
		Out.ar(out, HPF.ar(sig_1 * amp.dbamp.lag(0.1), 100));
		Out.ar(out_sub, LPF.ar(sig * amp.dbamp.lag(0.1), 100));

}).add;


	SynthDef(\friction_fft_1_line, {
		arg bufnum1, bufnum2, amp=(-3), mass=1.0, lpf_freq=10000, noise_speed=20, atk=0.05, dec=0.1, sus=1, rel=0.05, curve=(-10), gate=1, line_start=(-1), line_end=1, line_dur=10, input_bus, out, fx_out=~empty_bus, smooth_speed=5,smooth_max=0.1 ;
		var sig, in, kernel, env, chain, fft_sig, sig_mix, trig;
		in = In.ar(input_bus); // replace with soundin for live sound
		env = EnvGen.kr(Env.adsr(atk, dec, sus, rel, curve: curve), gate, doneAction: 2);
		//FRIC//
		sig = Friction.ar(in,
			friction: RMS.kr(in).linlin(0.0, 0.1, 5.41322e-5, 1.75584e-5).clip(lo: 1.75584e-5, hi: 5.41322e-5),
			mass: LFBrownNoise2.kr(noise_speed).range(0.2, 1.0),
			spring: RMS.kr(in).linlin(0.0, 0.1, 0.4, 0.1).clip(lo: 0.1, hi: 0.4));
		sig = LPF.ar(sig, lpf_freq);
		sig = Limiter.ar(sig, 0.9);

		//FFT//
		chain = FFT(LocalBuf(512), in);
	    chain = PV_BinShift(chain, RMS.kr(in).linlin(0.0, 0.1, 0.8, 1.3).clip(0.8, 1.3).lag(0.2),       RMS.kr(in).linlin(0.0, 0.1, -2, 0.5).clip(-2, 0.5).lag(0.2));
		chain = PV_MagSmooth(chain, 1 - LFBrownNoise2.kr(10).range(0.001, 0.0001));
	    fft_sig = IFFT(chain);

		sig_mix = XFade2.ar(sig, fft_sig, Line.kr(line_start, line_end, line_dur)); /*fft_mix*/

		sig_mix = sig_mix * amp.dbamp.lag(0.1) * env;
		Out.ar(out, sig_mix);
	}).add;



	SynthDef(\friction_fft_1_rms, {
		arg bufnum1, bufnum2, amp=(-3), mass=1.0, lpf_freq=10000, noise_speed=20, atk=0.05, dec=0.1, sus=1, rel=0.05, curve=(-10), gate=1, line_start=(-1), line_end=1, line_dur=10, mix_low=(-1.0), mix_high=(-1.0), input_bus, out, smooth_speed=5,smooth_max=0.1, fx_out=~empty_bus, fft_mix=1.0;
		var sig, in, kernel, env, chain, fft_sig, sig_mix, trig;
		in = In.ar(input_bus); // replace with soundin for live sound


		env = EnvGen.kr(Env.adsr(atk, dec, sus, rel, curve: curve), gate, doneAction: 2);
		//FRIC//
		sig = Friction.ar(in,
			friction: RMS.kr(in).linlin(0.0, 0.1, 5.41322e-5, 3.75584e-5).clip(lo: 3.75584e-5, hi: 5.41322e-5),
			mass: LFBrownNoise2.kr(noise_speed).range(0.6, 1.0),
			spring: RMS.kr(in).linlin(0.0, 0.1, 0.4, 0.1).clip(lo: 0.1, hi: 0.4));
		sig = LPF.ar(sig, lpf_freq);
		sig = Limiter.ar(sig, 0.9);

		//FFT//
		chain = FFT(LocalBuf(512), in);
		trig = Onsets.kr(chain, 0.01);
	    chain = PV_BinShift(chain, RMS.kr(in).linlin(0.0, 0.1, TRand.kr(0.5, 1.0, trig), TRand.kr(1.2, 2.0, trig)).clip(0.8, 1.3).lag(0.2), RMS.kr(in).linlin(0.0, 0.1, TRand.kr(-4, -2, trig), TRand.kr(0.5, 1.0, trig)).clip(-2, 0.5).lag(0.2));
		chain = PV_BinScramble(chain, RMS.kr(in).linlin(0.0, 0.1, 0.001, 0.99).clip(0.001, 0.99), RMS.kr(in).linlin(0.0, 0.1, 0.001, TRand.kr(0.7, 0.99, trig)).clip(0.001, 0.99), trig);
	    fft_sig = IFFT(chain);

		sig_mix = XFade2.ar(sig, fft_sig, fft_mix);

		sig_mix = sig_mix * amp.dbamp.lag(0.1) * env;
		Out.ar(out, sig_mix);
		//Out.ar(fx_out, sig_mix);
	}).add;


	SynthDef(\metal_sheet_impulses, {
		arg out=0, amp, env, atk, dec=0.1, sus=1, rel, curve=(-10), gate, trig_speed=3, filter_low=100, filter_high=300, filter_mix, dust_speed=3, rq=0.008, mul=1, out_left, out_right;
		var sig, trig;
		sig = Dust.ar(dust_speed, mul);
		trig = GaussTrig.kr(trig_speed, 1);
		env = EnvGen.kr(Env.adsr(atk, dec, sus, rel, curve: curve), gate, doneAction:2);
		sig = sig * env * amp.dbamp.lag(0.1);
		Out.ar(TIRand.kr(out_left, out_right, trig), sig);
	}).add;

	SynthDef(\metal_sheet_impulses_line, {
		arg out=0, amp, env, atk, dec, sus, rel, curve=(-10), gate, trig_speed=3, filter_low=100, filter_high=300, filter_mix, dust_speed=3, rq=0.008, mul=1, line_start, line_end, line_dur, out_left, out_right;
		var sig, trig;

		sig = Dust.ar(Line.kr(line_start, line_end, line_dur, 1), 5);
		trig = Dust.kr(Line.kr(line_start, line_end, line_dur, 1));

		env = EnvGen.kr(Env.adsr(atk, dec, sus, rel, curve: curve ), gate, doneAction:2);

		sig = sig * env * amp.dbamp.lag(0.1);
		Out.ar(TIRand.kr(out_left, out_right, trig), sig);
	}).add;

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

	SynthDef(\reverb, {
		arg predelay=0.1, revtime=1.8,
		lpf=4500, mix=1, amp=(-40), out=0, sendsOut=~reverbOut, gate=1, atk=0, dec=10, sus=0.6, rel=0.05, c1=8, c2=(-8), input_bus;
		var dry, wet, temp, sig, env, temp1, in;
		in = In.ar(input_bus, 1);
		env = EnvGen.kr(Env.adsr(atk, dec, sus, rel, curve: -10), gate, doneAction:2);
		sig = 0;
		temp = DelayN.ar(in, 0, 0.1, predelay, mul: 1);
		temp = temp * env;
		30.do{
			temp = AllpassN.ar(temp, {Rand(0.001,0.5)}, {Rand(0.001,0.5)}, {Rand(30.0, 60.0)}, amp.dbamp.lag(0.1));
			temp = LPF.ar(temp, {Rand(700,10000)});
			sig = sig + temp;

		};
		Out.ar(out, sig);
	}).add;

	SynthDef(\sub, {
		arg amp=0, out_bus=0, atk=0.05, sus=0.6, dec=20, rel=0.05, curve= (-10), gate=1, time=180;
		var env, sig;
		env = EnvGen.kr(Env.adsr(atk, dec, sus, rel, curve: curve), gate, doneAction: 2);
	sig = SinOsc.ar(XLine.kr(41.203, 27.5, time));
		sig = sig * env * amp.dbamp.lag(0.1);
		Out.ar(out_bus, sig);
	}).add;

	SynthDef(\delay, {
	arg amp=(-6), out=2, atk=0.05, sus=0.6, dec=20, rel=0.05, curve=(-10), gate=1, time=180, predelay=0.1, input_bus;
		var env, sig, temp, in;
	    in = In.ar(input_bus);
		env = EnvGen.kr(Env.adsr(atk, dec, sus, rel, curve: curve), gate, doneAction: 2);

	    sig = 0;

	    temp = DelayN.ar(in, 0, 0.1, predelay, mul: 3);
	    temp = HPF.ar(temp, 1000);
	5.do{
		temp =  SwitchDelay.ar(temp, delaytime: {Rand(0.1, 1)} ,delayfactor: {Rand(0.01, 0.3)}, wetlevel: 1, drylevel: 0);
		temp = FreqShift.ar(temp, freq: ({Rand(-1000, -300 )} + {LFBrownNoise2.kr({Rand(1, 20)}).range(0, {Rand(-300, -600)})}), phase: 0, mul: 1, add: 0);
			sig = sig + temp;
		};
		sig = sig * env * amp.dbamp.lag(0.1);

	    Out.ar(out, sig);
	}).add;

	SynthDef(\ntube_9, {
	arg amp=(-3), loss=0.99, atk=0.05, dec=0.1, sus=1, rel=0.05, curve=(-10), gate=1, line_start=(-1), line_end=1, line_dur=10, mix_low=(-1.0), mix_high=(-1.0), input_bus, out;
		var sig, in, freq, hasFreq, env, chain, fft_sig, sig_mix, lossarray, karray, delayarray;
	    lossarray = ~loss_array_9;
	    karray = ~k_array_9;
	    delayarray = ~delay_array_9;
		//in = In.ar(input_bus); // r1eplace with soundin for live sound
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
		sig_mix = XFade2.ar(sig, fft_sig, RMS.kr(in).linlin(0.0, 0.1, mix_low, mix_high).clip(-1.0, 1.0)); /*fft_mix*/
		//sig_mix = sig_mix * RMS.kr(in).linlin(0.0, 0.1, 0.5, 0.8).clip(0.2, 0.8).lag(0.1);
		sig_mix = sig_mix * amp.dbamp.lag(0.1) * env;
		Out.ar(out, sig_mix);
	}).add;

	SynthDef(\ntube_8, {
	arg amp=(-3), loss=0.99, atk=0.05, dec=0.1, sus=1, rel=0.05, curve=(-10), gate=1, line_start=(-1), line_end=1, line_dur=10, mix_low=(-1.0), mix_high=(-1.0), input_bus, out;
		var sig, in, freq, hasFreq, env, chain, fft_sig, sig_mix, lossarray, karray, delayarray;
	    lossarray = ~loss_array_8;
	    karray = ~k_array_8;
	    delayarray = ~delay_array_8;
		//in = In.ar(input_bus); // r1eplace with soundin for live sound
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
		sig_mix = XFade2.ar(sig, fft_sig, RMS.kr(in).linlin(0.0, 0.1, mix_low, mix_high).clip(-1.0, 1.0)); /*fft_mix*/
		//sig_mix = sig_mix * RMS.kr(in).linlin(0.0, 0.1, 0.5, 0.8).clip(0.2, 0.8).lag(0.1);
		sig_mix = sig_mix * amp.dbamp.lag(0.1) * env;
		Out.ar(out, sig_mix);
	}).add;

	SynthDef(\ntube_7, {
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
		chain = FFT(LocalBuf(1024), sig);
		chain = PV_MagSmooth(chain, 1 - RMS.ar(in).linlin(0.0, 0.1, 0.00001, 0.5));
		chain = PV_MagSmear(chain, RMS.ar(in).linlin(0.0, 0.1, 0.001, 100));
		chain = PV_BinShift(chain, RMS.ar(in).linlin(0.0, 0.1, 0.5, 10));

		fft_sig = IFFT(chain);
		sig_mix = XFade2.ar(sig, fft_sig, RMS.kr(in).linlin(0.0, 0.1, mix_low, mix_high).clip(-1.0, 1.0)); /*fft_mix*/
		//sig_mix = sig_mix * RMS.kr(in).linlin(0.0, 0.1, 0.5, 0.8).clip(0.2, 0.8).lag(0.1);
		sig_mix = sig_mix * amp.dbamp.lag(0.1) * env;
		Out.ar(out, sig_mix);
	}).add;

	SynthDef(\ntube_6, {
	arg amp=(-3), loss=0.99, atk=0.05, dec=0.1, sus=1, rel=0.05, curve=(-10), gate=1, line_start=(-1), line_end=1, line_dur=10, mix_low=(-1.0), mix_high=(-1.0), input_bus, out;
		var sig, in, freq, hasFreq, env, chain, fft_sig, sig_mix, lossarray, karray, delayarray;
	    lossarray = ~loss_array_6;
	    karray = ~k_array_6;
	    delayarray = ~delay_array_6;
		//in = In.ar(input_bus); // r1eplace with soundin for live sound
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
		sig_mix = XFade2.ar(sig, fft_sig, RMS.kr(in).linlin(0.0, 0.1, mix_low, mix_high).clip(-1.0, 1.0)); /*fft_mix*/
		//sig_mix = sig_mix * RMS.kr(in).linlin(0.0, 0.1, 0.5, 0.8).clip(0.2, 0.8).lag(0.1);
		sig_mix = sig_mix * amp.dbamp.lag(0.1) * env;
		Out.ar(out, sig_mix);
	}).add;

	SynthDef(\ntube_5, {
	arg amp=(-3), loss=0.99, atk=0.05, dec=0.1, sus=1, rel=0.05, curve=(-10), gate=1, line_start=(-1), line_end=1, line_dur=10, mix_low=(-1.0), mix_high=(-1.0), input_bus, out;
		var sig, in, freq, hasFreq, env, chain, fft_sig, sig_mix, lossarray, karray, delayarray;
	    lossarray = ~loss_array_5;
	    karray = ~k_array_5;
	    delayarray = ~delay_array_5;
		//in = In.ar(input_bus); // r1eplace with soundin for live sound
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
		sig_mix = XFade2.ar(sig, fft_sig, RMS.kr(in).linlin(0.0, 0.1, mix_low, mix_high).clip(-1.0, 1.0)); /*fft_mix*/
		//sig_mix = sig_mix * RMS.kr(in).linlin(0.0, 0.1, 0.5, 0.8).clip(0.2, 0.8).lag(0.1);
		sig_mix = sig_mix * amp.dbamp.lag(0.1) * env;
		Out.ar(out, sig_mix);
	}).add;

	SynthDef(\ntube_1, {
	arg amp=(-3), loss=0.99, atk=0.05, dec=0.1, sus=1, rel=0.05, curve=(-10), gate=1, line_start=(-1), line_end=1, line_dur=10, mix_low=(-1.0), mix_high=(-1.0), input_bus, out;
		var sig, in, freq, hasFreq, env, chain, fft_sig, sig_mix, lossarray, karray, delayarray;
	    lossarray = ~loss_array_1;
	    karray = ~k_array_1;
	    delayarray = ~delay_array_1;
		//in = In.ar(input_bus); // r1eplace with soundin for live sound
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
		sig_mix = XFade2.ar(sig, fft_sig, RMS.kr(in).linlin(0.0, 0.1, mix_low, mix_high).clip(-1.0, 1.0)); /*fft_mix*/
		//sig_mix = sig_mix * RMS.kr(in).linlin(0.0, 0.1, 0.5, 0.8).clip(0.2, 0.8).lag(0.1);
		sig_mix = sig_mix * amp.dbamp.lag(0.1) * env;
		Out.ar(out, sig_mix);
	}).add;

	SynthDef(\ntube_2, {
	arg amp=(-3), loss=0.99, atk=0.05, dec=0.1, sus=1, rel=0.05, curve=(-10), gate=1, line_start=(-1), line_end=1, line_dur=10, mix_low=(-1.0), mix_high=(-1.0), input_bus, out;
		var sig, in, freq, hasFreq, env, chain, fft_sig, sig_mix, lossarray, karray, delayarray;
	    lossarray = ~loss_array_2;
	    karray = ~k_array_2;
	    delayarray = ~delay_array_2;
		//in = In.ar(input_bus); // r1eplace with soundin for live sound
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
		sig_mix = XFade2.ar(sig, fft_sig, RMS.kr(in).linlin(0.0, 0.1, mix_low, mix_high).clip(-1.0, 1.0)); /*fft_mix*/
		//sig_mix = sig_mix * RMS.kr(in).linlin(0.0, 0.1, 0.5, 0.8).clip(0.2, 0.8).lag(0.1);
		sig_mix = sig_mix * amp.dbamp.lag(0.1) * env;
		Out.ar(out, sig_mix);
	}).add;

	SynthDef(\ntube_4, {
	arg amp=(-3), loss=0.99, atk=0.05, dec=0.1, sus=1, rel=0.05, curve=(-10), gate=1, line_start=(-1), line_end=1, line_dur=10, mix_low=(-1.0), mix_high=(-1.0), input_bus, out;
		var sig, in, freq, hasFreq, env, chain, fft_sig, sig_mix, lossarray, karray, delayarray;
	    lossarray = ~loss_array_4;
	    karray = ~k_array_4;
	    delayarray = ~delay_array_4;
		//in = In.ar(input_bus); // r1eplace with soundin for live sound
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
		sig_mix = XFade2.ar(sig, fft_sig, RMS.kr(in).linlin(0.0, 0.1, mix_low, mix_high).clip(-1.0, 1.0)); /*fft_mix*/
		//sig_mix = sig_mix * RMS.kr(in).linlin(0.0, 0.1, 0.5, 0.8).clip(0.2, 0.8).lag(0.1);
		sig_mix = sig_mix * amp.dbamp.lag(0.1) * env;
		Out.ar(out, sig_mix);
	}).add;

	s.sync;

	//TreeAdds

    ServerTree.add(~makeNodes);
	ServerTree.add(~makeMIDI);
	ServerTree.add(~makeEvents);
	s.freeAll; // Frees verver of any nodes. Then inits all instances on ServerTree (above).
	s.sync;
	s.meter;
	"done".postln;

});
)


