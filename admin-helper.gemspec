Gem::Specification.new do |s|
  s.name        = 'admin-helper'
  s.version     = '0.0.1'
  s.date        = Date.today.to_s
  s.summary     = "The administrator tool"
  s.description = "The server administrator helper. It has process manager, it also can kill processes from web. To use, just run `admin-helper` on server"
  s.authors     = ["Ilya Boltnev"]
  s.email       = 'ilya@boltnev.com'
  s.files       = Dir['lib/**/*/*'] + Dir['lib/*'] 
  s.executables = ["admin-helper"]
  s.homepage    = 'https://github.com/boltnev/admin-helper'

  s.add_runtime_dependency 'thin'
  s.add_runtime_dependency 'sinatra'
  s.add_runtime_dependency 'erubis'
  s.add_runtime_dependency 'sqlite3'
  s.add_runtime_dependency 'sequel'
  s.add_runtime_dependency 'sys-proctable'
  s.add_development_dependency 'debugger'

end


