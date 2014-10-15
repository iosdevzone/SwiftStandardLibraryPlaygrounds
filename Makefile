all: GeneratorsSequencesCollections.playground \
SequenceAndCollectionFunctions.playground \
transcode.playground

%.playground: %.md
	playground -p ios $< 
