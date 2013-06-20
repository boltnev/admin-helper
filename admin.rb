require 'sinatra'
require 'erubis'

TEMPLATES = 'templates/'
DEFAULT_BASE = TEMPLATES + 'base.eruby'
DEFAULT_TITLE = 'The administrator tool'
HOME = ENV["HOME"] 
RADMIN_HOME = HOME + "/.radministrator"

def format_to_html(output)
  output.gsub("\n", "<br />")
end

def _render(template_name, options = {}, title = DEFAULT_TITLE,  base_name = DEFAULT_BASE)
  template_name = template_name.to_s
  template = File.read(TEMPLATES + template_name + '.eruby')
  html = Erubis::Eruby.new(template).result(options)
  base_template = File.read(base_name)
  base = Erubis::Eruby.new(base_template)
  base.result(:title => title, :html => html)
end

def register_server
  Dir.mkdir RADMIN_HOME unless File.exists? RADMIN_HOME
  f = File.open(RADMIN_HOME + '/process.pid', "w")
  f.write(Process.pid)
end

register_server

get '/' do
  _render :hi
end

get "/command/:command" do
  begin
    command = params[:command].to_s
    output = `#{command}`
  rescue Errno::ENOENT 
    output = "No such file or directory: " + command
  end
  _render(:command, {:command => command, 
                    :output => format_to_html( output )})
end
