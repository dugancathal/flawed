module FlawsHelper
  def default_spans
    [
      ['now', 'FLaWs that need your attention'], 
      [6.hours.from_now, 'Upcoming FLaWs'],
      [12.hours.from_now, 'Halfway around the day'],
      [1.day.from_now, 'One day away'],
      [2.days.from_now, 'Two days out'],
    ]
  end
end
