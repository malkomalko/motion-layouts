# Layouts for RubyMotion

A DSL for creating layouts easily in RubyMotion.  Also comes bundled with a
set of categories to make life easier.  I'm using the word category from
objective-c land which is basically the same as re-opening classes in ruby :D.

## Getting started

Add motion-layouts as a git submodule of your RubyMotion project:

    git clone https://github.com/malkomalko/motion-layouts.git vendor/motion-layouts

Add the motion-layouts lib path to your project 'Rakefile'

```ruby
Motion::Project::App.setup do |app|
  app.name = 'myapp'
  app.files.unshift(Dir.glob(File.join(app.project_dir, 'vendor/motion-layouts/lib/**/*.rb')))
end
```

Now, you can use motion-layouts to start making some layouts.

I put all my layouts by convention into app/layouts but feel free to do
whatever you want.

## Define a layout

```ruby
class NameEditorLayout
  include Layouts::Base

  def self.template
    UIToolbar {
      anchor 'top'
      height 50
      resize :top, :right, :left, :width
      items [
        ['Cancel', 'cancel'],
        [:flexible_space],
        ['Done', 'done']
      ]
    }
    UITextField {
      id 'nameTextField'
      delegate @controller
      top 90
      width 85.percent
      align 'center'
      text_color '222222'
      background_color 'FFFFFF'
      border_style 'rounded'
      resize :top, :right, :left, :width
      placeholder 'Enter the photo album name'
    }
  end
end
```

You start by including Layouts::Base and defining a self.template method.

## Instantiate your view (from controller)

```ruby
  def viewWillAppear(animated)
    super
    view.fromLayout(NameEditorLayout, self)
  end
```

boom.. that's it, you should see a toolbar and a text field in your view.

## How it works

The project includes a mixture of categories and nodes.

Nodes are the entry point inside self.template in your layout:

```ruby
class NameEditorLayout
  include Layouts::Base

  def self.template
    UIToolbar {
      ...
    }
    UITextField {
      ...
    }
  end
end
```

Every node inherits from LayoutBase which sets up a lot of shared functionality
and handles proper instantiation.

You have access to a few instance variables inside each node:

```
@parent - the parent view
@view - the current view
@controller - the controller who instantiated the view via view.fromLayout
```

Every node can also set a defaults hash.

Let's take a look at the UITextField node:

```ruby
module Layouts
  class UITextField < LayoutBase
    def self.defaults
      {
        width: @parent.bounds.size.width * 0.90,
        height: 30
      }
    end

    def border_style(style)
      @view.borderStyle = ::UITextField::BORDER_STYLES.fetchWithDefault(style)
    end

    def placeholder(text)
      @view.placeholder = text
    end
  end
end
```

This is where the categories come in.  To make defining these nodes as easy
as possible, I'm creating a collection of categories to make the process
as smooth as can be.

Take a look inside the lib/layouts/categories folder to see some of the
helpers I've defined for you.

## Todo

Tests Tests Tests.  This was mostly thrown together very quickly as a POC,
but there is nothing complex going on here.

Filling out a complete set of nodes.  I'm throwing this out now in hopes that
people can create wrapper nodes for all the missing standard UI classes.

## Thanks

Quick thanks to https://github.com/mattetti/BubbleWrap for letting me gut
their README.md and for suggesting a rather nice convention for installing
custom libs into the vendor directory until something else better comes
along.

Also, thanks to Laurent and the whole RubyMotion community for making iOS
programming fun to learn.
