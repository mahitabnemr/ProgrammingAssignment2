## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

}


## Write a short comment describing this function

## These functions create a special matrix object that caches
## its inverse to avoid calculating it repeatedly.

makeCacheMatrix <- function(x = matrix()) {
  
  inverse <- NULL
  
  set <- function(y) {
    x <<- y
    inverse <<- NULL
  }
  
  get <- function() {
    x
  }
  
  setinverse <- function(value) {
    inverse <<- value
  }
  
  getinverse <- function() {
    inverse
  }
  
  list(
    set = set,
    get = get,
    setinverse = setinverse,
    getinverse = getinverse
  )
}


cacheSolve <- function(x, ...) {
  
  inverse <- x$getinverse()
  
  if (!is.null(inverse)) {
    message("getting cached data")
    return(inverse)
  }
  
  matrix_data <- x$get()
  inverse <- solve(matrix_data, ...)
  
  x$setinverse(inverse)
  
  inverse
}