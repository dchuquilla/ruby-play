# frozen_string_literal: true

# Generates RNA complement (per RNA transcription)
module Complement

  DNA, RNA = 'GCTA', 'CGAU'

  class << self

    def of_dna(strand)
      # see `String#tr` documentation for more information.
      # https://ruby-doc.org/core-3.0.2/String.html#method-i-tr
      strand.tr(DNA, RNA)
    end

  end

end
