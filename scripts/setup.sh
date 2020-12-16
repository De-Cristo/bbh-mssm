#!/bin/bash

export VO_CMS_SW_DIR=/cvmfs/cms.cern.ch
source $VO_CMS_SW_DIR/cmsset_default.sh

mass=$1
width=$2
hdamp=`awk "BEGIN {print ($mass+8.36)/4}"`

if [ "$3" == 1 ]; then hdamp=`awk "BEGIN {print 2*($mass+8.36)/4}"`; fi
if [ "$3" == 2 ]; then hdamp=`awk "BEGIN {print 0.5*($mass+8.36)/4}"`; fi

workdir=`pwd`
massdir=$workdir/m${mass}

if [ "$3" == 1 ]; then massdir=$workdir/m${mass}_up; fi
if [ "$3" == 2 ]; then massdir=$workdir/m${mass}_down; fi

CMSSWdir=$massdir/CMSSW_8_0_22/src
template=$workdir/template

mkdir $massdir
cd $massdir

scramv1 project CMSSW CMSSW_8_0_22
cd $CMSSWdir ; eval `scramv1 runtime -sh` ; cd $massdir

echo "Copying files:"
cp -v $template/pwgseeds.dat $CMSSWdir
cp -v $template/pwhg_main $CMSSWdir
cp -v $template/pwg-rwl.dat $CMSSWdir
cp -v $template/powheg.input-* $CMSSWdir
cp -v $template/runcmsgrid.sh $CMSSWdir

sed -i "s/XHMASSX/${mass}/g" $CMSSWdir/powheg.input-*
sed -i "s/XHWIDTHX/${width}/g" $CMSSWdir/powheg.input-*
sed -i "s/XHDAMPX/${hdamp}/g" $CMSSWdir/powheg.input-*

cd $workdir 
