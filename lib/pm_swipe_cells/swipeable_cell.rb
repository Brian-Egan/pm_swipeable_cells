class SwipeableCell < SWTableViewCell

  attr_accessor :left_cells, :right_cells, :index_path


   def add_right_cells(cells_to_add = {})
    @right_cells_array = Array.new
    cells_to_add.each do |opts|
      @right_cells_array.sw_addUtilityButtonWithColor(opts[:color], title: opts[:title].to_s.capitalize)
    end
    @right_cells_array
  end

  def add_left_cells(cells_to_add = {})
    @left_cells_array = Array.new
    cells_to_add.each do |opts|
      @left_cells_array.sw_addUtilityButtonWithColor(opts[:color], title: opts[:title].to_s.capitalize)
    end
    @left_cells_array
  end


  def config(opts = {})
    @right_cells = opts[:right_cells] if opts[:right_cells]
    @left_cells = opts[:left_cells] if opts[:left_cells]
     if @right_cells
      self.rightUtilityButtons = add_right_cells(@right_cells])
    end
    if @left_cells
      self.leftUtilityButtons = add_left_cells(@left_cells])
    end
  end

  def swipeableTableViewCell(cell, didTriggerRightUtilityButtonWithIndex: index)
    table_screen.trigger_action(@right_cells[index][:action], @right_cells[index][:arguments], @index_path)
  end


  def swipeableTableViewCell(cell, didTriggerLeftUtilityButtonWithIndex: index)
     mp "Action triggered!"
     table_screen.trigger_action(@left_cells[index][:action], @left_cells[index][:arguments], @index_path)
  end

  def close
    self.hideUtilityButtonsAnimated(true)
  end


  def show_buttons(side)
    case side
    when "right", :right
      showRightUtilityButtonsAnimated(true)
    when "left", :left
       showLeftUtilityButtonsAnimated(true)
    end
 end



end