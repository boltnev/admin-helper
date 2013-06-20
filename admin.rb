require 'sinatra'
require 'erubis'
require './model'

register_server

get '/' do
  _render :index, {:processes => all_procs.sort_by(&:pid).reverse }
end

get '/attach_to_monitor' do
  _render :attach, {:processes => monitoried_procs }
end

get "/command/:command" do
  begin
    command = params[:command]
    output = `#{command}`
  rescue Errno::ENOENT 
    output = "No such file or directory: " + command
  end
  _render(:command, {:command => command, 
                    :output => format_to_html( output )})
end


