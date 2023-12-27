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

# Define an array of SQL file names
SQL_FILES=("school.sql" "department.sql" "course.sql" "professor.sql" "professor_meta_data.sql"
            "dept_school.sql" "school_course.sql" "dept_course.sql" "prof_course.sql" "student.sql"
            "student_ratings.sql" "rating_categories.sql")

# Loop through each SQL file in the array
for FILE in "${SQL_FILES[@]}"; do
    FULL_PATH="$SQL_FOLDER/$FILE"
    if [ -f "$FULL_PATH" ]; then
        echo "Running script: $FULL_PATH"
        # Use the mysql command to run the SQL script
        mysql -u "$USERNAME" -p"$PASSWORD" "$DB_NAME" < "$FULL_PATH"
        # Check for errors
        if [ $? -ne 0 ]; then
            echo "Error executing script: $FULL_PATH"
            exit 1
        fi
    else
        echo "File not found: $FULL_PATH"
    fi
done

echo "All SQL scripts executed successfully! :)"
