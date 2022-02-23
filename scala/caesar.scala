// run with scala caesar.scala
object Caesar extends App {

    println(encrypt("ATTACK AT ONCE", 4))
    println(decrypt("EXXEGO EX SRGI", 4))

    solve("abcdeFGHIJKLmnopqrstuvwxyz ,?;{[()]}", 26)

    def encrypt(input: String, shift: Int): String = {
        var result = ""
        for(i <- input.toUpperCase) {
            if(!i.isUpper) {
                result += i
            } else {
                val n = (i - 65 + shift) % 26 + 65
                val output = n.toChar
                result += output
            }
        }
        result
    }

    def decrypt(input: String, shift: Int): String = {
        encrypt(input, 26-shift)
    }

    def solve(input: String, maxShift: Int): Unit = {
        for(i <- 0 to maxShift) {
            val output = decrypt(input, i)
            println(i + "\t" + output)
        }
    }

}