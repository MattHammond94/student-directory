def input_students
  acceptable_cohorts = [:january, :february, :march, :april, :may, :june,
                        :july, :august, :september, :october, :november,
                        :december]
  
  
  puts "Please enter the name of the students"
  puts "To finish, just hit return twice"
  
  students = []
  name = gets.chomp
  
  while !name.empty? do
    puts "Which cohort does #{name} belong to?"
    
    cohort = gets.chomp.to_sym
    until (acceptable_cohorts.select { |month| month == cohort }.empty?) == false do
      puts "This cohort is invalid"
      cohort = gets.chomp.to_sym
    end
    
    puts "What is #{name}s favourite hobby?"
    hobby = gets.chomp.to_sym
    puts "Finally, which country is #{name} from?"
    country = gets.chomp.to_sym
    
    students << {name: name, cohort: cohort, hobby: hobby, cob: country}
    student_count = "Now we have #{students.count} student"
    
      if students.count == 1
        puts student_count
      else   
        puts student_count + "s"
      end
    puts "Add another student or hit enter to finish."
    name = gets.chomp
  end
  students
end
  
def print_header
  puts "The Students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each do |student| 
    puts "#{student[:name]} (#{student[:cohort]} cohort)" 
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great(yet somewhat questionable) students"
end

students = input_students
print_header
print(students)
print_footer(students)