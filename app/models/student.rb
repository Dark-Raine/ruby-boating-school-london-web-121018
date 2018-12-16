class Student
@@all=[]

attr_reader :name
    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.find_student(string)
        @@all.select {|student| student.name == string}
    end

    def add_boating_test(testname, status, instructor)
        BoatingTest.new(self, testname, status, instructor)
    end

    def my_tests
        BoatingTest.all.select do |test|
            if test.student == self
                test
            end
        end
    end

    def grade_percentage
        numberTests = my_tests.length
        passed = 0
        my_tests.each do |test|
            if test.status == "passed"
                passed += 1
            end
        end
        passed.to_f/numberTests*100
        binding.pry
    end

end
