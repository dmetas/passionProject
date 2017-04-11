before do
  # find_by_user_id_and_project_id(params[:user_id],params[:project_id])
  # @character = find_by()
end

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
  # @character = 
  erb :'/characters/show'
end

get '/users/:user_id/characters/:id/edit' do
  erb :'charactes/edit'
end

put '/users/:user_id/characters/:id' do
end

delete '/users/:user_id/characters/:id' do

end
