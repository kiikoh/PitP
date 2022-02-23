{compile and run with fpc -v0 caesar.pas && ./caesar}
program Hello;
uses sysutils;
function encrypt(str:string; shift:integer): string;
var i: integer;
begin
    str:=upcase(str);
    for i:=1 to length(str) do
        begin
            {test for if it is a letter, at this point all is uppercase}
            if (str[i] in ['A'..'Z']) then
                begin
                    str[i]:= chr((ord(str[i]) -65 + shift) mod 26 + 65);
                end;
        end;
    encrypt:=str;
end;

function decrypt(str:string; shift:integer): string;
var i: integer;
begin
    decrypt:=encrypt(str, 26-shift);
end;

procedure solve(str:string; maxShiftValue:integer);
var i: integer;
begin
    str:=upcase(str);
    for i:=1 to 26 do
        begin
            writeln('Shift: ', i, ' Result: ', decrypt(str, i));
        end;
end;

begin
    writeln(encrypt('ATTACK AT ONCE',4));
    writeln(decrypt('EXXEGO EX SRGI',4));
    solve('abcdeFGHIJKLmnopqrstuvwxyz ,?;{[()]}', 26)
end.



