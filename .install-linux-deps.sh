sudo apt-get update -qq
sudo apt-get install -y cmake gcc libopenmpi-dev openmpi-bin liblapack-dev gfortran mercurial git netcdf-bin libnetcdf-dev 

git clone https://bitbucket.org/petsc/petsc.git

PETSC_GIT_HASH=`cat tools/buildbot/petsc/petsc-git-version.txt`

cd petsc

git checkout ${PETSC_GIT_HASH}

export PETSC_DIR=$PWD
export PETSC_ARCH=linux-gnu

./configure PETSC_ARCH=linux-gnu --with-mpi=1 --with-debug=$DEBUG --with-shared-libraries=1 --download-hdf5 --download-metis --download-parmetis

make 
