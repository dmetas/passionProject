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
  @character = Character.new(params[:character])
  @character.user_id = current_user.id
  if @character.save
    redirect "/users/#{current_user.id}"
  else
    @errors = @character.errors.full_messages
    erb :'/characters/new'
  end
end

get '/users/:user_id/characters/:id' do
  @character = Character.find(params[:id])
  @user = User.find(params[:user_id])
  erb :'/characters/show'
end

get '/users/:user_id/characters/:id/edit' do
  erb :'charactes/edit'
end

put '/users/:user_id/characters/:id/upvote' do
  p "*" * 100
  p params
  @user = User.find(params[:user_id])
  @character = Character.find(params[:id])
  @attribute = params[:attribute]

  @new_val = (@character[@attribute] + 1)
  @character.update({ @attribute => @new_val})
  redirect "/users/#{@user.id}/characters/#{@character.id}"
end

put '/users/:user_id/characters/:id/downvote' do
  @user = User.find(params[:user_id])
  @character = Character.find(params[:id])
  @attribute = params[:attribute]

  @new_val = (@character[@attribute] - 1)
  @character.update({ @attribute => @new_val})
  redirect "/users/#{@user.id}/characters/#{@character.id}"
end

delete '/users/:user_id/characters/:id' do

end

