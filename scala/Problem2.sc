object Problem2 {
	// Function that produces the list of fibonacci numbers in O(N) and sorting
	// the list by descendant order
	def fibonacciNumbers(list: List[Int], upperBound: Int): List[Int] = {
		if (list.head < upperBound) fibonacciNumbers(list(0)+list(1)::list, upperBound) else list
	}                                         //> fibonacciNumbers: (list: List[Int], upperBound: Int)List[Int]

  val upperBound = 4e6.toInt                      //> upperBound  : Int = 4000000
  val fibList = fibonacciNumbers(List(1,0),upperBound)
                                                  //> fibList  : List[Int] = List(5702887, 3524578, 2178309, 1346269, 832040, 5142
                                                  //| 29, 317811, 196418, 121393, 75025, 46368, 28657, 17711, 10946, 6765, 4181, 2
                                                  //| 584, 1597, 987, 610, 377, 233, 144, 89, 55, 34, 21, 13, 8, 5, 3, 2, 1, 1, 0)
                                                  //| 
  fibList.filter( x => x%2==0 ).reduceLeft(_+_)   //> res0: Int = 4613732
}