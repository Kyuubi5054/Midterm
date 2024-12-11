% Author: Sam Falk
% Email: falksa78@rowan.edu
% Course: MATLAB Programming - Fall 2024
% Assignment: Midterm
% Task: Student Class Database
% Date: 11/16/24

db = StudentDatabase(); % create database

db = db.addStudent(Student('1', 'Henry', 18, 3.7, 'ngineering')); % add students to database
db = db.addStudent(Student('2', 'Samantha', 21, 3.2, 'chemistry'));
db = db.addStudent(Student('3', 'Savannah', 20, 3.9, 'engineering'));
db = db.addStudent(Student('4', 'Jack', 19, 3.5, 'biology'));

db.saveToFile('student_db.mat'); % save database
db = StudentDatabase.loadFromFile('student_db.mat'); % load database


searchChoice = input('Would you like to search by ID or Major? Enter 1 for ID or 2 for major: '); % asks user to search either by ID or major

switch searchChoice
    case 1
        studentID = input('Enter student ID to search: ', 's'); % ID input
        try
            student = db.findStudentByID(studentID); % search for a student by ID
            student.displayInfo(); % display student's information
        catch ME
            fprintf('Error: %s\n', ME.message); % display error if student is not found
        end

    case 2
        major = input('Enter major to search for students: ', 's'); % major input
        studentsInMajor = db.getStudentsByMajor(major); % searches db for students in specific major

        if isempty(studentsInMajor) % checks for students in inputted major
            fprintf('No students found in the %s major.\n', major);
        else
            
            fprintf('Students in the %s major:\n', major);
            for i = 1:length(studentsInMajor)
                studentsInMajor(i).displayInfo(); % display the student's info
            end
        end

    otherwise
        fprintf('Invalid choice! Please enter 1 to search by ID or 2 to search by Major.\n');
end
