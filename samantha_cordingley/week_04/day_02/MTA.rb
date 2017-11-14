# Create a program that models a simple subway system.

# The program takes the line and stop that a user is getting on at and the line and stop that user is getting off at and prints the journey and the total number of stops for the trip in the console:

# plan_trip 'N', 'Times Square', '6', '33rd' This is only a suggested function name and signature

# There are 3 subway lines:
# The N line has the following stops: Times Square, 34th, 28th, 23rd, Union Square, and 8th
# The L line has the following stops: 8th, 6th, Union Square, 3rd, and 1st
# The 6 line has the following stops: Grand Central, 33rd, 28th, 23rd, Union Square, and Astor Place.
# All 3 subway lines intersect at Union Square, but there are no other intersection points. (For example, this means the 28th stop on the N line is different than the 28th street stop on the 6 line, so you'll have to differentiate this when you name your stops in the arrays.)
# Tell the user the number of stops AND the stops IN ORDER that they will pass through or change at.

MTA = {
  :n_line => ["times square", "34th", "28th", "23rd", "union square", "8th"],
  :l_line => ["8th", "6th", "union square", "3rd", "1st"],
  :six_line => ["grand central", "33rd", "28th", "23rd", "union square", "astor place"],
}

# print MTA
# MTA[:n_line]
# MTA[:n_line][0]

########################NORMAL FUNCTION#######################

def plan_trip(start_line, start_stop, end_line, end_stop)
  start_line_position = MTA[start_line].index(start_stop)
  end_line_position = MTA[end_line].index(end_stop)
  trip_length = end_line_position - start_line_position
  user_journey = MTA[start_line][(start_line_position +1)...end_line_position]
  # puts user_journey
  # puts start_line_position
  # puts end_line_position
  # puts trip_length
  puts "Your trip is #{trip_length} stops in length. Start at the #{start_line}, and get on at platform #{start_stop}. Travel through stops #{user_journey} ,and get off at #{end_stop}."
end

# ############REVERSE FUNCTION####################

def backwards_trip(start_line, start_stop, end_line, end_stop)
  new_line = MTA[start_line].reverse
  start_line_position = new_line.index(start_stop)
  end_line_position = new_line.index(end_stop)
  trip_length = end_line_position - start_line_position
  user_journey = new_line[(start_line_position + 1)...end_line_position]
  # puts user_journey
  # puts new_line
  # puts start_line_position
  # puts end_line_position
  # puts trip_length
  puts "Your trip is #{trip_length} stops in length. Start at the #{start_line}, and get on at platform #{start_stop}. Travel through stops #{user_journey} ,and get off at #{end_stop}."
end

plan_trip :n_line, '34th', :n_line, '8th' #forward on one line test
backwards_trip :n_line, 'union square', :n_line, '34th' #backwards on one line


################CHANGE LINES#########################



def plan_multi_trip(start_line, start_stop, end_line, end_stop)
  start_line_position = MTA[start_line].index(start_stop)
  end_line_position = MTA[end_line].index(end_stop)
  if start_line != end_line
    first_leg = []
    second_leg = []

    MTA[start_line].each do | el |
  if MTA[start_line].index(el) <= MTA[start_line].index('union square') && MTA[start_line].index(el) > MTA[start_line].index(start_stop)
    first_leg.push(el)
  end
end

# print first_leg

MTA[end_line].reverse.each do | el |
  if el == 'union square'
    break;
  else
    second_leg.push(el)
    end
  end
  # print second_leg.reverse!
end

total_journey = first_leg + second_leg
# print total_journey

puts "Your trip is #{total_journey.size} stops in length. Start at the #{start_line}, and get on at platform #{start_stop}. Travel through stops: "
total_journey.map! do | el |
  if el == 'union square'
    puts "Change at union square."
    puts "Get on the #{end_line}."
    puts "Continue on: "
  elsif el != 'union square'
    puts el
  end
end
  puts "Get off at #{end_stop}."
end

plan_multi_trip :n_line, '34th', :l_line, '3rd' #changing at union sq and going forward
plan_multi_trip :six_line, '33rd', :n_line, '8th' #changing at union sq and going forward

######################INPUT FROM USER##################

# def trip_info
#   print "What is your start line? "
#   start_line = gets.chomp
#   print "What is your start stop? "
#   start_stop = gets.chomp
#   print "What is your end line? "
#   end_line = gets.chomp
#   print "What is your end stop? "
#   end_stop = gets.chomp
#   print "Your trip starts at #{start_line}, #{start_stop} and ends at #{end_line}, #{end_stop}."
#   print $user_trip = [start_line, start_stop, end_line, end_stop]
#
# end
#
# trip_info


###############EACH LOOP SYNTAX#####################
#   array.each do |item|
#   puts "The current array item is: #{item}"
# end
