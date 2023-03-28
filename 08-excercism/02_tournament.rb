# frozen_string_literal: true

# Tally the results of a small football competition.
module Tournament
  extend self

  ROW = "%-30<team>s | %2<played>s | %2<win>s | %2<draw>s | %2<loss>s | %2<points>s\n"
  MATCH_RESULT_VALUES = {
    'win' => {played: 1, win: 1, draw: 0, loss: 0, points: 3},
    'draw' => {played: 1, win: 0, draw: 1, loss: 0, points: 1},
    'loss' => {played: 1, win: 0, draw: 0, loss: 1, points: 0}
  }.freeze
  FIRST_TEAM = 0
  SECOND_TEAM = 1
  MATCH_RESULT = 2

  def tally(match_results)
    output = ROW % {team: 'Team', played: 'MP', win: 'W', draw: 'D', loss: 'L', points: 'P'}

    tally = parse(match_results)
    tally = calcultations(tally)
    tally = sort(tally)

    tally.each do |match|
      output << (ROW % match)
    end

    output
  end

  private

  def parse(match_results, tally = [])
    split_results(match_results).each do |match|
      parse_match(match, tally)
    end

    tally
  end

  def split_results(match_results)
    match_results.split(/;|\n/).each_slice(3)
  end

  def parse_match(match, tally)
    first_team = match[FIRST_TEAM]
    second_team = match[SECOND_TEAM]

    case match[MATCH_RESULT]
    when 'win'
      update_tally(tally, first_team, MATCH_RESULT_VALUES['win'])
      update_tally(tally, second_team, MATCH_RESULT_VALUES['loss'])
    when 'draw'
      update_tally(tally, first_team, MATCH_RESULT_VALUES['draw'])
      update_tally(tally, second_team, MATCH_RESULT_VALUES['draw'])
    when 'loss'
      update_tally(tally, first_team, MATCH_RESULT_VALUES['loss'])
      update_tally(tally, second_team, MATCH_RESULT_VALUES['win'])
    end
  end

  def update_tally(tally, team, match_result)
    tally << { team: team }.merge(match_result)
  end

  def sort(tally)
    tally.sort_by! { |match| [-match[:points], match[:team]] }
  end

  def calcultations(tally)
    results = tally.group_by { |match| match[:team] }.transform_values do |match|
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

