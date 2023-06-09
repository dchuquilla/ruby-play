# frozen_string_literal: true

# Tally the results of a small football competition.
module Tournament
  extend self

  ROW = "%-30<team>s | %2<played>s | %2<win>s | %2<draw>s | %2<loss>s | %2<points>s\n"
  MATCH_RESULT_VALUES = {
    'win' => {played: 1, win: 1, draw: 0, loss: 0, points: 3},
    'draw' => {played: 1, win: 0, draw: 1, loss: 0, points: 1},
    'loss' => {played: 1, win: 0, draw: 0, loss: 1, points: 0}
  }
  FIRST_TEAM = 0
  SECOND_TEAM = 1
  MATCH_RESULT = 2

  def tally(match_results)
    output = ROW % {team: 'Team', played: 'MP', win: 'W', draw: 'D', loss: 'L', points: 'P'}

    matches = parse(match_results)
    matches = calcultations(matches)
    matches = sort(matches)

    output += matches.reduce('') { |output, match| output + (ROW % match) }

    output
  end

  private

  def parse(match_results, matches = [])
    split_results(match_results).each do |match|
      parse_match(match, matches)
    end

    matches
  end

  def split_results(match_results)
    match_results.split(/;|\n/).each_slice(3)
  end

  def parse_match(match, matches)
    first_team = match[FIRST_TEAM]
    second_team = match[SECOND_TEAM]

    case match[MATCH_RESULT]
    when 'win'
      update_tally(matches, first_team, MATCH_RESULT_VALUES['win'])
      update_tally(matches, second_team, MATCH_RESULT_VALUES['loss'])
    when 'draw'
      update_tally(matches, first_team, MATCH_RESULT_VALUES['draw'])
      update_tally(matches, second_team, MATCH_RESULT_VALUES['draw'])
    when 'loss'
      update_tally(matches, first_team, MATCH_RESULT_VALUES['loss'])
      update_tally(matches, second_team, MATCH_RESULT_VALUES['win'])
    end
  end

  def update_tally(matches, team, match_result)
    matches << { team: team }.merge(match_result)
  end

  def sort(matches)
    matches.sort_by! { |match| [-match[:points], match[:team]] }
  end

  def calcultations(matches)
    results = matches.group_by { |match| match[:team] }.transform_values do |match|
      match.each_with_object({team: '', played: 0, win: 0, draw: 0, loss: 0,
                              points: 0}) do |match1, sums|
        sums[:team] = match1[:team]
        sums[:played] += match1[:played].to_i
        sumarize_points(match1, sums)
      end
    end
    results.map(&:last)
  end

  def sumarize_points(match, sums)
    sums[:win] += match[:win].to_i
    sums[:draw] += match[:draw].to_i
    sums[:loss] += match[:loss].to_i
    sums[:points] += match[:points].to_i
  end
end
