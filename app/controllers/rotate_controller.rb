class RotateController < ApplicationController
  def index
    Pusher['lucky_draw'].trigger('started', {})

    sleep(5.seconds)

    selected_user = draw

    Pusher['lucky_draw'].trigger('finished', {selected: selected_user.id})

    render json: {}
  end

  def reset
    Pusher['lucky_draw'].trigger('reseted', {})

    render json: {}
  end

  def draw
    User.first(:offset => rand(User.count))
  end
end
