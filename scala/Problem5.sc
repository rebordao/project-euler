object Problem5 {

	def allDivisible(number: Int, divisor: Int, consecutiveDivisors: Int): Boolean = (number%divisor) match {
		case 0 if(divisor==consecutiveDivisors) => true
		case _ if(divisor==consecutiveDivisors) => false
		case 0 => allDivisible(number, divisor+1,consecutiveDivisors)
		case _ => false
	}                                         //> allDivisible: (number: Int, divisor: Int, consecutiveDivisors: Int)Boolean
		
	// Number defines not only the initial number, but also the number of divisors to consider
	def findTheMin(number: Int, consecutiveDivisors: Int): Int = allDivisible(number, 2, consecutiveDivisors) match {
		case true => number
		case false => findTheMin(number+consecutiveDivisors,consecutiveDivisors)
	}                                         //> findTheMin: (number: Int, consecutiveDivisors: Int)Int
	
	findTheMin(20,20)                         //> res0: Int = 232792560
                  
	
}