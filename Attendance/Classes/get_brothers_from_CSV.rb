#!/usr/bin/ruby
require 'csv'
require_relative 'Brother'

def get_brothers

  brothers = Array.new
  CSV.foreach('Records/manage-users-list.csv') do |x|
    firstname = x[0]
    lastName = x[1]
    phone = x[2]
    email = x[3]
    timeSlot = [4]

    newBro = Brother.new(firstname, lastName, email, phone)
    brothers.push(newBro)
  end

  CSV.foreach('Records/Brothers Swipe Info.csv') do |x|
    #read the line and assign variables
    name = x[0]
    swipe_number = x[1]

    #search the brothers list and assign the swipe info to each brother object
    for brother in brothers
      if name.include? brother.lastname
        brother.set_swipe_info(swipe_number)
      end
    end
  end


  return brothers
end