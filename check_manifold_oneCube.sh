>"result_oneCube_nolayer.txt";
>"result_oneCube_layer.txt";
echo "List of failed cases" >> "result_oneCube_nolayer.txt";
echo "List of failed cases" >> "result_oneCube_layer.txt";

minus=0;
star=2;
plus=3;
flag=0;

for v1 in $minus $star $plus; do
  for v2 in $minus $star $plus; do
    for v3 in $minus $star $plus; do
      for v4 in $minus $star $plus; do
	for v5 in $minus $star $plus; do
	  for v6 in $minus $star $plus; do
	    for v7 in $minus $star $plus; do
	      for v8 in $minus $star $plus; do

    echo $v1 $v2 $v3 $v4 $v5 $v6 $v7 $v8;
    ~/workspace/ivoldual/ivol4D/gen_ivol4D $v1 $v2 $v3 $v4 $v5 $v6 $v7 $v8 test.nrrd;


    ~/workspace/ivoldual/ivoldual/ivoldual_nolayer -rm_non_manifold 0.5 2.5 test.nrrd;
    manifold=$(~/workspace/ivoldual/ijkmeshinfo/ijkmeshinfo -terse -report_deep -manifold test.off);
    echo $manifold

    check=$(echo "${manifold}" | head -c6);
    echo $check;

    if [ $check = "Passed" ]; then
      : #echo "Manifold" $v1 $v2 >> "result.txt";
    elif [ $check = "Failed" ]; then
      echo "Non-Manifold" $v1 $v2 $v3 $v4 $v5 $v6 $v7 $v8 >> "result_oneCube_nolayer.txt";
    else
      echo "Wrong Case" $v1 $v2 $v3 $v4 $v5 $v6 $v7 $v8 >> "result_oneCube_nolayer.txt";
    fi


    ~/workspace/ivoldual/ivoldual/ivoldual -rm_non_manifold 0.5 2.5 test.nrrd;
    manifold_old=$(~/workspace/ivoldual/ijkmeshinfo/ijkmeshinfo -terse -report_deep -manifold test.off);
    echo $manifold_old
    check_old=$(echo "${manifold_old}" | head -c6);

    if [ $check_old = "Passed" ]; then
      : #echo "Manifold" $v1 $v2 >> "result.txt";
    elif [ $check_old = "Failed" ]; then
      echo "Non-Manifold" $v1 $v2 $v3 $v4 $v5 $v6 $v7 $v8 >> "result_oneCube_layer.txt";
    else
      echo "Wrong Case" $v1 $v2 $v3 $v4 $v5 $v6 $v7 $v8 >> "result_oneCube_layer.txt";
    fi


	      done
	    done
	  done
	done
      done
    done
  done
done
