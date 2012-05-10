class UITableView
  def deleteRows(rows)
    self.deleteRowsAtIndexPaths(rows,
      withRowAnimation:UITableViewRowAnimationFade)
  end

  def selectRow(row)
    self.selectRowAtIndexPath(
      NSIndexPath.indexPathForRow(row, inSection:row),
      animated:false,
      scrollPosition:UITableViewScrollPositionMiddle)
  end
end

class UITableViewCell
  CID = 'CELL'

  STYLES = {
    default: UITableViewCellStyleDefault,
    subtitle: UITableViewCellStyleSubtitle,
    value1: UITableViewCellStyleValue1,
    value2: UITableViewCellStyleValue2
  }

  ACCESSORIES = {
    default: UITableViewCellAccessoryNone,
    disclosure: UITableViewCellAccessoryDisclosureIndicator,
    detail: UITableViewCellAccessoryDetailDisclosureButton,
    checkmark: UITableViewCellAccessoryCheckmark
  }

  SELECT_STYLES = {
    default: UITableViewCellSelectionStyleBlue,
    blue: UITableViewCellSelectionStyleBlue,
    gray: UITableViewCellSelectionStyleGray,
    none: UITableViewCellSelectionStyleNone
  }

  def self.display(tableView, opts={})
    style = STYLES.fetchWithDefault(opts[:style])
    accessoryType = ACCESSORIES.fetchWithDefault(opts[:accessory])
    editAccessory = ACCESSORIES.fetchWithDefault(opts[:edit_accessory])
    selectionStyle = SELECT_STYLES.fetchWithDefault(opts[:selection])

    tableView.dequeueReusableCellWithIdentifier(CID) || begin
      cell = self.alloc.initWithStyle(style, reuseIdentifier:CID)
      cell.accessoryType = accessoryType
      cell.editingAccessoryType = editAccessory
      cell.selectionStyle = selectionStyle
      cell
    end
  end
end
