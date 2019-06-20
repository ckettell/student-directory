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
      date = gets.chomp
    else
    return date
    end
  end
  return date
end

def input_students
  puts "Please enter the students' name and cohort"
  puts "To finish, just hit the return button twice"
  #great empty array
  #get the first name
  name = gets.chomp
  month = gets.chomp
  month = date_checker(month)
  #while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
    @students << {name: name.capitalize, cohort: month.capitalize}
    puts "Now we have #{@students.count} students"
    #get another name from the user 
    name = gets.chomp
    break if name.empty?
    #get another month from user
    month = gets.chomp
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
  puts "9. Exit"
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
    when "9"
      exit
    else 
      puts "Whoops, did not get that"
  end
end

def interactive_menu
  loop do 
    print_menu
    process(gets.chomp)
  end
end


#nothing happens until we call the methods
interactive_menu
puts students
print_header
print(@students)
puts "---------".center(80) 
print_footer(@students)
