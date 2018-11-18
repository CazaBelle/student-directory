
"The Students of Villains Academy"
puts "-------------"

student_arr = [ "Dr. Hannibal Lecter", "Darth Vader", "NUrse Ratched",
  "Michael Corleone", "Alex DeLarge", "The Wicked Witch of the West",
  "Terminator", "Freddy Krueger", "The Joker", "Joffrey Baratheon",
  "Norman Bates" ]

student_arr.map {|student| puts student }

# print the total number of Students
puts "Overall, we have #{student_arr.count} great students"
# important to remember that print() doesn't add new line chars
