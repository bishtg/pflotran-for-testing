#!/bin/sh

export PETSC_DIR=$PWD/petsc; 
export PETSC_ARCH=${TRAVIS_OS_NAME}-gnu

cd src/pflotran; 
make pflotran; 

# Run unit tests
make utest

# Run regression tests
cd ../../regression_tests

if [ ${PETSC_WITH_HDF5} = "1" ]; then
  make tests
else
  make nonhdf5_test
fi
cat *.testlog

