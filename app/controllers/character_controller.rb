before do
  # find_by_user_id_and_project_id(params[:user_id],params[:project_id])
  # @character = find_by()
end

get '/users/:user_id/characters' do
  erb :'characters/index'
end

get '/users/:user_id/characters/new' do
  @stat_roll1 = stat_roll
  @stat_roll2 = stat_roll
  @stat_roll3 = stat_roll
  @stat_roll4 = stat_roll
  @stat_roll5 = stat_roll
  @stat_roll6 = stat_roll

  # @racial_bonuses = []
  # http://5e-api.com/v1/races/{race}
  # grab value of "racial_bonus" key (value is an array of hashes)
  # for each stat on the form, check for racial bonus and display
  
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

  char_class = @character.character_class

  class_img_hash = {
      'Barbarian' => "/images/Barb.jpg",
      'Bard' => "/images/Barb.jpg",
      'Cleric' => "/images/cleric.jpg",
      'Druid' => "/images/druid.jpg",
      'Fighter' => "/images/fighter.jpg",
      'Monk' => "/images/Monk.jpg",
      'Paladin' => "/images/Paladin.jpg",
      'Ranger' => "/images/Ranger.jpg",
      'Rogue' => "/images/Rogue.jpg",
      'Sorcerer' => "/images/sorcerer.jpg",
      'Warlock' => "/images/warlock.jpg",
      'Wizard' => "/images/warlock.jpg"
    }

    @class_img = class_img_hash[char_class]

  erb :'/characters/show'
end

get '/users/:user_id/characters/:id/edit' do
  erb :'charactes/edit'
end

put '/users/:user_id/characters/:id/upvote' do
  @user = User.find(params[:user_id])
  @character = Character.find(params[:id])
  @new_val = (@character.read_attribute params[:attribute]) + 1
  @character.update(params[:attribute] => @new_val)

  if request.xhr?
    @new_val.to_s
  else
    redirect "/users/#{@user.id}/characters/#{@character.id}"
  end
end

put '/users/:user_id/characters/:id/downvote' do
  @user = User.find(params[:user_id])
  @character = Character.find(params[:id])
  @new_val = (@character.read_attribute params[:attribute]) - 1
  @character.update(params[:attribute] => @new_val)

  if request.xhr?
    @new_val.to_s
  else
    redirect "/users/#{@user.id}/characters/#{@character.id}"
  end
end

delete '/users/:user_id/characters/:id' do
  @user = User.find(params[:user_id])
  @character = Character.find(params[:id])
  @character.destroy
  if request.xhr?
    @user.id.to_s
  else
    redirect "/users/#{@user.id}"
  end
end

