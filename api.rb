require 'sinatra'
require 'json'
require 'redis'

set :bind, '0.0.0.0'

$Redis = Redis.new(host: ENV["REDIS_PORT_6379_TCP_ADDR"], port: ENV["REDIS_PORT_6379_TCP_PORT"])

before do
  content_type 'application/json'
end

helpers do
  def json_params
    begin
      JSON.parse(request.body.read)
    rescue
      halt 400, { message:'Invalid JSON' }.to_json
    end
  end
end

get '/keys' do
  keys = $Redis.keys('*')
  keys.count == 0 ? { message:'No keys'}.to_json : keys.to_json
end

post '/keys' do
	data_hash = json_params
	data_hash.each {|key, value| $Redis.set(key, value) }
  status 201
end

get '/keys/:id' do |id|
  key_value = $Redis.get(id)
  halt(404, { message:'Key not found or have no value'}.to_json) unless key_value
  key_value.to_json
end
