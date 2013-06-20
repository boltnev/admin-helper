require 'sinatra'
require 'erubis'
require './model'

register_server

get '/' do
  _render :index, {:processes => monitored_procs.sort_by(&:pid).reverse }
end

get '/attach_to_monitor' do
  _render :attach, {:processes => monitored_procs }
end

post '/attach_to_monitor' do
  add_proc_to_monitor(params[:procname])
  redirect ''
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


