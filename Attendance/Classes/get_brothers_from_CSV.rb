#!/usr/bin/ruby
require 'csv'
require_relative 'Brother'

def public_getBrothers

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

  return brothers
end