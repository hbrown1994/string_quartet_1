//GUI for real-time control over the SuperCollider code.

//Makes Window to house GUI objects
Window.closeAll;
w = Window("String Quartet #1", Rect(750,50,1200,800))
.front
.alwaysOnTop_(true);

/*______________________________________________ 1. Static Text Labels for all 8 Composite Views  ______________________________________________*/


// Composite View 0 ------------------------------------------
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

// Composite View 1 ------------------------------------------
StaticText(w, Rect(602,0,580,30))
.string_("Rehearsal Cues")
.align_(\center)
.front
.font_(Font(size: 30));

// Composite View 2 ------------------------------------------
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

// Composite View 3 ------------------------------------------
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

// Composite View 4 ------------------------------------------
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


// Composite View 5 ------------------------------------------
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

// Composite View 6 ------------------------------------------
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

// Composite View 7 ------------------------------------------
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


/*______________________________________________ 2. Assign GUI objects to composite views  ______________________________________________*/

// Create Composite Views ------------------------------------------

w.view.decorator_(FlowLayout(w.bounds, 0@0, 0@0));

c = Array.fill( 8, {
	arg view;
	view = CompositeView(w, 600@200)
	.background_();

	view.decorator_(FlowLayout(view.bounds, 10@25, 70@0));
});

// Composite View 0: Init & Stop Reset ------------------------------------------
c[0].background_(Color(0, 0, 0));
c[0].decorator_(FlowLayout(c[0].bounds, 90@40, 15@15)); // Array 0
c[0].decorator.nextLine;
c[0].decorator.nextLine;
c[0].decorator.nextLine;


Array.fill(1, {Button(c[0], 200@50).font_(Font(size: 30)).states_([["Initialization", Color.black, Color.gray(0.8)],["Initialized", Color.white, Color(0,0,0)]])});
Array.fill(1, {Button(c[0], 200@50).font_(Font(size: 30)).states_([["Stop & Reset", Color.black, Color.gray(0.8)]])});

c[0].decorator.nextLine;
c[0].decorator_(FlowLayout(c[0].bounds, 190@140, 15@15)); // Array 0
Array.fill(1, {Button(c[0], 200@50).font_(Font(size: 30)).states_([["Cue", Color.black, Color.gray(0.8)]])});

// Composite View 1: Cues ------------------------------------------
c[1].background_(Color(1, 1, 1));
c[1].decorator_(FlowLayout(c[0].bounds, 30@15, 10@10)); // Array 1
c[1].decorator.nextLine;
c[1].decorator.nextLine;
Array.fill(52, {
		arg i=(-1);
		{i = i + 1};
		Button(c[1], 30@30).states_([[i.asString, Color.black, Color.gray(0.8)],[i.asString, Color.white, Color(0,0,0)]])});

// Composite View 2: Dry String Sliders ------------------------------------------
c[2].background_(Color(0, (75/255), (168/255)));

Array.fill(4, {Slider(c[2], 50@150)});
c[2].decorator.nextLine;
Array.fill(4, {NumberBox(c[2], 50@20)});

// Composite View 3: Sample Playback Sliders ------------------------------------------
c[3].background_(Color((137/255), (2/255), (62/255)));

Array.fill(4, {Slider(c[3], 50@150)});
c[3].decorator.nextLine;
Array.fill(4, {NumberBox(c[3], 50@20)});

// Composite View 4: FX Sliders 1 ------------------------------------------
c[4].background_(Color(1, 1, 1));

Array.fill(5, {Slider(c[4], 50@150)}); //FX Bank 1: Array 4
c[4].decorator.nextLine;
Array.fill(5, {NumberBox(c[4], 50@20)});

// Composite View 5: FX Sliders 2 ------------------------------------------
c[5].background_(Color(1, 1, 1));

Array.fill(4, {Slider(c[5], 50@150)}); //FX Bank 2: Array 5
c[5].decorator.nextLine;
Array.fill(4, {NumberBox(c[5], 50@20)});

