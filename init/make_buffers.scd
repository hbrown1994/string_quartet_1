//Adds all buffers in the "buffers" folder to a dictionary array.

//Stereo Buffers
b = Dictionary.new;
PathName(~buffers_path).entries.do{
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

//Mono Buffers
m = Dictionary.new;
PathName(~buffers_path).entries.do{
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

