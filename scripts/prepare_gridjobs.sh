
mass=$1

workdir=`pwd`
massdir=$workdir/m${mass}

CMSSWdir=$massdir/CMSSW_10_2_16_patch2/src

hdamp=""

if [ "$2" == 1 ]; then 
  massdir=$workdir/m${mass}_up; 
  hdamp="_up"
fi
if [ "$2" == 2 ]; then 
  massdir=$workdir/m${mass}_down; 
  hdamp="_down"
fi

mkdir -p $massdir
cd $massdir

export SCRAM_ARCH=slc6_amd64_gcc700 
scramv1 project CMSSW CMSSW_10_2_16_patch2 
cd $CMSSWdir ; eval `scramv1 runtime`
cp ../../../scripts/gensim.py .

sed -i "s/XHMASSX/${mass}/g" $CMSSWdir/gensim.py 
sed -i "s/HDAMP/${hdamp}/g" $CMSSWdir/gensim.py 
