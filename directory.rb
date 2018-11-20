


student_arr = [
  {"name" => "Dr. Hannibal Lecter", "cohort" => :november},
  {"name" => "Darth Vader", "cohort" => :november},
  {"name" => "Nurse Ratched", "cohort" => :november},
  {"name" => "Michael Corleone", "cohort" => :november},
  {"name" => "Alex DeLarge", "cohort" => :november},
  {"name" => "The Wicked Witch of the West", "cohort" => :november},
  {"name" => "Terminator", "cohort" => :november},
  {"name" => "Freddy Krueger", "cohort" => :november},
  {"name" => "The Joker", "cohort" => :november},
  {"name" => "Joffrey Baratheon", "cohort" => :november},
  {"name" => "Norman Bates", "cohort" => :november}
]


# print header
def print_header
  puts "The Students of Villains Academy"
  puts "-------------"
end

#print student list
def print(names)
  names.each {|student| puts "#{student["name"]}, (#{student["cohort"]} cohort)" }
end

#print footer
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

print_header
print(student_arr)
print_footer(student_arr)
