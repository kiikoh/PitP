'compile and run with fbc caesar.bas && ./caesar

declare function encrypt(word as String, shift as Integer) as String
declare function decrypt(word as String, shift as Integer) as String
declare Sub solve(word as String, maxShiftValue as Integer)

print encrypt("ATTACK AT ONCE", 4)
print decrypt("EXXEGO EX SRGI", 4)

solve("abcdeFGHIJKLmnopqrstuvwxyz ,?;{[()]}", 26)

function encrypt(word as String, shift as Integer) as String
    dim i as Integer
    word = ucase(word)

    for i = 0 TO len(word) - 1
        'print i, word[i], chr(word[i])
    
        if word[i] >= 64 and word[i] <= 90 then
            word[i] = (word[i] - 65 + shift) mod 26 + 65
        end if
    next

    Return(word)

end function

function decrypt(word as String, shift as Integer) as String
    Return(encrypt(word, 26-shift))
end function

sub solve(word as String, maxShiftValue as Integer)
    dim i as Integer

    for i = 1 to maxShiftValue
        'strings are modified in place so always shift by 1
        print "shift: " & i, decrypt(word, 1)
    next
    

end sub
