module PlayersHelper
  CLASS_FOR_POSITION = { 
    'POR' => 'warning', 
    'DEF' => 'danger', 
    'MED' => 'info',
    'DEL' => 'success'
  }
  def class_for_player(player)
    CLASS_FOR_POSITION[player.position.code]
  end
  def class_for_record(record)
    if record.starting?
      CLASS_FOR_POSITION[record.player.position.code]
    else
      'default'
    end
  end

  def player_rating(player)
    if player.rating_count == 0
      '-'
    else
      player.rating_avg
    end
  end
end
