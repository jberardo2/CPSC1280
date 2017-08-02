top -bn1 | grep load | awk '{printf "%.2f%%\t\t\n", $(NF-2)}'

RY=$(free -m | awk 'NR==2{printf "%.2f%%\t\t", $3*100/$2 }')
DISK=$(df -h | awk '$NF=="/"{printf "%s\t\t", $5}')
CPU=$(top -bn1 | grep load | awk '{printf "%.2f%%\t\t\n", $(NF-2)}')

end=$((SECONDS+3600))

while [ $SECONDS -lt $end ]; do
  echo "$MEMORY$DISK$CPU"
  sleep 5
done
