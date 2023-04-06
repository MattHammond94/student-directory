# This program is a copy of the directory.rb file upon completion of step 13
# This codebase will be refactored accordingly to complete the tasks in step 14
@students = []
@acceptable_cohorts = [:january, :february, :march, :april, :may, :june,
                       :july, :august, :september, :october, :november,
                       :december]

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
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
    when "9"
      exit
    else 
      puts "I don't know what you mean, try again"
  end
end

def input_students
  puts "Please enter the name of the students"
  puts "To finish, just hit return twice"
  
  name = STDIN.gets.chomp
  
  while !name.empty? do
    puts "Which cohort does #{name} belong to?"
    cohort = STDIN.gets.chomp.to_sym
    until @acceptable_cohorts.select { |month| month == cohort }.empty? == false do
      puts "This cohort is invalid"
      cohort = STDIN.gets.chomp.to_sym
    end
    @students << {name: name, cohort: cohort}
    student_count = "Now we have #{@students.count} student"
      if @students.count == 1
        puts student_count
      else   
        puts student_count + "s"
      end
    puts "Add another student or hit enter to finish."
    name = STDIN.gets.chomp
  end
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
  file = File.open("students.csv", "w")
  
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

# Loading the students from existing file
def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(",")
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

# Loading files from the command line
def try_load_students
  filename = ARGV.first
  return if filename.nil? 
  if File.exist?(filename)
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

# Methods called
try_load_students
interactive_menu