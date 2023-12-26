-- Drop the database if it exists
DROP DATABASE IF EXISTS RMP;

-- Create a new database
CREATE DATABASE RMP;

-- Use the newly created database
USE RMP;

-- School Table
CREATE TABLE school (
    id VARCHAR(50) PRIMARY KEY,
    name VARCHAR(255),
    city VARCHAR(255),
    state VARCHAR(255),
    country VARCHAR(255)
);

-- Department Table
CREATE TABLE department (
    id VARCHAR(50) PRIMARY KEY,
    name VARCHAR(255),
    code VARCHAR(255),
    school_id VARCHAR(50),
    FOREIGN KEY (school_id) REFERENCES school(id) ON DELETE CASCADE
);

-- Course Table
CREATE TABLE course (
    id VARCHAR(50) PRIMARY KEY,
    name VARCHAR(255),
    code VARCHAR(255),
    dept_id VARCHAR(50),
    FOREIGN KEY (dept_id) REFERENCES department(id) ON DELETE CASCADE
);

-- Professor Table
CREATE TABLE professor (
    id VARCHAR(50) PRIMARY KEY,
    name VARCHAR(255),
    dept_id VARCHAR(50),
    FOREIGN KEY (dept_id) REFERENCES department(id) ON DELETE CASCADE
);

-- professor_meta_data Table
CREATE TABLE professor_meta_data (
    prof_id VARCHAR(50) PRIMARY KEY,
    linkedin_url VARCHAR(255),
    scholar_url VARCHAR(255),
    website_url VARCHAR(255),
    FOREIGN KEY (prof_id) REFERENCES professor(id) ON DELETE CASCADE
);

-- dept_school Table
CREATE TABLE dept_school (
    id INT PRIMARY KEY,
    dept_id VARCHAR(50),
    school_id VARCHAR(50),
    FOREIGN KEY (dept_id) REFERENCES department(id) ON DELETE CASCADE,
    FOREIGN KEY (school_id) REFERENCES school(id) ON DELETE CASCADE
);

-- school_course Table
CREATE TABLE school_course (
    id INT PRIMARY KEY,
    school_id VARCHAR(50),
    course_id VARCHAR(50),
    FOREIGN KEY (school_id) REFERENCES school(id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES course(id) ON DELETE CASCADE
);

-- dept_course Table
CREATE TABLE dept_course (
    id INT PRIMARY KEY,
    dept_id VARCHAR(50),
    course_id VARCHAR(50),
    FOREIGN KEY (dept_id) REFERENCES department(id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES course(id) ON DELETE CASCADE
);

-- prof_course Table
CREATE TABLE prof_course (
    id INT PRIMARY KEY,
    prof_id VARCHAR(50),
    course_id VARCHAR(50),
    term VARCHAR(255),
    FOREIGN KEY (prof_id) REFERENCES professor(id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES course(id) ON DELETE CASCADE
);

-- Students Table
CREATE TABLE students (
    id VARCHAR(50) PRIMARY KEY,
    school_id VARCHAR(50),
    name VARCHAR(255),
    FOREIGN KEY (school_id) REFERENCES school(id) ON DELETE CASCADE
);

-- student_ratings Table
CREATE TABLE student_ratings (
    id INT PRIMARY KEY,
    student_id VARCHAR(50),
    prof_course_id INT,
    rating INT,
    avg_rating FLOAT,
    FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE,
    FOREIGN KEY (prof_course_id) REFERENCES prof_course(id) ON DELETE CASCADE
);

-- rating_categories Table
CREATE TABLE rating_categories (
    id INT PRIMARY KEY,
    category_name VARCHAR(255),
    description VARCHAR(1000)
);