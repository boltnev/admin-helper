#!/usr/bin/env ruby
require 'sinatra'
require 'admin-helper/model'

register_server

set :public_folder, File.dirname(__FILE__) + '/view/public'

get '/' do
  _render :index, {:all_procs => all_procs, :monitored_procs => DB[:monitored_procs].all }
end

get '/attach_to_monitor' do
  _render :attach, {:processes => DB[:monitored_procs].all }
end

post '/attach_to_monitor' do
  add_proc_to_monitor(params[:procname])
  redirect '/attach_to_monitor'
end

post '/kill9' do
  begin 
    procs = all_procs
    pid = params[:pid].to_i
    monitored_procs.map(&:pid).include? pid
    kill9(pid)
  rescue 
    # cannot kill9
  end
  procs.delete_if{|p| p.pid == pid }
  render_to_s :index, {:all_procs => procs, 
                   :monitored_procs => DB[:monitored_procs].all }
end

post '/unattach_process' do
  del_proc_from_monitor(params[:procname]);
  render_to_s(:attach, {:processes => DB[:monitored_procs].all})
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


