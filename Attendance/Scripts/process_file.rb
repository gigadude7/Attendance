class ProcessFile

  ###############################
  # Initializer And Load Methods
  ###############################

  def initialize(brother_list)
    @brother_list = brother_list
    @brothers_swipe_info = Array.new
    @file_lines = Array.new
  end

  def read_file (file_name)
    @file_path = file_name
    get_brothers_swipe_info
    open_file
    process_file
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
      unless @file_lines.include?(x)
        bro = get_brother_with_info(x)
        bro.add_absence(@file_path)
      end
    end
  end

  def close_file
    @file.close
  end

end