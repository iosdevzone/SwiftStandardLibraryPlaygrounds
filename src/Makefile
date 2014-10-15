all: GeneratorsSequencesCollections.playground \
SequenceAndCollectionFunctions.playground \
SequenceAndCollectionFunctionsSwifter.playground \
transcode.playground

%.playground: %.md
	playground -p ios $< 

%.blog: %.md
	cat $< | ./md2blog > $@
