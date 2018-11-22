require "csv"
#global array that all methods can access
@students = []

def print_menu 
  # 1. print the menu and ask the user what to do
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
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
  when "1" # input the student
    students = input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit
  else
    puts "I don't know what you meant, try again"
  end
end

# ask user for input
def input_students
  puts "Please enter a name of a student"
  name = STDIN.gets.chomp
  while !name.empty? do
    puts "Please enter the student's cohort"
    cohort = STDIN.gets.chomp
    if cohort.empty?
      cohort = "november"
    end
    add_student(name, cohort) 
    puts "Now we have #{@students.count} students"
    name = STDIN.gets.chomp #.tr() is the alternative to .chomp
    if name == "9"|| cohort == "9"
      break
    end
  end
  @students
end

def show_students
  print_header
  print_students_list(@students)
  print_footer(@students)
end

# print header
def print_header
  if @students.length == 0 # won't print list if no names entered
    input_students
  elsif @students.length > 0
    puts "The Students of Makers Academy".center(100)
    puts "------------------------------".center(100)
  end
end

#print student list
def print_students_list(names)
  cohort_group = names.group_by { |student| student[:cohort] }
  cohort_group.each do |cohort, pairs|
    puts "#{cohort.upcase}".center(100)
      pairs.each do |pair|
        puts "#{pair[:name].capitalize}".center(100)
        puts ""
      end
    end
end

# Adds student and cohort to the array
def add_student(name,cohort)
  @students << {name: name, cohort: cohort.to_sym}
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

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students (filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp(',')
      @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def try_load_students
  filename = ARGV.first 
  return if filename.nil? 
  if File.exist?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end
# @student_arr = input_students
# print_header
# print(@student_arr)
# print_footer(@student_arr)
try_load_students
interactive_menu
# load_students
# # load_students(list.txt)
