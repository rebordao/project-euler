object Problem7 {
  
  def is_prime(number: Int, divisor: Int): Boolean = (number%divisor) match {
  	case 0 if number==divisor => true
  	case 0 => false
  	case _ if(divisor==Math.floor(Math.sqrt(number))) => true
  	case _ => is_prime(number, divisor+1)
  }                                               //> is_prime: (number: Int, divisor: Int)Boolean
  
  def prime(number: Int, nth_prime: Int): Int = is_prime(number,2) match {
  	case true if(nth_prime==1) => number
  	case true => prime(number+1,nth_prime-1)
  	case false => prime(number+1,nth_prime)
  }                                               //> prime: (number: Int, nth_prime: Int)Int
  
  
  prime(2,10001)                                  //> res0: Int = 104743
}