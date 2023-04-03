#Putting this gang of naughty witch stabbers into a nice tidy array
students = [
  "Dr. Hannival Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates"
  ]
  
def print_header
  puts "The Students of Villains Academy"
  puts "-------------"
end

def print(names)
  names.each { |person| puts person }
end

def print_footer(names)
  puts "Overall, we have #{names.count} great(yet somewhat questionable) students"
end

print_header
print(students)
print_footer(students)
#^^^Method calls and arguments passed^^^