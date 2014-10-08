all: GeneratorsSequencesCollections.playground \
transcode.playground

%.playground: %.md
	playground -p ios $< 
