/*
func transcode<         Input : GeneratorType,
                       Output : SinkType,
                InputEncoding : UnicodeCodecType,
               OutputEncoding : UnicodeCodecType
    where

       InputEncoding.CodeUnit == GeneratorType.Element
      OutputEncoding.CodeUnit == SinkType.Element>

                (inputEncoding: InputEncoding.Type,
                outputEncoding: OutputEncoding.Type,
                         input: Input,
                        output: Output,
                  #stopOnError: Bool) -> (Bool)
*/
