all: transcode.playground

%.playground: %.md
	playground -p ios $< 
