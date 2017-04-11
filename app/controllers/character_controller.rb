get '/users/:user_id/characters' do
  erb :'characters/index'
end

get '/users/:user_id/characters/new' do
  erb :'/characters/new'
end

post '/users/:user_id/characters' do
  redirect '/'
end

get '/users/:user_id/characters/:id' do
  erb :'/characters/show'
end

get '/users/:user_id/characters/:id/edit' do
  erb :'charactes/edit'
end

put '/users/:user_id/characters/:id' do
end

delete '/users/:user_id/characters/:id' do
end
