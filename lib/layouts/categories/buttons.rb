class UIBarButtonItem
  BUTTON_TYPES = {
    default: UIBarButtonSystemItemDone,
    done: UIBarButtonSystemItemDone,
    cancel: UIBarButtonSystemItemCancel,
    edit: UIBarButtonSystemItemEdit,
    save: UIBarButtonSystemItemSave,
    add: UIBarButtonSystemItemAdd,
    flexible_space: UIBarButtonSystemItemFlexibleSpace,
    fixed_space: UIBarButtonSystemItemFixedSpace,
    compose: UIBarButtonSystemItemCompose,
    reply: UIBarButtonSystemItemReply,
    action: UIBarButtonSystemItemAction,
    organize: UIBarButtonSystemItemOrganize,
    bookmarks: UIBarButtonSystemItemBookmarks,
    search: UIBarButtonSystemItemSearch,
    refresh: UIBarButtonSystemItemRefresh,
    stop: UIBarButtonSystemItemStop,
    camera: UIBarButtonSystemItemCamera,
    trash: UIBarButtonSystemItemTrash,
    play: UIBarButtonSystemItemPlay,
    pause: UIBarButtonSystemItemPause,
    rewind: UIBarButtonSystemItemRewind,
    fast_forward: UIBarButtonSystemItemFastForward,
    undo: UIBarButtonSystemItemUndo,
    redo: UIBarButtonSystemItemRedo,
    page_curl: UIBarButtonSystemItemPageCurl
  }

  BUTTON_STYLES = {
    default: UIBarButtonItemStyleBordered,
    border: UIBarButtonItemStyleBordered,
    plain: UIBarButtonItemStylePlain,
    done: UIBarButtonItemStyleDone
  }

  def self.createTitle(title, target, action, style=:default)
    style = BUTTON_STYLES.fetchWithDefault(style)
    self.alloc.initWithTitle(title, style:style, target:target, action:action)
  end

  def self.createType(button, target, action)
    button = BUTTON_TYPES.fetchWithDefault(button)
    self.alloc.initWithBarButtonSystemItem(button, target:target, action:action)
  end

  def self.fixedSpace(width=20)
    space = self.createType(:fixed_space, nil, nil)
    space.width = width
    space
  end

  def self.flexibleSpace
    self.createType(:flexible_space, nil, nil)
  end
end
