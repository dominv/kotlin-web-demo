package ch09.ex3_1_WhyVarianceExistsPassingAnArgumentToAFunction

fun printContents(list: List<Any>) {
    println(list.joinToString())
}

fun main(args: Array<String>) {
    printContents(listOf("abc", "bac"))
}
