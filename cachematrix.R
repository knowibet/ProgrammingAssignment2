##  This function uses the operator <<- which can be used to assign a value to an object in an environment 
##  that is different from the current environment. The functions below are used to create a special object that 
##  stores a numeric matrix and cache's its inverse.

## The first function, makeCacheMatrix creates a special "matrix", which is really a list containing a function to
##   1. set the value of the matrix
##   2. get the value of the matrix
##   3. set the value of the matrix inverse
##   4. get the value of the matrix inverse

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinv <- function(solve) m <<- slove
        getinv <- function() m
        list(set = set, get = get,
             setinv = setinv,
             getinv = getinv)
}

## The following function calculates the matrix inverse of the special "matrix" created with the above function. 
## However, it first checks to see if the inverse has already been calculated. If so, it gets the inverse from the cache 
## and skips the computation. Otherwise, it calculates the inverse of the matrix and sets the value of the inverse 
## in the cache via the setmean function.


cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
                m <- x$getinv()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setinv(m)
        m
}
