
export VO_CMS_SW_DIR=/cvmfs/cms.cern.ch
source $VO_CMS_SW_DIR/cmsset_default.sh

mass=$1

workdir=`pwd`
massdir=$workdir/m${mass}


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

CMSSWdir=$massdir/CMSSW_9_3_6/src

scramv1 project CMSSW CMSSW_9_3_6
cd $CMSSWdir ; eval `scramv1 runtime -sh` ; #cd $massdir

gridpackdir=${massdir}/CMSSW_8_0_22/src/gridpack/bbh_powheg_m${mass}${hdamp}.tar.gz

cp $gridpackdir .

cp ../../../scripts/gensim.py .
cp ../../../scripts/crab_sub.py .

sed -i "s/XHMASSX/${mass}/g" $CMSSWdir/gensim.py 
sed -i "s/HDAMP/${hdamp}/g" $CMSSWdir/gensim.py 

sed -i "s/XHMASSX/${mass}/g" $CMSSWdir/crab_sub.py
sed -i "s/HDAMP/${hdamp}/g" $CMSSWdir/crab_sub.py
