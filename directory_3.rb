# This program is a copy of the directory.rb file upon completion of step 13
# This codebase will be refactored accordingly to complete the tasks in step 14
require 'csv'
@students = []
@acceptable_cohorts = [:january, :february, :march, :april, :may, :june,
                       :july, :august, :september, :october, :november,
                       :december]

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to selected file"
  puts "4. Load a list of students from a selected file"
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
      puts "Goodbye!"
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

def file_selection
  filename = STDIN.gets.chomp 
  while filename.empty? || !File.exist?(filename)
    puts "Filename not acceptable, please re-enter a filename"
    filename = STDIN.gets.chomp
  end
  filename
end

def save_students
  puts "Enter the filename you would like to save your list to:"
  filename = file_selection
  CSV.open(filename, "w") do |csv|
    @students.each do |student|
      csv << [student[:name], student[:cohort]]
    end
  end
  puts "#{@students.count} students have been saved to #{filename}"
end

def load_students
  puts "Enter a filename ending with its file type extension (E.g: file.csv)"
  filename = file_selection
    CSV.foreach(filename) do |row|
      name, cohort = row
      add_student(name, cohort.to_sym)
    end
  puts "Successfully loaded #{@students.count} from #{filename}"
end

# def default_load_students
#   filename = ARGV.first
#   if filename.nil? 
#     load_students
#   elsif File.exist?(filename)
#     load_students(filename)
#     puts "Loaded #{@students.count} from #{filename}"
#   else
#     puts "Sorry, #{filename} doesn't exist."
#     exit
#   end
# end

# default_load_students
interactive_menu