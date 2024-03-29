@students = []

def date_checker(date)
  while true do
  months = ["january", "february", "march", "april", "may", "june", "july", 
  "august", "september", "october", "november", "december"]
    if date.empty?
      date = "november"
      break
    elsif !months.include?(date.downcase)
      puts "Typo, go again"
      date = STDIN.gets.chomp
    else
    return date
    end
  end
  return date
end

def input_students
  puts "Please enter the student's name and cohort"
  puts "To finish, just hit the return button twice"
  #great empty array
  #get the first name
  name = STDIN.gets.chomp
  month = STDIN.gets.chomp
  month = date_checker(month)
  #while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
    add_students(name, month)
    puts "Now we have #{@students.count} students"
    #get another name from the user 
    name = STDIN.gets.chomp
    break if name.empty?
    #get another month from user
    month = STDIN.gets.chomp
    month = date_checker(month)
  end
@students 
end

# method below organises students by cohort


def by_cohort(students)
  sorted_by_cohort = {}
  students.each do |student|
  if sorted_by_cohort[student[:cohort]].nil?
    sorted_by_cohort[student[:cohort]] = student[:name]
  else 
    sorted_by_cohort[student[:cohort]] << (student[:name])
  end
  sorted_by_cohort.each do |key, value|
    puts "#{key} #{value}"
  end
  end
end

# and then print them
def print_header
  puts "The students of Villains Academy".center(80) 
  puts "---------".center(80) 
end

#print by cohort
def print_cohort
  puts sorted_by_cohort
end


# print students by names and cohort
def print_student_list(names)
  counter = 0 
  while counter < names.length do
    str = "#{counter + 1}. #{names[counter][:name]} (#{names[counter][:cohort]} cohort)"
    puts str.center(80)
    counter += 1
  end
end

def print_footer(names)
  if names.count == 0
    puts "No students here".center(80)
  elsif names.count == 1
    puts "Overall, we have #{names.count} great student".center(80)   
  else
    puts "Overall, we have #{names.count} great students".center(80)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to student.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of studnets
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
  csv_line = student_data.join(",")
  file.puts csv_line
  end
  file.close
end

# add students and cohort to the @students array 

def add_students(name, cohort)
  @students << {name: name.capitalize, cohort: cohort.capitalize.to_sym}
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
  add_students(name, cohort)
  end
  file.close
end

def try_load_students
  filename = ARGV.first
  return load_students() if filename.nil?
  if File.exists?(filename)
    load_students(filename)
      puts "Loaded #{@students.count} from #{filename}"
  else
      puts "Sorry, #{filename} does not exist"
      exit
  end
end

def show_students
  print_header
  print_student_list(@students)
  print_footer(@students)
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit
    else 
      puts "Whoops, did not get that"
  end
end

def interactive_menu
  loop do 
    print_menu
    process(STDIN.gets.chomp)
  end
end


#nothing happens until we call the methods
try_load_students
interactive_menu
puts students
print_header
print(@students)
puts "---------".center(80) 
print_footer(@students)