require 'minitest/autorun'
class TournamentTest < Minitest::Test
  def test_just_the_header_if_no_input
    input = <<~INPUT

    INPUT
    expected = <<~TALLY
      Team                           | MP |  W |  D |  L |  P
    TALLY
    assert_equal expected, Tournament.tally(input)
  end

  def test_a_win_is_three_points_a_loss_is_zero_points
    input = <<~INPUT
      Allegoric Alaskans;Blithering Badgers;win
    INPUT
    expected = <<~TALLY
      Team                           | MP |  W |  D |  L |  P
      Allegoric Alaskans             |  1 |  1 |  0 |  0 |  3
      Blithering Badgers             |  1 |  0 |  0 |  1 |  0
    TALLY
    assert_equal expected, Tournament.tally(input)
  end

  def test_a_win_can_also_be_expressed_as_a_loss
    input = <<~INPUT
      Blithering Badgers;Allegoric Alaskans;loss
    INPUT
    expected = <<~TALLY
      Team                           | MP |  W |  D |  L |  P
      Allegoric Alaskans             |  1 |  1 |  0 |  0 |  3
      Blithering Badgers             |  1 |  0 |  0 |  1 |  0
    TALLY
    assert_equal expected, Tournament.tally(input)
  end

  def test_a_different_team_can_win
    input = <<~INPUT
      Blithering Badgers;Allegoric Alaskans;win
    INPUT
    expected = <<~TALLY
      Team                           | MP |  W |  D |  L |  P
      Blithering Badgers             |  1 |  1 |  0 |  0 |  3
      Allegoric Alaskans             |  1 |  0 |  0 |  1 |  0
    TALLY
    assert_equal expected, Tournament.tally(input)
  end

  def test_a_draw_is_one_point_each
    input = <<~INPUT
      Allegoric Alaskans;Blithering Badgers;draw
    INPUT
    expected = <<~TALLY
      Team                           | MP |  W |  D |  L |  P
      Allegoric Alaskans             |  1 |  0 |  1 |  0 |  1
      Blithering Badgers             |  1 |  0 |  1 |  0 |  1
    TALLY
    assert_equal expected, Tournament.tally(input)
  end

  def test_there_can_be_more_than_one_match
    input = <<~INPUT
      Allegoric Alaskans;Blithering Badgers;win
      Allegoric Alaskans;Blithering Badgers;win
    INPUT
    expected = <<~TALLY
      Team                           | MP |  W |  D |  L |  P
      Allegoric Alaskans             |  2 |  2 |  0 |  0 |  6
      Blithering Badgers             |  2 |  0 |  0 |  2 |  0
    TALLY
    assert_equal expected, Tournament.tally(input)
  end

  def test_there_can_be_more_than_one_winner
    input = <<~INPUT
      Allegoric Alaskans;Blithering Badgers;loss
      Allegoric Alaskans;Blithering Badgers;win
    INPUT
    expected = <<~TALLY
      Team                           | MP |  W |  D |  L |  P
      Allegoric Alaskans             |  2 |  1 |  0 |  1 |  3
      Blithering Badgers             |  2 |  1 |  0 |  1 |  3
    TALLY
    assert_equal expected, Tournament.tally(input)
  end

  def test_there_can_be_more_than_two_teams
    input = <<~INPUT
      Allegoric Alaskans;Blithering Badgers;win
      Blithering Badgers;Courageous Californians;win
      Courageous Californians;Allegoric Alaskans;loss
    INPUT
    expected = <<~TALLY
      Team                           | MP |  W |  D |  L |  P
      Allegoric Alaskans             |  2 |  2 |  0 |  0 |  6
      Blithering Badgers             |  2 |  1 |  0 |  1 |  3
      Courageous Californians        |  2 |  0 |  0 |  2 |  0
    TALLY
    assert_equal expected, Tournament.tally(input)
  end

  def test_typical_input
    input = <<~INPUT
      Allegoric Alaskans;Blithering Badgers;win
      Devastating Donkeys;Courageous Californians;draw
      Devastating Donkeys;Allegoric Alaskans;win
      Courageous Californians;Blithering Badgers;loss
      Blithering Badgers;Devastating Donkeys;loss
      Allegoric Alaskans;Courageous Californians;win
    INPUT
    expected = <<~TALLY
      Team                           | MP |  W |  D |  L |  P
      Devastating Donkeys            |  3 |  2 |  1 |  0 |  7
      Allegoric Alaskans             |  3 |  2 |  0 |  1 |  6
      Blithering Badgers             |  3 |  1 |  0 |  2 |  3
      Courageous Californians        |  3 |  0 |  1 |  2 |  1
    TALLY
    assert_equal expected, Tournament.tally(input)
  end

  def test_incomplete_competition_not_all_pairs_have_played
    input = <<~INPUT
      Allegoric Alaskans;Blithering Badgers;loss
      Devastating Donkeys;Allegoric Alaskans;loss
      Courageous Californians;Blithering Badgers;draw
      Allegoric Alaskans;Courageous Californians;win
    INPUT
    expected = <<~TALLY
      Team                           | MP |  W |  D |  L |  P
      Allegoric Alaskans             |  3 |  2 |  0 |  1 |  6
      Blithering Badgers             |  2 |  1 |  1 |  0 |  4
      Courageous Californians        |  2 |  0 |  1 |  1 |  1
      Devastating Donkeys            |  1 |  0 |  0 |  1 |  0
    TALLY
    assert_equal expected, Tournament.tally(input)
  end

  def test_ties_broken_alphabetically
    input = <<~INPUT
      Courageous Californians;Devastating Donkeys;win
      Allegoric Alaskans;Blithering Badgers;win
      Devastating Donkeys;Allegoric Alaskans;loss
      Courageous Californians;Blithering Badgers;win
      Blithering Badgers;Devastating Donkeys;draw
      Allegoric Alaskans;Courageous Californians;draw
    INPUT
    expected = <<~TALLY
      Team                           | MP |  W |  D |  L |  P
      Allegoric Alaskans             |  3 |  2 |  1 |  0 |  7
      Courageous Californians        |  3 |  2 |  1 |  0 |  7
      Blithering Badgers             |  3 |  0 |  1 |  2 |  1
      Devastating Donkeys            |  3 |  0 |  1 |  2 |  1
    TALLY
    assert_equal expected, Tournament.tally(input)
  end

  def test_ensure_points_sorted_numerically
    input = <<~INPUT
      Devastating Donkeys;Blithering Badgers;win
      Devastating Donkeys;Blithering Badgers;win
      Devastating Donkeys;Blithering Badgers;win
      Devastating Donkeys;Blithering Badgers;win
      Blithering Badgers;Devastating Donkeys;win
    INPUT
    expected = <<~TALLY
      Team                           | MP |  W |  D |  L |  P
      Devastating Donkeys            |  5 |  4 |  0 |  1 | 12
      Blithering Badgers             |  5 |  1 |  0 |  4 |  3
    TALLY
    assert_equal expected, Tournament.tally(input)
  end
end
