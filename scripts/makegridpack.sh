run=$1

mkdir -p gridpack
cp *.dat gridpack/.
cp powheg.input-base gridpack/powheg.input-save
cp pwgseeds.dat gridpack/.
cp pwhg_main gridpack/.
cp runcmsgrid.sh gridpack/.
cp pwg-rwl.dat gridpack/.

cd gridpack

rm pwgcounters*
rm pwg-st3-00[0-9][1-9]-stat.dat	# keep some info
rm pwg-????-stat.dat

tar czvf bbh_powheg_${run}.tar.gz *

cd ..
