Stage 1/7: School members 
Description
Create the person table and fill it with data from the person.csv file. This table contains teachers and students.
Objectives
Let's break the task into several steps:
•	Create the person table;
•	Change the mode to csv;
•	Import data from person.csv to the person table;
•	Change the mode to column;
•	Select the person_id and full_name fields from the person table. Sort the results by person_id in ascending order. Limit the results to 5;
•	Stage 2/7: Who are you? 
Description 
Your friend created another file. Now you know who the teachers are. First, create the teacher table from teacher.csv. Then compare the teacher table with the person table and find out who the students are.
Objectives
Let's break the task into several steps:
•	Keep table creation statements from the previous step;
•	Create the teacher table;
•	Change the mode to csv;
•	Import data from teacher.csv to the teacher table;
•	Change the mode to column;
•	Select every record from the person table that is missing in the teacher table. This will give you the student's list. Sort the results by full_name in ascending order. Limit results to 5;
•	Use a select statement to find out the number of the students;
•	Count all entries from combined table.
The teacher table will have two columns:
"person_id" VARCHAR(9) PRIMARY KEY,
"class_code" TEXT
Stage 3/7: You are a student 
Description 
In the last stage, you listed the students. Now create the student table and fill it with data.
Objectives
Let's break the task into several steps:
•	Keep table creation statements from the previous steps;
•	Create a student table;
•	Insert the correct data into it;
•	Select all columns from student table. Order the results by person_id ascending. Limit results to '5';
The student table will have two columns.
"person_id" VARCHAR(9) PRIMARY KEY,
"grade_code" TEXT
Stage 4/7: Plenty of files 
Description 
Your friends created three more csv files for you. These files contain the person_id of the students and the annual score. But, unfortunately, your friends didn't tell you the grade_code of the results. You need to find it out in the following steps.
Now, for this step, first create three temporary tables with the csv files. And then, with the union command, merge them all together.
Objectives
Let's break the task into several steps:
•	Keep table creation statements from the previous steps;
•	Create three tables. With the name score1, score2, and score3;
•	Change mode to csv;
•	Import data from csv files to the tables. Files names are score1.csv, score2.csv, and score3.csv;
•	Change mode to column;
•	Select all the data from the score tables and merge them together with the UNION ALL command;
The tables will have two columns:
"person_id" VARCHAR(9),
"score" INTEGER
Stage 5/7: I know your score 
Description 
You've learned how to merge the scores. Now, create the score table. Insert the scores into the score table. When everything is done, delete score1, score2, and score3 tables with the DROP command.
Objectives
Let's break the task into several steps:
•	Keep table creation statements from the previous steps;
•	Create the score table;
•	Insert data from the score1, score2, and score3 tables into the score table;
•	Use the DROP command and delete score1, score2, and score3 tables;
•	Select all columns from the score table. Order the results by person_id. Limit results to 5;
•	Select person_id, count(score) from the score table. Group by person_id. Having count(score) value 3 and order the results by person_id. Limit results to 5;
The score tables will have two columns.
"person_id" VARCHAR(9),
"score" INTEGER
Stage 6/7: Grade codes 
Description 
You have the score table that contains the student's annual scores. But you don't know the students grade_code. First-year students do not have an annual score. Sophomores have one score and so on. With this information, fill in grade_code in the student table.
Objectives
Let's break the task into several steps:
•	Keep table creation statements from the previous steps;
•	Update grade_code in the student table;
•	Select all records from the student table, order by person_id, and limit by 5;
You can use the following statement as an example to update the student table.
update student
set grade_code = 'put the grade code here'
where student.person_id in
(use the query from the previous step);
Stage 7/7: Land ho! 
Description 
You've created your database. For the last-year students who have grade code GD-12 in the student table, calculate the average score.
Objectives
Let's break the task into several steps:
•	Keep table creation statements from the previous steps;
•	Select all records from the score table. Calculate the average score as avg_score. Round to 2 decimal places. Display it if the grade_code is GD-12 in the student table. Group by person_id and order the results by avg_score in descending order;

