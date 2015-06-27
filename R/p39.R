# 39 | Integer right triangles
# https://projecteuler.net/problem=39
# 
# If p is the perimeter of a right angle triangle with integral length sides,
# {a,b,c}, there are exactly three solutions for p = 120.
# 
# {20,48,52}, {24,45,51}, {30,40,50}
# 
# For which value of p ≤ 1000, is the number of solutions maximised?

# a^2 + b^2 = c^2 <=> c = sqrt(a^2 + b^2)
# and
# a + b + c = p <=> a + b + sqrt(a^2 + b^2) = p

max <- 1
for (p in 2:1000) {
  sols <- data.frame()
  for (a in 1:(p-1)) {
  
    b = (p^2 - 2*p*a) / (2*p - 2*a)
    c <- sqrt(a^2 + b^2)
  
    if (round(b) == b & b > 0) {
      sols <- rbind(sols, sort(c(a, b, c)))
    }
  }
  
  if (nrow(sols) > max) {
    sols_max <- sols
    max <- nrow(sols)
    p_max <- a + b + c
  } 
}

print(unique(sols_max))
print(p_max)

# TODO: optimise solution 
# check http://www.mathblog.dk/project-euler-39-perimeter-right-angle-triangle/ 