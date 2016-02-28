object Problem4 {
  
	val possibleNumber =
		for{i <- 100 to 999
				j <- 100 to i
				if( (i*j).toString() == (i*j).toString().reverse )}
				yield i*j        

	println(possibleNumber.sortWith(_>_).head)
}