CREATE TABLE students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    fname VARCHAR(50)
);

CREATE TABLE papers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100),
    grade INT,
    student_id INT,
    FOREIGN KEY(student_id) REFERENCES students(id)
);

INSERT INTO students (fname) VALUES 
('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');

INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);


-- some joins on these tables

-- implicit inner join
SELECT fname, title, grade FROM students, papers 
    WHERE students.id = papers.student_id
    ORDER BY grade DESC;

-- explicit inner join
SELECT fname, title, AVG(grade) FROM students
    JOIN papers ON students.id = papers.student_id
    GROUP BY students.fname;

-- explicit left join

SELECT fname,
       IFNULL(title, 'missing') AS title, 
       IFNULL(AVG(grade), 0) 
       FROM students
        LEFT JOIN papers on students.id = papers.student_id
        GROUP BY students.id;

SELECT fname,
       IFNULL(grade, 0),
       CASE
            WHEN AVG(grade) > 75 THEN 'PASSING'
        ELSE 'FAILING'
       END AS 'passing_status'
       FROM students
        LEFT JOIN papers on students.id = papers.student_id
        GROUP BY students.id;