// Composite View 6: Metal Sheet Feedback Sliders  ------------------------------------------
c[6].background_(Color(00, 0, 0));

Array.fill(3, {Slider(c[6], 50@150)}); //Feedback Module 1: Array 6
c[6].decorator.nextLine;
Array.fill(3, {NumberBox(c[6], 50@20)});

// Composite View 7: FX Sliders 3 ------------------------------------------
c[7].background_(Color(1, 1, 1));

Array.fill(5, {Slider(c[7], 50@150)}); //Feedback Module 2: Array 7
c[7].decorator.nextLine;
Array.fill(5, {NumberBox(c[7], 50@20)});



/*______________________________________________ 3. INIT GUI Objects  ______________________________________________*/

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

/*______________________________________________ 4. GUI Object Functionality  ______________________________________________*/

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
	~violin_1_numBox.value_(obj.value.linlin(0.0,1.0,-60.0,0.0));
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
	~violin_2_numBox.value_(obj.value.linlin(0.0,1.0,-60.0,0.0));
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
	~viola_numBox.value_(obj.value.linlin(0.0,1.0,-60.0,0.0));
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
	~cello_numBox.value_(obj.value.linlin(0.0,1.0,-60.0,0.0));
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

	~ringmod_cello_numBox.value_(obj.value.linlin(0.0,1.0,-60.0,0.0));
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

	~ringmod_viola_numBox.value_(obj.value.linlin(0.0,1.0,-60.0,0.0));
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
	~violin_1_glitch_numBox.value_(obj.value.linlin(0.0,1.0,-60.0,0.0));
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
	~violin_2_glitch_numBox.value_(obj.value.linlin(0.0,1.0,-60.0,0.0));
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
	~viola_glitch_numBox.value_(obj.value.linlin(0.0,1.0,-60.0,0.0));
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
	~cello_glitch_numBox.value_(obj.value.linlin(0.0,1.0,-60.0,0.0));
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
	~friction_numBox.value_(obj.value.linlin(0.0,1.0,-60.0,0.0));
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
	~tube_delay_numBox.value_(obj.value.linlin(0.0,1.0,-60.0,0.0));
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

	~reverb_numBox.value_(obj.value.linlin(0.0,1.0,-60.0,0.0));
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
	~glitch_stream_numBox.value_(obj.value.linlin(0.0,1.0,-60.0,0.0));
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
	~metal_stream_numBox.value_(obj.value.linlin(0.0,1.0,-60.0,0.0));
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
	~noise_1_numBox.value_(obj.value.linlin(0.0,1.0,-60.0,0.0));
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
	~noise_2_numBox.value_(obj.value.linlin(0.0,1.0,-60.0,0.0));
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
	~contact_mic_1_numBox.value_(obj.value.linlin(0.0,1.0,-60.0,0.0));
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
);	~contact_mic_1_freq_numBox.value_(obj.value.linlin(0.0,1.0,100.0,8000.0));
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
	~metal_sheet_impulses_1_numBox.value_(obj.value.linlin(0.0,1.0,-90.0,0));
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
	~sub_numBox.value_(obj.value.linlin(0.0,1.0,-60.0,0));
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

	~soft_glitch_numBox.value_(obj.value.linlin(0.0,1.0,-60.0,0));
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
	~violin_2_ringmod_numBox.value_(obj.value.linlin(0.0,1.0,-60.0,0));
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

	~low_freq_numBox.value_(obj.value.linlin(0.0,1.0,-60.0,0));
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
	~delay_numBox.value_(obj.value.linlin(0.0,1.0,-60.0,0));
});

~delay_numBox = c[7].children[9]
.decimals_(1)
.clipLo_(-60.0)
.clipHi_(0.0)
.action_({
	arg obj;
	~delay_slider.valueAction_(obj.value.linlin(-60.0,0, 0.0,1.0)); // allows you to move slider via typing numbers
	});