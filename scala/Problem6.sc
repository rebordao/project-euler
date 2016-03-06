object Problem6 {
	
	def sumSquares(res: Int, number: Int): Int = { res+number*number }
                                                  //> sumSquares: (res: Int, number: Int)Int
	
	def sumSquareDiff(naturalNumbers: Int): Int = {
		val list = for(i<-1 to naturalNumbers) yield i
		val sum = list.sum
		sum*sum - list.reduceLeft(sumSquares)
	}                                         //> sumSquareDiff: (naturalNumbers: Int)Int
	
	sumSquareDiff(100)                        //> res0: Int = 25164150
}