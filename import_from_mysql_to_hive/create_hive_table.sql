create table stu (
id int,
name string,
birthday timestamp
)
partitioned by (year string, month string, day string);
