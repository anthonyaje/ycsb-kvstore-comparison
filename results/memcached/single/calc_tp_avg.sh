for i in 1 5 10 15 20 25 30 
do
    cat out_run_$i-* | grep -i throughput | awk '{total +=$3; count++} END {print total/count}' >> tp_avg
done

