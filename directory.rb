#global array that all methods can access
@student_arr = []
# ask user for input
def input_students
  puts "Please enter a name of a student"
  name = gets.chomp
  while !name.empty? do
    puts "Please enter the student's cohort"
    cohort = gets.chomp
    if cohort.empty?
      cohort = "november"
    end

    add_student(name, cohort) 
    puts "Now we have #{@student_arr.count} students"
    name = gets.chomp #.tr() is the alternative to .chomp
    if name == "quit"|| cohort == "quit"
      break
    end
  end
  @student_arr
end

# Adds student and cohort to the array
def add_student(name,cohort)
  @student_arr << {name: name, cohort: cohort.to_sym}
end 

# print header
def print_header
  if @student_arr.length == 0 # won't print list if no names entered
    input_students
  elsif @student_arr.length > 0
    puts "The Students of Makers Academy".center(100)
    puts "------------------------------".center(100)
  end
end

#print student list
def print(names)
  cohort_group = names.group_by { |student| student[:cohort] }
  cohort_group.each do |cohort, pairs|
    puts "#{cohort.upcase}".center(100)
      pairs.each do |pair|
        puts "#{pair[:name].capitalize}".center(100)
        puts ""
      end
    end
end

#print footer
def print_footer(names)
  if names.count == 1
    puts "Overall, we have #{names.count} great student".center(100)
  elsif names.count > 1
    puts "Overall, we have #{names.count} great students".center(100)
  else
    input_students
  end
end

@student_arr = input_students
print_header
print(@student_arr)
print_footer(@student_arr)
