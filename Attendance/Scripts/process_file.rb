class ProcessFile

  ###############################
  # Initializer And Load Methods
  ###############################

  def initialize(brother_list)
    @brother_list = brother_list


  end

  def read_file (file_name)
    @file_path = file_name
    @file_lines = Array.new
    @brothers_swipe_info = Array.new
    get_brothers_swipe_info
    open_file


    if @file_path == './Records/Manual'
      add_manual

    else
      process_file
    end

    close_file

  end


  ###############################
  # Swipe Info Handlers
  ###############################

  def get_brothers_swipe_info
    @brother_list.each do |x|
      if i = x.swipe_info
        @brothers_swipe_info.push(i.chomp("\n"))
      end
    end
  end

  def get_brother_with_info(swipe_info)
    @brother_list.each do |x|
      if x.swipe_info == swipe_info
        return x
      end
    end
  end

  def get_brother_with_name(name)
    @brother_list.each do |x|
      if x.name == name
        return x
      end
    end
  end


  ###############################
  # Method Implementation
  ###############################

  def open_file
    @file = File.open(@file_path, 'r')
    @file.readlines.each do |x|
      @file_lines.push(x.chomp("\n"))
    end
  end

  def process_file
    @brothers_swipe_info.each do |x|
      brother_with_name = get_brother_with_info(x)

      if (@file_lines[0].include?(';'))
        unless (@file_lines.include?(x))
          brother_with_name.add_absence(@file_path)
        end
      else

        unless (@file_lines.include?(brother_with_name.name))
          bro = brother_with_name
          bro.add_absence(@file_path)
        end
      end
    end
  end

  def add_manual

    @file_lines.each do |x|
      brother = get_brother_with_name(x)

      unless brother.number_of_absences.count == 0
        brother.remove_absence
      end
    end
  end


  def close_file
    @file.close
  end

end