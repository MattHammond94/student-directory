#Putting this gang of naughty witch stabbers into a nice tidy array
students = [
  {name: "Dr. Hannival Lecter", cohort: :november},
  {name: "Darth Vader", cohort: :november},
  {name: "Nurse Ratched", cohort: :november},
  {name: "Michael Corleone", cohort: :november},
  {name: "Alex DeLarge", cohort: :november},
  {name: "The Wicked Witch of the West", cohort: :november},
  {name: "Terminator", cohort: :november},
  {name: "Freddy Krueger", cohort: :november},
  {name: "The Joker", cohort: :november},
  {name: "Joffrey Baratheon", cohort: :november},
  {name: "Norman Bates", cohort: :november}
  ]
  
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

print_header
print(students)
print_footer(students)
#^^^Method calls and arguments passed^^^