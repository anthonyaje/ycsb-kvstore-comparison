for i in 1 4 8 12 16 20 24 28 32 
do
    cat out_run_$i-* | grep -i "\[READ\], AverageLatency(us)" | awk '{total +=$3; count++} END {print total/count}' >> lat_read_avg
done

