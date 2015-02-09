import os

let code = if paramCount() > 0: readFile paramstr(1)
           else: readAll stdin

var
    tape = newSeq[char]()
    codePos = 0
    tapePos = 0

proc run(skip = false): bool = 
    while tapePos >= 0 and codePos < code.len:
        echo "codePos: ", codePos, " tapePos: ", tapePos
        if tapePos >= tape.len:
            tape.add '\0'
        case code[codePos]
        of '+': inc tape[tapePos]
        of '-': dec tape[tapePos]
        of '>': inc tapePos
        of '<': dec tapePos
        of '.': stdout.write tape[tapePos]
        of ',': tape[tapePos] = stdin.readChar
        else: discard
        inc codePos

discard run()
