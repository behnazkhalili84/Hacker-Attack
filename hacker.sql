CREATE TABLE "person"(
  "person_id" VARCHAR(9) PRIMARY KEY,
  "full_name" TEXT,
  "address" TEXT,
  "building_number" TEXT,
  "phone_number" TEXT
);
.mode csv
.import --skip 1 person.csv person
.mode column
/*
SELECT person_id, full_name
FROM person
ORDER BY person_id ASC
LIMIT 5;
*/
CREATE TABLE "teacher"(
  "person_id" VARCHAR(9) PRIMARY KEY,
  "class_code" TEXT
);
.mode csv
.import --skip 1 teacher.csv teacher
.mode column
/*
SELECT person_id, full_name FROM person
WHERE
person_id
not in (SELECT person_id FROM teacher)
ORDER BY full_name
LIMIT 5;

SELECT COUNT(person_id)
FROM person
WHERE person_id
NOT IN (SELECT person_id FROM teacher);
*/

CREATE TABLE "student"(
    "person_id" VARCHAR(9) PRIMARY KEY,
    "grade_code" TEXT
);

INSERT INTO student (person_id)
SELECT person_id
FROM person
WHERE person_id NOT IN (SELECT person_id FROM teacher);
/*
SELECT * FROM student ORDER BY person_id ASC LIMIT 5;
*/

CREATE TABLE "score1"(
    "person_id" VARCHAR(9),
    "score" INT
);
CREATE TABLE "score2"(
    "person_id" VARCHAR(9),
    "score" INT
);
CREATE TABLE "score3"(
    "person_id" VARCHAR(9),
    "score" INT
);

.mode csv
.import --skip 1 score1.csv score1
.import --skip 1 score2.csv score2
.import --skip 1 score3.csv score3
.mode column

/*SELECT * FROM score1
UNION ALL
SELECT * FROM score2
UNION ALL
SELECT * FROM score3;*/

CREATE TABLE score("person_id" VARCHAR(9),
"score" INTEGER);


INSERT INTO score (person_id, score)
SELECT person_id, score FROM score1
UNION ALL
SELECT person_id, score FROM score2
UNION ALL
SELECT person_id, score FROM score3;


DROP TABLE score1; 
DROP TABLE score2; 
DROP TABLE score3;

/* SELECT * FROM score
ORDER BY person_id
LIMIT 5;


SELECT person_id, count(score)
FROM score
GROUP BY person_id
HAVING count(score) = 3
ORDER BY person_id
LIMIT 5;*/

update student
set grade_code = 
        CASE
        WHEN person_id NOT IN (SELECT DISTINCT person_id FROM score) THEN 'GD-09'
        WHEN person_id IN (SELECT person_id FROM score GROUP BY person_id HAVING COUNT(*) = 1) THEN 'GD-10'
        WHEN person_id IN (SELECT person_id FROM score GROUP BY person_id HAVING COUNT(*) = 2) THEN 'GD-11'
        WHEN person_id IN (SELECT person_id FROM score GROUP BY person_id HAVING COUNT(*) = 3) THEN 'GD-12'
    END;
where student.person_id in (SELECT person_id FROM teacher);
SELECT * FROM student ORDER BY person_id ASC LIMIT 5;