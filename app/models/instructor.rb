class Instructor
    @@all = []
    attr_accessor :name
    
    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.find_instructor(string)
        @@all.select {|instructor| instructor.name == string}
    end

    def pass_student(studentName, testName)
        BoatingTest.all.collect! do |test|
            if test.student.name == studentName && test.testname == testName
                test.status = "passed"
                test
            end
        end
    end

    def fail_student(studentName, testName)
        BoatingTest.all.collect! do |test|
            if test.student.name == studentName && test.testname == testName
                test.status = "failed"
                test
            end
        end
    end
    
end
