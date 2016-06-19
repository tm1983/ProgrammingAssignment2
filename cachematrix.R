## Put comments here that give an overall description of what your
## functions do

## This function creates the inverse of a matrix and stores the result as a list in the global environment. 
makeCacheMatrix <- function(x = matrix()) {

    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setsolve <- function(solve) m <<- solve
    getsolve <- function() m
    list(set = set, get = get,
         setsolve = setsolve,
         getsolve = getsolve)    
        
}


## This function verifies whether an inverse already exists, otherwise it computes one by calling setsolve from the function before.

cacheSolve <- function(x, ...) {
        m <- x$getsolve()
        if(!is.null(m)) {
            message("getting cached data")
            return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setsolve(m)
        m
}    
