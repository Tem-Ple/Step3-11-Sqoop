YEAR=2017
MONTH=11
DAY=21
sqoop import --connect jdbc:mysql://172.17.0.3:3306/test --username root --password root -m 1 --hive-database default \
--hcatalog-table stu --hive-overwrite \
--table student \
--where "birthday BETWEEN '$YEAR-$MONTH-$DAY 00:00:00' and '$YEAR-$MONTH-$DAY 23:59:59'" \
--hcatalog-partition-keys year,month,day \
--hcatalog-partition-values  "$YEAR,$MONTH,$DAY"
