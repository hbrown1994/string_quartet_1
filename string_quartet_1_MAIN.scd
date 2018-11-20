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

/*______________________________________________ DO NOT ALTER ANY CODE BELOW THIS LINE ______________________________________________*/
/*_______________________________________________________________________________________________________________________________________________________________________________*/


/*______________________________________________ 1. Server Configuration ______________________________________________*/
s = Server.local;
s.newBusAllocators;
s.latency = 0.05;
ServerBoot.removeAll;
ServerTree.removeAll;
ServerQuit.removeAll;
Server.local.options.numOutputBusChannels = 8;
Server.local.options.numInputBusChannels = 6;
o=s.options;
o.memSize;
o.memSize = 2.pow(20);

/*______________________________________________ 2. Global Variables/Arrays ______________________________________________*/

//String Inputs from Interface
~violin_1_in = 0;
~violin_2_in = 1;
~viola_in = 2;
~cello_in = 3;

//Metal Sheet Contact Mic Inputs from Interface
~contact_mic_1_in = 4;
~contact_mic_2_in = 5;

//Metal Sheet Contact Mic Outputs
~playback_out_1 = 0;
~playback_out_1 = 1;
~violin_1_out = 2;
~violin_2_out = 3;
~viola_out = 2;
~cello_out = 3;
~sheet_1_out = 4;
~sheet_2_out = 5;
~sub_out = 6;

//Init Cue Number and PFunc globals
~cue=0;
~glitch_stream_val = (-60);
~metal_stream_val = (-60);

//INIT all Arrays
thisProcess.interpreter.executeFile(~init_path++"make_arrays.scd");

//Init File Paths
~buffers_path = PathName(thisProcess.nowExecutingPath).parentPath++"buffers/";
~synth_def_path = PathName(thisProcess.nowExecutingPath).parentPath++"synth_defs/";
~init_path = PathName(thisProcess.nowExecutingPath).parentPath++"init/";
~events_path = PathName(thisProcess.nowExecutingPath).parentPath++"events/";


/*______________________________________________ 3. Buffers ______________________________________________*/
~makeBuffers = {
    thisProcess.interpreter.executeFile(~init_path++"make_buffers.scd");
};

/*______________________________________________ 4. Nodes ______________________________________________*/
~makeNodes = {
    thisProcess.interpreter.executeFile(~init_path++"make_nodes.scd");
};

/*______________________________________________ 5. MIDI ______________________________________________*/
~makeMIDI = {
    thisProcess.interpreter.executeFile(~init_path++"make_midi.scd");
};

/*______________________________________________ 6. Events ______________________________________________*/
~makeEvents = {

	e = Dictionary.new;

	//The below function adds all cues (or events) in the "events" folder to a dictionary array.

    PathName(~events_path).entries.size.do{

		arg count=0;

		thisProcess.interpreter.executeFile(~events_path++PathName(~events_path).entries.at(count).fileName.asString);

		count = count + 1;
	};

};
/*______________________________________________ 7. GUI ______________________________________________*/
~makeGui = {
    thisProcess.interpreter.executeFile(~init_path++"make_gui.scd");
};

/*______________________________________________ 8. Cleanup ______________________________________________*/

// Remove all processes on server on quit.
~cleanup = {
	s.newBusAllocators;
	ServerBoot.removeAll;
	ServerTree.removeAll;
	ServerQuit.removeAll;
};


ServerBoot.add(~makeGui); // Make GUI when server boots.
ServerBoot.add(~makeBuffers); // Make Buffers when server boots.
ServerQuit.add(~cleanup); // Remove all processes on server on quit.

/*______________________________________________ 9. Busses & SynthDefs ______________________________________________*/

s.waitForBoot({ //Wait to boot server once contained functions have been evaluated.

	//Make Busses
    thisProcess.interpreter.executeFile(~init_path++"make_busses.scd");

	s.sync;

	//The below function adds all SynthDefs in the "synth_defs" folder to the server.
    PathName(~synth_def_path).entries.size.do{

		arg count=0;

		thisProcess.interpreter.executeFile(~synth_def_path++PathName(~synth_def_path).entries.at(count).fileName.asString);

		count = count + 1;
	};
	s.sync;

    ServerTree.add(~makeNodes);
	ServerTree.add(~makeMIDI);
	ServerTree.add(~makeEvents);
	s.freeAll;
	s.sync;
	s.meter;
	"done".postln;
});
)


