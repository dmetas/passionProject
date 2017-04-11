# Show login form

get '/sessions/new' do
  erb :'sessions/new'
end

# Act of logging in

post '/sessions' do
  @user = User.find_by(username: params[:username])
  if @user && @user.password == params[:password]
    login(@user)
    redirect "/users/#{@user.id}"
  else
    @errors = ["The username and password do not match."]
    erb :'sessions/new'
  end
end

# Act of logging out

delete '/sessions/:id' do
  logout
  redirect '/'
end
