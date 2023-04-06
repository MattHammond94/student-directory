# This program is a copy of the directory.rb file upon completion of step 13
# This codebase will be refactored accordingly to complete the tasks in step 14
@students = []
@acceptable_cohorts = [:january, :february, :march, :april, :may, :june,
                       :july, :august, :september, :october, :november,
                       :december]

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students_2.csv"
  puts "4. Load the list from students_2.csv"
  puts "5. Select a file to load the list from"
  puts "9. Exit"
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "5"
      load_students_selection
    when "9"
      puts "Goodbye!"
      exit
    else 
      puts "I don't know what you mean, try again"
  end
end

# Refactored my input students method into 3 methods:
def input_students
  puts "Please enter the name of the students"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp
  
  while !name.empty? do
    puts "Which cohort does #{name} belong to?"
    cohort = STDIN.gets.chomp.to_sym
    cohort_acceptability(cohort)
    add_student(name, cohort)
    total_students
    puts "Add another student or hit enter to finish."
    name = STDIN.gets.chomp
  end
end

def cohort_acceptability(cohort)
  until @acceptable_cohorts.select { |month| month == cohort }.empty? == false do
    puts "This cohort is invalid"
    cohort = STDIN.gets.chomp.to_sym
  end
end

def total_students
  student_count = "Now we have #{@students.count} student"
    if @students.count == 1
      puts student_count
    else   
      puts student_count + "s"
    end
end

# Add student method added 
def add_student(name, cohort)
  @students << {name: name, cohort: cohort}
end
  
def show_students
  print_header
  print_students_list
  print_footer
end
  
def print_header
  puts "The Students of Villains Academy"
  puts "-------------"
end

def print_students_list
  if @students.empty? 
    puts "There are currrently no students at the Villains Academy"
  else
    @students.each do |student| 
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end
  
def print_footer
  if @students.count < 1
    puts "Our most evilest(MF the Super Villain) had better start recruiting because we have no students."
  elsif @students.count == 1
    puts "Overall, we have #{@students.count} great student"
  elsif @students.count <= 7
    puts "Overall, we have #{@students.count} great students"
  else 
    puts "These #{@students.count} are a questionable bunch"
  end
end

# Saving our data to a file:
def save_students
  file = File.open("students_2.csv", "w")
  
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  puts "Students have been saved to #{filename}"
  file.close
end

# Added new method to take a selected file from user.
# Can be editted with a Regex to ensure that user input always ends in some form of
# extension however I have spent too long trying to implement this. 
# For now works on the assumption a .csv file is stored within dir.
def load_students_selection
  puts "Type a filename ending with its file type extension (E.g: file.csv)"
  filename = gets.chomp 
  while filename.empty? || !filename.end_with?(".csv")
    puts "Filename not acceptable, please re enter a filename"
    filename = gets.chomp
  end
  load_students(filename)
end

# Both methods updated to ensure a default file is passed:
def load_students(filename = "students_2.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(",")
    add_student(name, cohort.to_sym)
  end
  puts "Successfully loaded #{@students.count} from #{filename}"
  file.close
end

def default_load_students
  filename = ARGV.first
  if filename.nil? 
    load_students
  elsif File.exist?(filename)
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

# Methods called
# default_load_students
interactive_menu