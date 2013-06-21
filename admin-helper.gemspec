Gem::Specification.new do |s|
  s.name        = 'admin-helper'
  s.version     = '0.0.1'
  s.date        = Date.today.to_s
  s.summary     = "The administrator tool"
  s.description = ""
  s.authors     = ["Ilya Boltnev"]
  s.email       = 'ilya@boltnev.com'
  s.files       = ["lib/admin-helper.rb", "lib/admin-helper/model.rb",
                   "lib/view/attach.eruby",
                   "lib/view/base.eruby",
                   "lib/view/command.eruby",
                   "lib/view/index.eruby"]
  s.executables = ["admin-helper"]
  s.homepage    = 'https://github.com/boltnev/admin-helper'
end

