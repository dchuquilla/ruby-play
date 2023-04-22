# frozen_string_literal: true

# Generates RNA complement (per RNA transcription)
module Complement

  DNA, RNA = 'GCTA', 'CGAU'

  class << self
    def of_dna(strand)
      # more details about tr method in the following link
      # https://ruby-doc.org/3.2.2/String.html#method-i-tr
      strand.tr(DNA, RNA)
    end
  end
end
