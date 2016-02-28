object Problem2 {
	// Function that produces the list of fibonacci numbers in O(N) and sorting
	// the list by descendant order
	def fibonacciNumbers(list: List[Int], upperBound: Int): List[Int] = {
		if (list.head < upperBound) fibonacciNumbers(list(0)+list(1)::list, upperBound) else list
	}                                      

  val upperBound = 4e6.toInt  
  val fibList = fibonacciNumbers(List(1,0),upperBound)
  fibList.filter( x => x%2==0 ).reduceLeft(_+_) 
}