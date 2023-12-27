# rate_my_professor
Rate My Professor

## Initial Database Setup
1. Create a Database in local MySQL DB using the below command
```CREATE DATABASE rate_my_professor;```

2. Go to db/create_scripts folder and run below command to create all tables:
```bash run_create_scripts.sh <mysql_username> <mysql_password>```

3. Go to db/insert_scripts folder and run below command to insert dummy data to all tables:
```bash run_insert_scripts.sh <mysql_username> <mysql_password>```
