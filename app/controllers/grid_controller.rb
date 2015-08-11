class GridController < ApplicationController
  before_action :set_map_point, only: [:point]
  def show
    @map_points = MapPoint.includes(:entities).all.group_by(&:x)

    me = current_user
    @player = me.player
    @map_point = me.player.entity.map_point
  end

  def point
    render partial: 'map_points/map_point'
  end

  def move
  end

  private

    def set_map_point
      @map_point = MapPoint.includes(:entities).find(params[:id])
    end

end
