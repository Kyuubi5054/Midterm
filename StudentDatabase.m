classdef StudentDatabase
    properties
        Students
    end
    
    methods
        
        function obj = StudentDatabase()
            obj.Students = Student.empty; 
        end
        
        function obj = addStudent(obj, student) % add student to database
            obj.Students = [obj.Students, student];
        end
        
        function student = findStudentByID(obj, ID) % find student by ID
            student = [];
            for i = 1:length(obj.Students)
                if strcmp(obj.Students(i).ID, ID)
                    student = obj.Students(i);
                    return;
                end
            end
            error('Student with ID %s not found.', ID);
        end
        
        function students = getStudentsByMajor(obj, major) % find student by major
            students = obj.Students(arrayfun(@(s) strcmp(s.Major, major), obj.Students));
        end
        
        function saveToFile(obj, filename) % save database
            save(filename, 'obj');
        end
    end
    
    methods (Static) % static method
        function obj = loadFromFile(filename) % load database
            if exist(filename, 'file') ~= 2
                error('File %s not found.', filename);
            end
            temp = load(filename, 'obj');
            if ~isfield(temp, 'obj') || ~isa(temp.obj, 'StudentDatabase')
                error('The file %s does not contain a valid StudentDatabase object.', filename);
            end
            obj = temp.obj;
        end
    end
end
