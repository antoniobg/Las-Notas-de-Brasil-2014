module PerformanceRecordsHelper

  def yellow_cards(yellow_cards)
    yellow_cards.zero? ? '' : yellow_cards
  end

  def red_card(red_card)
    red_card.zero? ? '' : '&nbsp;'.html_safe
  end

  def print_goals(goals)
    return if goals.zero?
    output = content_tag(:span, ' ', class: 'maki-soccer', data: { toggle: 'tooltip', placement: 'top'}, title: 'Gol')
    output += "x#{goals}" if goals > 1
    output.html_safe
  end

  def class_for_rating(rating)
    classes = ['danger', 'danger', 'danger', 'warning', 'warning', 'info', 'info', 'primary', 'primary', 'success', 'success' ]
    if rating.is_a? Numeric
      classes[rating.floor]
    else
      'default'
    end
  end

  def substitution(record)
    "<i class='fa fa-sign-in substitute'  data-toggle='tooltip' data-placement='top' title='Entró en el #{90 - record.minutes}´'></i>".html_safe unless record.starting?
  end

  def record_rating(record)
    if record.rating_count == 0
      '-'
    else
      record.rating_avg
    end
  end
end
