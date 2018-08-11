disc <- function(a,b,c) {
    b^2 - 4*a*c
}

# Resolver la ec cuadratica: x^2 + 3x -2 = 0
a <- 1
b <- 3
c <- -2

d <- disc(a,b,c)
r1 <- (-b + sqrt(d))/(2*a)
r2 <- (-b - sqrt(d))/(2*a)

print(r1)
print(r2)

