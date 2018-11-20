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
    name = gets.chomp
    if name == "quit"|| cohort == "quit"
      break
    end
  end
  @student_arr
end

def add_student(name,cohort)
  @student_arr << {name: name, cohort: cohort.to_sym}
end 


# print header
def print_header
  puts "The Students of Makers Academy".center(100)
  puts "------------------------------".center(100)
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
  puts "Overall, we have #{names.count} great students".center(100)
end

@student_arr = input_students
print_header
print(@student_arr)
print_footer(@student_arr)
