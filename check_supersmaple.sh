# >"result_full_cube.txt";
# >"result_full_cube_ok.txt";
# echo "List of passed cases" >> "result_full_cube_ok.txt";
# echo "List of failed cases" >> "result_full_cube.txt";

~/workspace/ivoldual/ivoldual/ivoldual 0.3 1.3 test.nrrd;

manifold=$(~/workspace/ivoldual/ijkmeshinfo/ijkmeshinfo -terse -report_deep -manifold test.off);
# echo $manifold;
check=$(echo "${manifold}" | head -c6);

~/workspace/ivoldual/ivoldual/ivoldual -supersample 2 0.3 1.3 test.nrrd;

manifold_s=$(~/workspace/ivoldual/ijkmeshinfo/ijkmeshinfo -terse -report_deep -manifold test.off);
# echo $manifold_s;
check_s=$(echo "${manifold_s}" | head -c6);

printf "\n";

if [ $check = "Passed" ]; then
  echo "Original Passed";
elif [ $check = "Failed" ]; then
  echo "Original Failed";
else
  echo "Wrong Case";
fi


if [ $check_s = "Passed" ]; then
  echo "supersample Passed";
elif [ $check_s = "Failed" ]; then
  echo "Supersample Failed";
else
  echo "Wrong Case";
fi

