def date_checker(date)
  months = ["january", "february", "march", "april", "may", "june", "july", 
  "august", "september", "october", "november", "december"]
  # if there's a typo or no date listed, the default is november
  date = "november" if !months.include?(date.downcase)
  return date
end


def input_students
  puts "Please enter the students' name and cohort"
  puts "To finish, just hit the return button twice"
  #great empty array
  students = [] 
  #get the first name
  name = gets.chomp
  month = gets.chomp
  month = date_checker(month)
  #while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
    students << {name: name.capitalize, cohort: month.capitalize}
    puts "Now we have #{students.count} students"
    #get another name from the user 
    name = gets.chomp
    break if name.empty?
    #get another month from user
    month = gets.chomp
    month = date_checker(month)
  end
students 
end

# and then print them
def print_header
  puts "The students of Villains Academy"
  puts "---------"
end



def print(names)
  counter = 0 
  while counter < names.length do
    str = "#{counter + 1}. #{names[counter][:name]} (#{names[counter][:cohort]} cohort)"
    puts str.center(80)
    counter += 1
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students".center(80)
end
#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
puts students