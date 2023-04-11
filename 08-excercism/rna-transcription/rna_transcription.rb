# frozen_string_literal: true

# Generates RNA complement (per RNA transcription)
module Complement
  extend self # rubocop:disable Style/ModuleFunction

  DNA_NUCLEOTIDES = 'GCTA'
  RNA_NUCLEOTIDES = 'CGAU'

  def of_dna(strand)
    # more details about TR method in the following link
    # https://ruby-doc.org/3.2.2/String.html#method-i-tr
    strand.tr(DNA_NUCLEOTIDES, RNA_NUCLEOTIDES)
  end
end
