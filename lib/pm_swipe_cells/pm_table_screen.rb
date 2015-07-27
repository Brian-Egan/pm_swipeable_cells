module ProMotion
  class TableScreen < TableViewController

    def on_cell_created(cell, data)
      super
      cell.setDelegate(self)
      cell.config(right_cells: data[:properties][:right_cells], left_cells: data[:properties][:left_cells]) if cell.respond_to?(:config)
    end

    def tableView(tableView, cellForRowAtIndexPath: indexPath)
      cell = super
      cell.index_path = indexPath
      cell
    end

    def swipeableTableViewCell(cell, didTriggerRightUtilityButtonWithIndex: index)
    trigger_action(cell.right_cells[index][:action], cell.right_cells[index][:arguments], cell.index_path) if (cell.right_cells and cell.right_cells[index])
  end


  def swipeableTableViewCell(cell, didTriggerLeftUtilityButtonWithIndex: index)
     trigger_action(cell.left_cells[index][:action], cell.left_cells[index][:arguments], cell.index_path) if (cell.left_cells and cell.left_cells[index])
  end


  end
end

