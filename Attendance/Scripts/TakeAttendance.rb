#!/usr/bin/ruby

require './Classes/Brother'
require './Classes/get_brothers_from_CSV'
require_relative 'process_file'
#Get Brothers
#Go through Text Files and grab attendance 
#Assign Absences to them 
#Go through Brothers
#Make Text file to display who has absences 
class TakeAttendance

  def get_brother_list
    puts 'Getting Brothers...'
    @brother_list = get_brothers
  end

  def get_brother_attendance
    puts 'Getting Attendance...'

    pf = ProcessFile.new(@brother_list)
    pf.read_file('./Records/9_26_16.txt')
    pf.read_file('./Records/Bid Acceptance.txt')
    pf.read_file('./Records/Bid Acceptance.txt')
    pf.read_file('./Records/Brothers 8_29_16.txt')
    pf.read_file('./Records/Brothers 9_19.txt')
    pf.read_file('./Records/Chapter_9_12.txt')
    pf.read_file('./Records/10_3_16.txt')
  end

  def get_brother_absences
    puts 'Getting Brother Absences...'
    @brother_list.each do | x |
        puts "#{x.firstname} #{x.lastname}: #{x.number_of_absences} absences."
    end

  end

  def create_absence_file
    puts 'Creating Absence File...'


  end
end


#
#	MAIN SCRIPT FOR TAKING ATTENDANCE
#	MIGHT BE EXTRACTED LATER 
#
attendance = TakeAttendance.new
attendance.get_brother_list
attendance.get_brother_attendance
attendance.get_brother_absences
attendance.create_absence_file