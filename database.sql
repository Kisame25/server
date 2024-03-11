CREATE TABLE User (
  id INT PRIMARY KEY AUTO_INCREMENT,
  full_name VARCHAR(255),
  email VARCHAR(255),
  password VARCHAR(255),
  dob DATE,
  imgaeurl VARCHAR(255),
  role ENUM('admin', 'teacher', 'student') -- Enum values should be the roles you have in your system
);

-- CREATE TABLE School (
--   school_id VARCHAR(255) PRIMARY KEY,
--   name VARCHAR(255),
--   province VARCHAR(255)
-- );

-- CREATE TABLE Class (
--   class_id VARCHAR(255) PRIMARY KEY,
--   name VARCHAR(255),
--   grade INT,
--   subject VARCHAR(255)
-- );

-- CREATE TABLE Admin (
--   admin_id VARCHAR(255) PRIMARY KEY,
--   department VARCHAR(255),
--   FOREIGN KEY (admin_id) REFERENCES User(user_id)
-- );

-- CREATE TABLE Teacher (
--   teacher_id VARCHAR(255) PRIMARY KEY,
--   subject VARCHAR(255),
--   school_id VARCHAR(255),
--   class_id VARCHAR(255),
--   FOREIGN KEY (teacher_id) REFERENCES User(user_id),
--   FOREIGN KEY (school_id) REFERENCES School(school_id),
--   FOREIGN KEY (class_id) REFERENCES Class(class_id)
-- );

-- CREATE TABLE Student (
--   student_id VARCHAR(255) PRIMARY KEY,
--   school_id VARCHAR(255),
--   class_id VARCHAR(255),
--   grade INT,
--   academic_year_start INT,
--   academic_year_end INT,
--   FOREIGN KEY (student_id) REFERENCES User(user_id),
--   FOREIGN KEY (school_id) REFERENCES School(school_id),
--   FOREIGN KEY (class_id) REFERENCES Class(class_id)
-- );

-- CREATE TABLE Exam (
--   exam_id VARCHAR(255) PRIMARY KEY,
--   title VARCHAR(255),
--   class_id VARCHAR(255),
--   teacher_id VARCHAR(255),
--   date DATE,
--   end_time DATETIME,
--   start_time DATETIME,
--   max_score INT,
--   FOREIGN KEY (class_id) REFERENCES Class(class_id),
--   FOREIGN KEY (teacher_id) REFERENCES Teacher(teacher_id)
-- );

-- CREATE TABLE Question (
--   question_id VARCHAR(255) PRIMARY KEY,
--   exam_id VARCHAR(255),
--   type ENUM('mcq', 'true/false', 'written'), -- Enum values should be the types of questions you have
--   text TEXT,
--   score INT,
--   FOREIGN KEY (exam_id) REFERENCES Exam(exam_id)
-- );

-- CREATE TABLE MCQOption (
--   mcq_option_id VARCHAR(255) PRIMARY KEY,
--   question_id VARCHAR(255),
--   text TEXT,
--   isCorrect BOOLEAN,
--   FOREIGN KEY (question_id) REFERENCES Question(question_id)
-- );

-- CREATE TABLE TrueFalseSolution (
--   tf_id VARCHAR(255) PRIMARY KEY,
--   question_id VARCHAR(255),
--   answer BOOLEAN,
--   FOREIGN KEY (question_id) REFERENCES Question(question_id)
-- );

-- CREATE TABLE ExamResult (
--   result_id VARCHAR(255) PRIMARY KEY,
--   exam_id VARCHAR(255),
--   student_id VARCHAR(255),
--   total_score INT,
--   date DATE,
--   end_time DATETIME,
--   start_time DATETIME,
--   FOREIGN KEY (exam_id) REFERENCES Exam(exam_id),
--   FOREIGN KEY (student_id) REFERENCES Student(student_id)
-- );

-- CREATE TABLE StudentMCQAnswer (
--   mcq_answer_id VARCHAR(255) PRIMARY KEY,
--   student_id VARCHAR(255),
--   question_id VARCHAR(255),
--   selected_option_id VARCHAR(255),
--   FOREIGN KEY (student_id) REFERENCES Student(student_id),
--   FOREIGN KEY (question_id) REFERENCES Question(question_id),
--   FOREIGN KEY (selected_option_id) REFERENCES MCQOption(mcq_option_id)
-- );

-- CREATE TABLE StudentTFAnswer (
--   tf_answer_id VARCHAR(255) PRIMARY KEY,
--   student_id VARCHAR(255),
--   question_id VARCHAR(255),
--   input BOOLEAN,
--   FOREIGN KEY (student_id) REFERENCES Student(student_id),
--   FOREIGN KEY (question_id) REFERENCES Question(question_id)
-- );

-- CREATE TABLE StudentWrittenAnswer (
--   written_answer_id VARCHAR(255) PRIMARY KEY,
--   student_id VARCHAR(255),
--   question_id VARCHAR(255),
--   input TEXT,
--   answer_img TEXT, -- Assuming this is a URL or reference to an image file
--   FOREIGN KEY (student_id) REFERENCES Student(student_id),
--   FOREIGN KEY (question_id) REFERENCES Question(question_id)
-- );
