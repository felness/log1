% Task 2: Relational Data

% The line below imports the data
:- ['one.pl'].
average_grade(Group, Average) :-
    student(Group, _),
    findall(Grade, grade(_, _, Grade), Grades),
    length(Grades, NumGrades),
    sum_list(Grades, Sum),
    Average is Sum / NumGrades.

students_failed_exam(Subject, Students) :-
    subject(Subject, _),
    findall(Student, (student(_, Student), \+ grade(Student, Subject, 2)), Students).

num_students_failed_exam(Group, NumStudents) :-
    student(Group, _),
    findall(Student, (student(Group, Student), grade(Student, _, 2)), FailedStudents),
    length(FailedStudents, NumStudents).
