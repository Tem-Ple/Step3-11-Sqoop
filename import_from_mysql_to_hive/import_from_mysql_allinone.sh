sqoop import --connect jdbc:mysql://172.17.0.3:3306/test --username root --password root -m 1  --table student \
--hive-database default --hive-table stu2 \
--hive-import --hive-overwrite

# hive> desc stu;
# OK
# id                  	int                 	                    
# name                	string              	                    
# birthday            	timestamp           	                    
# year                	string              	                    
# month               	string              	                    
# day                 	string              	                    
# 	 	 
# # Partition Information	 	 
# # col_name            	data_type           	comment             
# 	 	 
# year                	string              	                    
# month               	string              	                    
# day                 	string              	                    
# Time taken: 0.105 seconds, Fetched: 13 row(s)
# hive> desc stu2;
# OK
# id                  	int                 	                    
# name                	string              	                    
# birthday            	timestamp           	                    
# Time taken: 0.099 seconds, Fetched: 3 row(s)


hive <<EOF

set hive.exec.dynamic.partition.mode=nonstrict;

insert into stu 
partition (year, month, day)
select id, name, birthday, year(birthday), month(birthday), day(birthday)
from stu2;
EOF
