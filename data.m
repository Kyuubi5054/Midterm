function plotGPADistribution(db)
    gpas = [db.Students.GPA];
    histogram(gpas);
    title('GPA Distribution');
    xlabel('GPA');
    ylabel('Frequency');
end

function plotAverageGPAByMajor(db)
    majors = unique({db.Students.Major});
    avgGPA = arrayfun(@(major) mean([db.getStudentsByMajor(major{1}).GPA]), majors);
    bar(categorical(majors), avgGPA);
    title('Average GPA by Major');
    xlabel('Major');
    ylabel('Average GPA');
end

function plotAgeDistribution(db)
    ages = [db.Students.Age];
    histogram(ages);
    title('Age Distribution');
    xlabel('Age');
    ylabel('Frequency');
end
