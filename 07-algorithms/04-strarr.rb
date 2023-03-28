require "minitest/autorun"

def longest_consec(strarr, k)
  return "" if strarr.size <= k
  founds = Hash.new()
  strarr.each_with_index do |x, i|
    touple = strarr[i,k].join
    founds[touple.size] = touple
  end
  return "" if founds.keys.uniq.count < 2
  greater = founds.keys.uniq.max
  founds.select{|k, v| k == greater}.first.last
end

def testing(actual, expected)
    Test.assert_equals(actual, expected)
end

describe "longest_consec" do
  describe "basi tests" do
    # it "run 1" do
    #   strarr = ["zone", "abigail", "theta", "form", "libe", "zas"]
    #   k = 2
    #   expected_result = "abigailtheta"
    #   run_test(strarr, k, expected_result)
    # end

    it "run 2" do
      strarr = ["ejjjjmmtthh", "zxxuueeg", "aanlljrrrxx", "dqqqaaabbb", "oocccffuucccjjjkkkjyyyeehh", "oocccffuucccjjjkkkjyyyeehf"]
      k = 1
      expected_result = "oocccffuucccjjjkkkjyyyeehh"
      run_test(strarr, k, expected_result)
    end

    # it "run 3" do
    #   strarr = []
    #   k = 3
    #   expected_result = ""
    #   run_test(strarr, k, expected_result)
    # end

    # it "run 4" do
    #   strarr = ["itvayloxrp","wkppqsztdkmvcuwvereiupccauycnjutlv","vweqilsfytihvrzlaodfixoyxvyuyvgpck"]
    #   k = 2
    #   expected_result = "wkppqsztdkmvcuwvereiupccauycnjutlvvweqilsfytihvrzlaodfixoyxvyuyvgpck"
    #   run_test(strarr, k, expected_result)
    # end

    # it "run 5" do
    #   strarr = ["wlwsasphmxx","owiaxujylentrklctozmymu","wpgozvxxiu"]
    #   k = 2
    #   expected_result = "wlwsasphmxxowiaxujylentrklctozmymu"
    #   run_test(strarr, k, expected_result)
    # end

    # it "run 6" do
    #   strarr = ["zone", "abigail", "theta", "form", "libe", "zas"],
    #   k = 2
    #   expected_result = ""
    #   run_test(strarr, k, expected_result)
    # end

    # it "run 7" do
    #   strarr = ["it","wkppv","ixoyx", "3452", "zzzzzzzzzzzz"]
    #   k = 3
    #   expected_result = "ixoyx3452zzzzzzzzzzzz"
    #   run_test(strarr, k, expected_result)
    # end

    # it "run 8" do
    #   strarr = ["it","wkppv","ixoyx", "3452", "zzzzzzzzzzzz"]
    #   k = 15
    #   expected_result = ""
    #   run_test(strarr, k, expected_result)
    # end

    # it "run 9" do
    #   strarr = ["it","wkppv","ixoyx", "3452", "zzzzzzzzzzzz"]
    #   k = 0
    #   expected_result = ""
    #   run_test(strarr, k, expected_result)
    # end
  end

end

 private

  def run_test(strarr, k, expected_result)

    result = longest_consec(strarr, k)
    assert_equal expected_result, result
  end
