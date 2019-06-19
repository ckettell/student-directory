def input_students
  puts "Please enter the students' name, then hobby, the country of birth"
  puts "To finish, just hit the return button twice"
  #great empty array
  students = [] 
  #get the first name
  name = gets.chomp
  hobby = gets.chomp
  birth_place = gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
    students << {name: name, hobby: hobby, birth_place: birth_place, cohort: :november}
    puts "Now we have #{students.count} students"
    #get another name from the user 
    name = gets.chomp
    break if name.empty? 
    hobby = gets.chomp
    birth_place = gets.chomp
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
    puts "#{counter + 1}. #{names[counter][:name]} (#{names[counter][:hobby]} hobby) (#{names[counter][:birth_place]} country of birth) (#{names[counter][:cohort]} cohort)"
    counter += 1
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end
#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
=begin
students = [
  {name: "Dr. Hannibal Lecter", cohort: :november},
  {name: "Darth Vader", cohort: :november},
  {name: "Nurse Ratched", cohort: :november},
  {name: "Michael Corleone", cohort: :november},
  {name: "Alex DeLarge", cohort: :november},
  {name: "The Wicked Witch of the West", cohort: :november},
  {name: "Terminator", cohort: :november},
  {name: "Freddy Krueger", cohort: :november},
  {name: "The Joker", cohort: :november},
  {name: "Joffrey Baratheon", cohort: :november},
  {name: "Norman Bates", cohort: :november}
]

def test(children)
  children.each do |child|
      if child[:name].length > 12
      puts "#{child[:name]}"
      end
  end
end

test(students)
=end

