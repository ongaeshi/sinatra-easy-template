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

set :app_file, __FILE__
set :haml, :format => :html5, :escape_html => true

helpers do
  alias h escape_html
end

get '/' do
  haml :index
end

get '/*.css' do |path|
  content_type 'text/css'
  sass path.to_sym, :sass => {:load_paths => [options.views]}
end

get '/*' do |path|
  pass unless File.exist?(File.join(options.views, "#{path}.haml"))
  haml path.to_sym
end
