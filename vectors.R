# how to create vectors in R.

# use c(concacatenate).
codes<- c(100,150,250)

# vectors with characters.
codes1<- c("lucas","oi","gabriel")

# associate names with each type or number with data.
codes2<- c(egypt=1,mexico=2,gana=3)

# the line above is equal to codes2<- c("egypt"=1,"mexico"=2,"gana"=3)
# and the line below is equal to above but using function names
v1<- c(1,2,3)
v2<- c("egypt","mexico","gana")
names(v1)<- v2

class(codes)
class(codes1)
class(codes2)
print(v1)

# shorthands is important topic for studying R.
# we get the integers from 1 to 10.
print(1:10)

# access specific parts of a vector.
print( codes2[1:2] )
print( codes2[1:3] )
# access specific parts of a vector using names.
print( codes2[c("egypt","mexico","gana")] )



