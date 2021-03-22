## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

# Write function that creates object that stores the matrix and defines operations with it
makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setInv <- function(solve) i <<- solve
  getInv <- function() i
  list(
    set = set,
    get = get,
    setInv = setInv,
    getInv = getInv
  )
}


## Write a short comment describing this function

# Write function that calculates the inverse of matrix input or retrieves it from cache if already calculated
cacheSolve <- function(x, ...) {
  i <- x$getInv()
  if(!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  data <- x$get()
  i <- solve(data, ...)
  x$setInv(i)
  i
}

# Demo
mx<-matrix(rnorm(36),nrow=6)
mcm<-makeCacheMatrix(mx)
cacheSolve(mcm)