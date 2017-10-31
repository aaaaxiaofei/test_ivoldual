>"result_full_cube.txt";
>"result_full_cube_ok.txt";
echo "List of passed cases" >> "result_full_cube_ok.txt";
echo "List of failed cases" >> "result_full_cube.txt";

minus=0;
star=2;
plus=3;
flag=0;
fail_counter=0;

for v1 in $minus $star $plus; do
  for v2 in $minus $star $plus; do
    for v3 in $minus $star $plus; do
      for v4 in $minus $star $plus; do
      	for v5 in $minus $star $plus; do
      	  for v6 in $minus $star $plus; do
      	    for v7 in $minus $star $plus; do
      	      for v8 in $minus $star $plus; do
            		for v9 in $minus $star $plus; do
            		  for v10 in $minus $star $plus; do
            		    for v11 in $minus $star $plus; do
            		      for v12 in $minus $star $plus; do


    echo $v1 $v2 $v3 $v4 $v5 $v6 $v7 $v8 $v9 $v10 $v11 $v12;
    ~/workspace/ivoldual/full_cube/gen_two_cubes $v1 $v2 $v3 $v4 $v5 $v6 $v7 $v8 $v9 $v10 $v11 $v12 test.nrrd;
    ~/workspace/ivoldual/ivoldual/ivoldual -subdivide 0.5 1.5 test.nrrd;

    manifold=$(~/workspace/ivoldual/ijkmeshinfo/ijkmeshinfo -terse -report_deep -manifold test.off);
    echo $manifold
    # check=${manifold:0:6};
    check=$(echo "${manifold}" | head -c6);
    echo $check;

    if [ $check = "Passed" ]; then
      echo "Manifold" $v1 $v2 $v3 $v4 $v5 $v6 $v7 $v8 $v9 $v10 $v11 $v12 >> "result_full_cube_ok.txt";
    elif [ $check = "Failed" ]; then
      echo "Non-Manifold" $v1 $v2 $v3 $v4 $v5 $v6 $v7 $v8 $v9 $v10 $v11 $v12 >> "result_full_cube.txt";
      ((fail_counter++));
      cp test.nrrd ./subdivide_fail/test_fail${fail_counter}.nrrd;
    else
      echo "Wrong Case" $v1 $v2 $v3 $v4 $v5 $v6 $v7 $v8 $v9 $v10 $v11 $v12 >> "result_full_cube.txt";
    fi

    
                      done
                    done
                  done
                done
      	      done
      	    done
      	  done
      	done
      done
    done
  done
done
