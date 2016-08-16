class PlayersController < ApplicationController
  authorize_resource

  before_action :authenticate_user!, only: [:edit, :update, :destroy]
  before_action :set_player, only: [:show, :update, :destroy]

  def index
    @players = Player.paginate(:page => params[:page])
  end

  def new
    @player = Player.new
    @entity = Entity.new
    @hero = Hero.new
  end

  def show
  end

  def create
    me = current_user
    @player = me.build_player(player_params)
    entity_params_with_default = entity_params
    entity_params_with_default[:map_point_id] = MapPoint.first.id
    @entity = @player.build_entity(entity_params_with_default)
    @hero = Hero.new(hero_params)

    begin
      ActiveRecord::Base.transaction do
        @player.save
        @entity.save
        @hero.save
        redirect_to players_path
      end
    rescue => e
      p @hero.errors
      render 'new'
    end
  end

  def destroy
    Player.find(params[:id]).destroy
    #flash[:success] = "Point deleted"
    redirect_to players_path
  end

  def edit
    if not params[:id] == current_user.player_id
      @player = Player.find_by_id(current_user.player_id)
    end
  end

  def update
    if @player.update_attributes(player_params) && @player.entity.update_attributes(entity_params)
      #flash[:success] = "Point updated"
      redirect_to @player
    else
      render 'edit'
    end
  end

  private

    def player_params
      params.require(:player).permit(:username)
    end

    def entity_params
      params.require(:entity).permit(:name, :description)
    end

    def hero_params
      params.require(:hero).permit(:strenght, :dexterity, :vitality, :intelligence, :charisma)
    end

    def set_player
      @player = Player.find(params[:id])
    end
end
