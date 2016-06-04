require 'sinatra'
require 'geo_pattern'

get '/' do
  erb :index
end

post '/result' do
  seed = params[:seed]
  base = params[:base]

  pattern = GeoPattern.generate(seed, color: base)

  path_to_svg = "/output/#{seed}.svg"
  File.write("public/#{path_to_svg}", pattern.to_svg)

  image = pattern.to_data_uri

  erb :result, locals: { image: image, path_to_svg: path_to_svg }
end
