get '/users' do
  erb :'users/index'
end

get '/users/new' do
  erb :'users/new'
end

post '/users' do
  @new_user = User.new(params[:user])
  if @new_user.save
    session[:user_id] = @new_user.id
    redirect "/user/#{current_user.id}"
  else
    @errors = @new_user.errors.full_messages
    erb :'users/new'
  end
end

get '/users/:id' do
  @user = current_user
  @user_characters = @user.characters
  erb :'users/show'
end

get '/users/:id/edit'
  erb :"users/edit"
end

put '/users/:id'
end

delete '/users:id'
end
