get '/users/:user_id/characters'
  erb :'characters/index'
end

get '/users/:user_id/characters/new'
  erb :'/characters/new'
end

post '/users/:user_id/characters'
  redirect '/'
end

get '/users/:user_id/characters/:id'
  erb :'/characters/show'
end

get '/users/:user_id/characters/:id/edit'
  erb :'charactes/edit'
end

put '/users/:user_id/characters/:id'
end

delete '/users/:user_id/characters/:id'
end
