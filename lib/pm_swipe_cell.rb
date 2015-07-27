unless defined?(Motion::Project::Config)
  raise "This file must be required within a RubyMotion project Rakefile."
end

require 'motion-cocoapods'

Motion::Project::App.setup do |app|

  app.pods do
    pod 'SWTableViewCell'
  end

  Dir.glob(File.join(File.dirname(__FILE__), 'pm_swipe_cell/*.rb')).each do |file|
    app.files.unshift(file)
  end

end