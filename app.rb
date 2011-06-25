# -*- coding: utf-8 -*-
#
# @file 
# @brief
# @author ongaeshi
# @date   2011/06/25

require 'rubygems'
require 'sinatra'
require 'haml'

$LOAD_PATH.unshift 'lib'
require 'haml/filters/blockcode'

set :haml, :format => :html5

helpers do
  alias h escape_html
end

get '/' do
  haml :index
end

get '/*.css' do |path|
  scss path.to_sym
end

get '/*.html' do |path|
  pass unless File.exist?(File.join(options.views, "#{path}.haml"))
  haml path.to_sym
end

get '/*' do |path|
  pass unless File.exist?(File.join(options.views, "#{path}.haml"))
  haml path.to_sym
end

get '/hello*' do |path|
  num = path.to_i
  num = 1 if num == 0

  hello = 'Hello '
  hello = 'Hel ' if (num > 10000)
  hello = 'H ' if (num > 100000)
  return "The end." if (num > 1000000)
    
  str = "hello#{num} -> <a href=\"hello#{num*2}\">#{num*2}</a>"
  str += "<p>" + "#{hello}" * num + "</p>"
  str
end
