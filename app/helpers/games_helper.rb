module GamesHelper
  def class_for_game(game)
    game.finished? ? 'info' : ''
  end

  def render_game_body(game)
    if game.finished?
      render 'games/finished_game_body', game: game
    else
      render 'games/not_finished_game_body', game: game
    end
  end

  def time_for_game(date)
    day = day(date)
    if day.nil?
      date.to_s(:for_games_date_time)
    else
      "#{day} #{date.to_s(:for_games_time)}"
    end
  end

  def day(date)
    today = Time.now
    if date.month == today.month or date.year == today.year
      case date.day
      when today.day
        day = "Hoy"
      when today.day + 1
        day = "Mañana"
      when today.day - 1
        day = "Ayer"
      end
    end
  end

  def game_is_finished(game)
    game.finished? ? "Finalizado" : "Por jugar"
  end

end
