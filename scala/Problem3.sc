object Problem3 {
  
  def getFactor(number: Long, factor: Int): Int = number%factor match {
  		case 0 => factor
  		case _ => getFactor(number, factor+1)
  }                                               //> getFactor: (number: Long, factor: Int)Int
  

  def primeNumbers(number: Long, factors: List[Long]): List[Long] = number match {
	  case 1L => factors
		case _  => val f = getFactor(number,2); primeNumbers(number/f, f::factors)
  }                                               //> primeNumbers: (number: Long, factors: List[Long])List[Long]
  
  primeNumbers(600851475143L, List()).sortWith(_>_).head
                                                  //> res0: Long = 6857
}