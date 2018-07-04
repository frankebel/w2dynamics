# Find LAPACK (finds BLAS also) if not already found
IF(NOT LAPACK_FOUND)
    IF(NOT (CMAKE_Fortran_COMPILER_ID STREQUAL "Cray")) # Cray's libsci is usually automagically present.
           ENABLE_LANGUAGE(C) # Some libraries need a C compiler to find
	   FIND_PACKAGE(LAPACK REQUIRED)
    	   # Remember that LAPACK (and BLAS) was found.  For some reason the
    	   # FindLAPACK routine doesn't place these into the CACHE.
    	   SET(BLAS_FOUND TRUE CACHE INTERNAL "BLAS was found" FORCE)
    	   SET(LAPACK_FOUND TRUE CACHE INTERNAL "LAPACK was found" FORCE)
    	   SET(BLAS_LIBRARIES ${BLAS_LIBRARIES} CACHE INTERNAL "BLAS LIBS" FORCE)
    	   SET(LAPACK_LIBRARIES ${LAPACK_LIBRARIES} CACHE INTERNAL "LAPACK LIBS" FORCE)
    ENDIF()
ENDIF(NOT LAPACK_FOUND)
