# Homepage (Root path)
require 'pry'

get '/' do
  erb :index
end

get '/messages' do
  @messages = Message.all
  erb :'messages/index'
end

get '/messages/new' do
  erb :'messages/new'
end

post '/messages' do 
  binding.pry
  @message = Message.new(
    title: params[:title],
    content: params[:content],
    author: params[:author] 
    )
  @message.save
  redirect '/messages'
end