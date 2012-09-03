unless defined?(Motion::Project::Config)
  raise "#{__FILE__} must be required within a RubyMotion project Rakefile."
end

Motion::Project::App.setup do |app|
  root = File.expand_path('../..', __FILE__)
  files = Dir.glob(File.join(root, 'lib/**/*.rb')).reject{ |f| f == __FILE__ }
  files.each do |file|
    app.files.unshift(file)
  end

  app.files_dependencies File.join(root, 'lib/layouts/nodes/ui_text_field.rb') => File.join(root, 'lib/layout_base.rb')
  app.files_dependencies File.join(root, 'lib/layouts/nodes/ui_tool_bar.rb') => File.join(root, 'lib/layout_base.rb')
end
