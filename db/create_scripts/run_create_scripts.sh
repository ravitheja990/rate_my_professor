#!/bin/bash

# Check if correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <username> <password>"
    exit 1
fi

# Database connection details
USERNAME=$1
PASSWORD=$2
DB_NAME="rate_my_professor"
SQL_FOLDER="."

# Loop through all SQL files in the current folder
for FILE in "$SQL_FOLDER"/*.sql; do
    if [ -f "$FILE" ]; then
        echo "Running script: $FILE"
        # Use the mysql command to run the SQL script
        mysql -u "$USERNAME" -p"$PASSWORD" "$DB_NAME" < "$FILE"
        # Check for errors
        if [ $? -ne 0 ]; then
            echo "Error executing script: $FILE"
            exit 1
        fi
    fi
done

echo "All SQL scripts executed successfully! :)"
