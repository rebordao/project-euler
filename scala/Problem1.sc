object Problem1 {
	// Very simple and compact solution, although it is O(N) we need to traverse two times our array
	// Furthermore, with a more traditional approach we could avoid using a list
  List.range(0,1000).filter(x => x%3==0 || x%5==0).reduceLeft(_+_)
}