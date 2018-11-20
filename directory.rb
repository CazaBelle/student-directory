

# ask user for input
def input_students
  puts "Please enter a name of a student"
  name = gets.chomp
  puts "Hit return twice to exit"
  student_arr = []

  while !name.empty? do
    student_arr << {name: name, cohort: :november}
    puts "Now we have #{student_arr.count} students"
    name = gets.chomp
  end
  student_arr
end

# print header
def print_header
  puts "The Students of Makers Academy"
  puts "-------------"
end

#print student list
def print(names)
  # Excerise 1 - add number to start of student name
  # Exercise 1 - modify program to only print names of students with a certain letter
  names.each_with_index {|student, index| puts "#{index + 1}. #{student[:name]}, (#{student[:cohort]} cohort)" if student[:name].downcase. start_with?("a") }
end

#print footer
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

student_arr = input_students
print_header
print(student_arr)
print_footer(student_arr)
