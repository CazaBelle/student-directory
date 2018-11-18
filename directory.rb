


student_arr = [ "Dr. Hannibal Lecter", "Darth Vader", "NUrse Ratched",
  "Michael Corleone", "Alex DeLarge", "The Wicked Witch of the West",
  "Terminator", "Freddy Krueger", "The Joker", "Joffrey Baratheon",
  "Norman Bates" ]


# print header
def print_header
  puts "The Students of Villa&&&ins Academy"
  puts "-------------"
end

#print student list
def print(names)
  names.each {|student| puts student }
end

#print footer
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

print_header
print(student_arr)
print_footer(student_arr)
