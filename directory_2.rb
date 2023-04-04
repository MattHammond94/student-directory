# This program is a duplicate of the original directory.rb file.
# Methods have been added to complete exercises 1-6.

students = [
  {name: "Dr. Hannibal Lecter", hobbies: "Chianti", height: 6, cohort: :november},
  {name: "Darth Vader", hobbies: "Podracing", height: 6.9, cohort: :november},
  {name: "Nurse Ratched", hobbies: "Birdwatching", height: 5.6, cohort: :november},
  {name: "Michael Corleone", hobbies: "Pizza", height: 5.9, cohort: :november},
  {name: "Alex DeLarge", hobbies: "Ultraviolence", height: 5.9, cohort: :november},
  {name: "The Wicked Witch of the West", hobbies: "Her prettys", height: 5.6, cohort: :november},
  {name: "Terminator", hobbies: "John Connor", height: 6.3, cohort: :november},
  {name: "Freddy Krueger", hobbies: "Nightmares", height: 5.9, cohort: :november},
  {name: "The Joker", hobbies: "Magic", height: 6.0, cohort: :november},
  {name: "Joffrey Baratheon", hobbies: "Crossbowin", height: 5.5, cohort: :november},
  {name: "Norman Bates", hobbies: "Motels", height: 6.1, cohort: :november}
  ]
# ^^^Exercise no.5^^^

def numbered(students)
  students.each_with_index do |student, index| 
    puts "#{index + 1}. #{student[:name]}"
  end
end
# ^^^Exercise no.1^^^

def selected_letter(students)
  puts "Select a letter"
  letter = gets.chomp.upcase
  
  students.each do |student| 
    puts student[:name] if student[:name].start_with? letter 
  end
end
# ^^^Exercise no.2^^^
# This method can be greatly improved by adding an if/else to ensure that the 
# input is never more than 1 letter. I will return to this exercise.
# Could even create an array of acceptable letters by pushing all the [0] letters 
# from each student[:name] - making these letters the only acceptable inputs.

def shorter_than_twelve(students)
  students.each do |student| 
    puts student[:name] if student[:name].length < 12
  end
end
# ^^^Exercise no.3^^^

def rewrite(students)
  count = 0
   
  until count == students.size 
      puts students[count][:name]
      count += 1
  end
end
#^^^Exercise no.4^^^

def print_centered(students)
  students.each do |student| 
    puts "#{student[:name]}".center(30)
  end
end
# ^^^Exercise no.6^^^


numbered(students)
selected_letter(students)
shorter_than_twelve(students)
rewrite(students)
print_centered(students)
