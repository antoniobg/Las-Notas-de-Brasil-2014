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
end
