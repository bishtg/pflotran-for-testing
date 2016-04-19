# Install required software
brew update
brew install openmpi git 
brew tap homebrew/science
brew install netcdf --with-fortran 

git clone https://bitbucket.org/petsc/petsc.git

PETSC_GIT_HASH=`cat tools/buildbot/petsc/petsc-git-version.txt`

cd petsc

git checkout ${PETSC_GIT_HASH}

export PETSC_DIR=$PWD
export PETSC_ARCH=osx-gnu

./configure PETSC_ARCH=linux-gnu --with-mpi=1 --with-debug=$DEBUG --with-shared-libraries=1 --download-hdf5 --download-metis --download-parmetis

make 

