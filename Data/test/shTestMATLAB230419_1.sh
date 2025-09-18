#!/bin/sh
#$ -S /bin/sh
#$ -cwd
#$ -l s_vmem=8G -l mem_req=8G
#$ -e log -o log
#$ -l intel
#$ -l d_rt=1440:00:00 -l s_rt=1440:00:00


presentDir=$(pwd)

accountName=`echo $presentDir | cut -d/ -f3`


echo "pwd:" $presentDir
echo "Account name:" $accountName

if test $accountName = "kuroda" ; then :
elif test $accountName = "sohno" ; then :
else  
    echo "ERROR: Acccount Name must be either of kuroda or sohno"
    exit 0
fi

mcrVer=`cat mcrVersion.txt`
mcrPath=/home/$accountName/MCR/$mcrVer
if test $mcrVer = "v96" -a $accountName = "kuroda" ; then
    mcrPath=/home/$accountName/local/MCR/$mcrVer        
fi
echo 'MCR version:' $mcrVer
echo 'MCR path:' $mcrPath


if test $mcrVer = "v83" ; then
    export LD_LIBRARY_PATH=$mcrPath/runtime/glnxa64:$mcrPath/bin/glnxa64:$mcrPath/sys/os/glnxa64:$LD_LIBRARY_PATH
elif test $mcrVer = "v96" ; then
export LD_LIBRARY_PATH=$mcrPath/runtime/glnxa64:$mcrPath/bin/glnxa64:$mcrPath/sys/os/glnxa64:$mcrPath/extern/bin/glnxa64:$LD_LIBRARY_PATH
fi

export XAPPLRESDIR=$mcrPath/X11/app-defaults:$XAPPLRESDIR
export MCR_CACHE_ROOT=/tmp/$accountName

echo 'MCR_CACHE_ROOT:' $MCR_CACHE_ROOT

./testMATLAB230419_1 $SGE_TASK_ID

