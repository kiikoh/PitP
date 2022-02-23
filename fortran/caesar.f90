! compile and run with gfortran caesar.f90 && ./a.out
program Caesar
    character(1) :: shift 
    character(64) :: encrypt
    character(64) :: decrypt
    
    print *, encrypt('ATTACK AT ONCE', 4)
    print *, decrypt('EXXEGO EX SRGI', 4)
    
    call solve("abcdeFGHIJKLmnopqrstuvwxyz ,?;{[()]}", 26)
    
    stop
end

function encrypt(str, shiftAmt) result(res)
    character(*) :: str
    character(1) :: shift
    integer :: shiftAmt
    character(*) :: res
    integer :: i
    integer :: j
    
    do i = 1, len_trim(str)
        res(i:i) = shift(str(i:i), shiftAmt)
    end do
    do j = len_trim(str) + 1, 64
       res(j:j) = ' '
    end do

    
end function

function decrypt(str, shiftAmt) result(res)
	character(*) :: str
    integer :: shiftAmt
    character(64) :: res
    character(64) :: encrypt
    
    
    res = encrypt(str, -shiftAmt)
	
end function

subroutine solve(str, maxShiftValue)
    implicit none
    character(*) :: str
    integer :: maxShiftValue
    character(64) :: decrypt
    integer :: i

	do i = 1, maxShiftValue
        print *, 'Shift: ', i, decrypt(str, i)
    end do

end subroutine

function toUpper(chr) result(upper)
    implicit none
    character :: chr
    character :: upper
    integer :: charcode
    
    charcode = iachar(chr)

    if(charcode >= 97 .and. charcode <= 122) then
        ! lowercase
        upper = achar(charcode - 32)
    else
        upper = chr
    end if
    
end function

function shift(chr, num) result(shifted)
    implicit none
    character :: chr
    integer :: num
    character :: shifted
    integer :: shiftedCode
    character :: toUpper
    
    shiftedCode = iachar(toUpper(chr))
    
    if(shiftedCode >= 64 .and. shiftedCode <= 90) then
    	shiftedCode = modulo(shiftedCode - 65 + num, 26) + 65
    end if
        
	shifted = achar(shiftedCode)
	
	!print *, chr, ' -> ', shifted
    

end function