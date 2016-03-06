object Problem10 {

  def is_prime(number: Long, divisor: Int): Boolean = (number%divisor) match {
  	case 0 if number==divisor => true
  	case 0 => false
  	case _ if(divisor==Math.floor(Math.sqrt(number))) => true
  	case _ => is_prime(number, divisor+1)
  } 

	val listPrimes = for{
										i <- 1L to 2000000L
										if is_prime(i,2)
									 } yield i

									 
  listPrimes.sum
}