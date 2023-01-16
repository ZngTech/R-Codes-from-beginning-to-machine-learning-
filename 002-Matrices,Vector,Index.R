########################
Index: append, add or eliminate elements
Vector
Matrix
########################
> ##### Indexing, Appending, Concatenation, Matrix####
> ###### Indexing####
> # create entry of a bigger vector
> y=c(6,8,10,12,15,23,28)
> # to look at the first entry of y
> y[1]
[1] 6
> # get the length of the vector
> y[length(y)]
[1] 28
> # now we know the length of the vector y is 28
> # you can see [ ] is the index command, and now we try to use this command to eliminate a certain element from the vector y
> # See you just need to add the minus sign before concatenation sign. The structure of code y[-c(2,3)] means that you eliminate a certain concatenation ( following index order) from the vector y
> # let's try eliminate the 4th and 5th elements from the vector
> YNEW=y[-c(4,5)]
> YNEW
[1]  6  8 10 23 28
> # the number 12 15 disappear from the original vector y
> # add element at the beginning and ending of the concatenation y
> ynew=c(y,99)
> ynew
[1]  6  8 10 12 15 23 28 99
> #add element after the ending of the concatenation y
> yNew=c(001,y)
> yNew
[1]  1  6  8 10 12 15 23 28
> # combine 2 vectors into a new vector
> a=c(1,3,5,7,9)
> b=c(2,4,6,8,10)
> hybrid=c(a,b)
> hybrid
 [1]  1  3  5  7  9  2  4  6  8 10
> Hybrid=c(b,a)
> Hybrid
 [1]  2  4  6  8 10  1  3  5  7  9
> 
############
# Matrices #
############

# define a matrix
# Matrix only allow data that is either numeric or categorical
# Matrix assume you read elements by column and to set matrix read by row, you need byrow=TRUE
# data.frames are better data structures because they let us have columns of different types

> A = matrix(c(1,3,4,5), nrow=2, ncol=2, byrow=TRUE)
> A
     [,1] [,2]
[1,]    1    3
[2,]    4    5
> A = matrix(c(1,3,4,5), nrow=2, ncol=2, byrow=FALSE)
> A
     [,1] [,2]
[1,]    1    4
[2,]    3    5

> C=matrix(c("dog", "cat", "mouse","fish", "monkey", "dolphin"),nrow = 2, ncol = 3, byrow = TRUE)
> C
     [,1]   [,2]     [,3]     
[1,] "dog"  "cat"    "mouse"  
[2,] "fish" "monkey" "dolphin"

####################################
# Operations with numeric matrices #
####################################

# adding and subtracting matrices (componentwise)
A+B
A-B
A*B
A/B
# componentwise product (*) or division (/)
# if you've seen matrix algebra, 
# the matrix product you learn there is is not this one!

# if you're interested in finding the matrix product
# that you learned in linear algebra
A%*%B

# adding, multiplying, etc. all the 
# entries by a number
A+1
2*A

#####################
# Indexing matrices #
#####################
A = matrix(c(1,3,
             4,5), nrow = 2, ncol = 2, byrow = TRUE)
B = matrix(c(1,3,4,5), nrow = 2, ncol = 2, byrow = FALSE) # read by column
C = matrix(c(1,2,3,
             4,5,6), nrow = 2, ncol = 3, byrow = TRUE)

A
B
C



# rows first, column second!

# access first row, second column of A
A[1, 2] # this means first row, second colmn
# access 2nd row first column of A
A[2, 1]
# access 2nd row first column of B
B[2, 1]
# access first row of A (all of it)
A[1, ]
# access 3rd column of C
C[ , 3]
# edit the third column of C to the numbers 5 and 10
C[ , 3] = c(5, 10)
C
# access first 2 rows of A
A[1:2, ]
# first 2 columns of C
C[ , 1:2]
C[, 2:3] # 2nd and third column
C[, c(1,3)]

C[, -c(1,3)]


#########################
# colnames and rownames #
#########################

# change column names of C 
# to "C1" "C2" and "C3"
# and rownames of C to 
# "R1" "R2" 

C = matrix(c(1,2,3,
             4,5,6), nrow = 2, ncol = 3, byrow = TRUE)


rownames(C) = c("Alice", "Bob")
colnames(C) = c("age", "GPA", "height")
C
C["Bob",]
C[, "height"]

# rownames and colnames are useful because we can interpret the data more easily and also we can use them for indexing!

> A = matrix(c(1,3,4,5), nrow=2, ncol=2, byrow=TRUE)
> A
          Price Quantity
Product 1     1        3
Product 2     4        5
> A[,"Price"]
Product 1 Product 2 
        1         4 
> A["Product 1",]
   Price Quantity 
       1        3 
> A["Product 2",]
   Price Quantity 
       4        5 


#######################
# rowSums and colSums #
#######################

# rowSums: row sums
rowSums(C)
# colSums: column sums
colSums(C)
# sum: add up all the entries in the matrix!
sum(C)




# Exercise on TopHat
# Bob is on a health kick and is 
# keeping track of the macronutrients
# and calories in what he eats. 

# Yesterday, he ate
# Breakfast: 50g of carbs, 8g of fat, and 20g of protein
# Lunch: 60g of carbs, 30g of fat, and 40g of protein
# Dinner: 40g of carbs, 30g of fat, 40g of protein

bob = matrix(c(50,8,20,
               60,30,40,
               40,30,40), nrow = 3, ncol = 3, byrow = TRUE)

rownames(bob) = c("breakfast", "lunch", "dinner")

colnames(bob) = c("carbs", "fat", "protein")


# How many grams of carbs, 
# fat, and protein did Bob eat yesterday?
# total number of carbs 
# total number of fat
# total number of protein
>colSums(bob)
>  carbs     fat protein 
    150      68     100 

# Assume that each gram of carbs yields 4 calories,
# each gram of protein yields 4 calories, and each 
# gram of fat yields 9 calories. 


# How many calories did Bob eat for breakfast, 
# lunch, and dinner yesterday?
# (give them separately; your answer should look something 
# like 200 calories for breakfast, 500 calories for lunch, and 
# 300 for dinner, but with different numbers) 

> BF=bob["breakfast",]
> LC=bob["lunch",]
> DNR=bob["dinner",]
> BF
  carbs     fat protein 
     50       8      20 
> BF*c(4,9,4)
  carbs     fat protein 
    200      72      80 
> LC*c(4,9,4)
  carbs     fat protein 
    240     270     160 
> DNR*c(4,9,4)
  carbs     fat protein 
    160     270     160 


# let's start with breakfast
bob[1,]
sum(bob["breakfast",]*c(4, 9, 4))
# Answer is 352 calories for breakfast

# the answer can be found pretty much the same way
# for the other meals
sum(bob["lunch",]*c(4, 9, 4))
sum(bob["dinner",]*c(4, 9, 4))


# How many calories did he eat in total? 
> # calculate total calories per day
> Cal=colSums(bob)
> Calories=c(4,9,4)
> Cal*Calories
  carbs     fat protein 
    600     612     400 
> total=Cal*Calories
> sum(total)
[1] 1612

# Did he stay under his goal of 1800 calories per day?
> 1612<1800
[1] TRUE
