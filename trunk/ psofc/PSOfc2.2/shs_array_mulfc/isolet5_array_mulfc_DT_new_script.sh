#$ -S /bin/sh 
#$ -wd /vol/grid-solar/sgeusers/daiyan
##$ -M Yan.Dai@ecs.vuw.ac.nz
##$ -m be 

mkdir -p /local/tmp/daiyan/$JOB_ID 

if [ -d /local/tmp/daiyan/$JOB_ID ]; then
        cd /local/tmp/daiyan/$JOB_ID
else
        echo "There's no job directory to change into" 
        echo "Here's LOCAL TMP "
        ls -la /local/tmp
        echo "AND LOCAL TMP FRED "
        ls -la /local/tmp/daiyan
        echo "Exiting"
        exit 1

fi

cp /vol/grid-solar/sgeusers/daiyan/run_array_mul_sep_16/array_mulfcjava.jar .
mkdir file_array_mulfc
cp -r /vol/grid-solar/sgeusers/daiyan/Data .
java -jar array_mulfcjava.jar isolet5

rm array_mulfcjava.jar
cp -r *  /vol/grid-solar/sgeusers/daiyan/run_array_mul_sep_16/
rm -r Data
rm -r file_array_mulfc
cd /vol/grid-solar/sgeusers/daiyan
pwd
rm -fr /local/tmp/daiyan/$JOB_ID
