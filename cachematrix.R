## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## makeCacheMatrix - function to initilize "customizedd" type of matrix
## Mission: to initialuze matrix x for further use by cacheSolve()
## Main feature: cashable iversed matrix calculation
## Assumption:   square and non-singular matrix as an argument
## The function does not check the type of argument
makeCacheMatrix <- function(x = matrix()) {
        
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        
        get <- function()x
        setsolve <- function(solve) m <<- solve
        getsolve <- function() m
        
        list(set = set, get = get,
             setsolve = setsolve,
             getsolve = getsolve)
        
}


## Write a short comment describing this function
## cacheSolve 
## This function invokes calculation of the inverse matrix of x
## By inverse we define the solution of equation Ax = 0, where A is the returned matrix
## x MUST be initialized by makeCacheMatrix() function prior to call by cacheSolve
cacheSolve <- function(x, ...) {
        m <- x$getsolve()
        if(!is.null(m)){
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setsolve(m)
        m
}


## Exampole of usage:
## mdat <- matrix(c(1:9), nrow = 3, ncol = 3)
## mdat <- mdat *mdat 
## a=makeCacheMatrix(mdat)
## cacheSolve(a)
## cacheSolve(a) 
##
## The second call of cacheSolve(a) will invoke cashed values


