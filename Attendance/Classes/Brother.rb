#!/usr/bin/ruby

class Brother

  def initialize(first_name, last_name, email, phone_number)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @phone_number = phone_number
  end

  def say_hello
    "I am #{@first_name} #{@last_name} and my email is: #{@email}"
  end

  def firstname
    @first_name
  end

  def lastname
    @last_name
  end


end