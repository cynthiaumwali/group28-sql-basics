# The ALU Database Schema - Group 28

A relational database for a school system with five entities: Students, Classroom, Faculty, Courses, and Extra_Curricular_Activities, with two junction tables for many-to-many relationships.

## Team

| Member | Name | Owns |
|---|---|---|
| Member A | name | Students |
| Member B | Cynthia | Classroom |
| Member C | name | Faculty |
| Member D | name | Courses |
| Member E | name | Extra_Curricular_Activities + Student_Courses + Student_Activities |

## File

All queries live in this single file: **`group28-schema.sql`**

It runs in this order:
1. `CREATE DATABASE` + `USE`
2. All `CREATE TABLE`, `INSERT` and member-specific `UPDATE` / `DELETE` / `SELECT` queries 
3. Group JOIN queries + 1 aggregate query
4. Normalization check

## Running it

**Option 1 - From your regular shell
```bash
mysql -u root -p < group28-schema.sql
```

**Option 2 - Log into  MYSQL locally and run the file
```bash
SOURCE group28-schema.sql
```

The file drops and recreates the database everytime it's run, so it's safe to re-run from scratch anytime.

## Setup

1. Clone the repo
2. Run the file following the instructions above
3. Confirm your table and queries work before committing changes