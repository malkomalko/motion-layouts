# Layouts for RubyMotion

A quick DSL for creating layouts easily in RubyMotion.

## Getting started

Add motion-layouts as a git submodule of your RubyMotion project:

    git clone https://github.com/malkomalko/motion-layouts.git vendor/motion-layouts

Add the motion-layouts lib path to your project 'Rakefile'

```ruby
Motion::Project::App.setup do |app|
  app.name = 'myapp'
  app.files += Dir.glob(File.join(app.project_dir, 'vendor/motion-layouts/lib/**/*.rb'))
end
```

Now, you can use motion-layouts extension in your app:

## Thanks

Quick thanks to https://github.com/mattetti/BubbleWrap for letting me gut
their README.md and for suggesting a rather nice convention for installing
custom libs into the vendor directory until something else better comes
along.

Also, thanks to Laurent and the whole RubyMotion community for making iOS
programming fun to learn.
