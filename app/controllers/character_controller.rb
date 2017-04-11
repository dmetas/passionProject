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
  p "*" * 90
  p params
  p "*" * 90
  @character = Character.new(params[:character])
  p @character
  @character.user_id = current_user.id
  if @character.save
    redirect "/users/#{current_user.id}"
  else
    @errors = @character.errors.full_messages
    erb :'/characters/new'
  end
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
