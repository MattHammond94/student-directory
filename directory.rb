@students = []
@acceptable_cohorts = [:january, :february, :march, :april, :may, :june,
                       :july, :august, :september, :october, :november,
                       :december]

def input_students
  puts "Please enter the name of the students"
  puts "To finish, just hit return twice"
  
  name = gets.chomp
  
  while !name.empty? do
    # Added further statements to allow user to input multiple values to new keys in hash
    puts "Which cohort does #{name} belong to?"
    # This loop only allows users to input a month as a :cohort value 
    # This can also be edited for the other Keys in our hash if required
    cohort = gets.strip.to_sym
    until (@acceptable_cohorts.select { |month| month == cohort }.empty?) == false do
      puts "This cohort is invalid"
      cohort = gets.strip.to_sym
    end
    
    puts "What is #{name}s favourite hobby?"
    hobby = gets.strip.to_sym
    puts "Finally, which country is #{name} from?"
    country = gets.strip.to_sym
    
    @students << {name: name, cohort: cohort, hobby: hobby, cob: country}
    student_count = "Now we have #{@students.count} student"
    
      if @students.count == 1
        puts student_count
      else   
        puts student_count + "s"
      end
    puts "Add another student or hit enter to finish."
    name = gets.strip
  end
end
  
# Center method added to outputs in header method  
def print_header
  puts "The Students of Villains Academy".center(100)
  puts "-------------".center(100)
end

# Control flow added to print method to account for empty arrays
def print_students_list
  if @students.empty? 
    puts "There are currrently no students at the Villains Academy".center(100)
  else
    @students.each do |student| 
      puts "#{student[:name]} (#{student[:cohort]} cohort)".center(100)
    end
  end
end

# Print cohort method added to puts all names within selected cohort
def print_by_cohort
  puts "select a cohort month from 1-12".center(100)
  cohort = gets.strip
  while cohort.to_i < 1 || cohort.to_i > 12
    puts "invalid input".center(100)
    cohort = gets.strip
  end 
  
  @students.each do |hash| 
    hash.map { |k, v| puts hash[:name].center(100) if @acceptable_cohorts[cohort.to_i - 1] == v }
  end
end
  
# Control flow added to footer method to control output  
def print_footer
  if @students.count < 1
    puts "Our most evilest(MF the Super Villain) had better start recruiting because we have no students."
  elsif @students.count == 1
    puts "Overall, we have #{@students.count} great student".center(100)
  elsif @students.count <= 7
    puts "Overall, we have #{@students.count} great students".center(100)
  else 
    puts "These #{@students.count} are a questional bunch".center(100)
  end
end

# Refactoring the interactive menu into smaller methods:
def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end

# I have amended the print_students_list to print_by_cohort below to test the change worked successfully.
def show_students
  print_header
  print_by_cohort
  print_footer
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "9"
      exit
    else 
      puts "I don't know what you mean, try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

interactive_menu