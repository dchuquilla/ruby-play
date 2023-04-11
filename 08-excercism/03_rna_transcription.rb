# frozen_string_literal: true

# Generates RNA complement (per RNA transcription)
module Complement
  extend self # rubocop:disable Style/ModuleFunction

  DNA_TO_RNA_MAP = {G: 'C', C: 'G', T: 'A', A: 'U'}

  def of_dna(dna_strand)
    return '' if dna_strand == ''

    rna_result = ''
    dna_strand.each_char do |nucleotide|
      p 'nucleotide', DNA_TO_RNA_MAP[nucleotide.to_sym]
      rna_result += DNA_TO_RNA_MAP[nucleotide].nil? ? '' : DNA_TO_RNA_MAP[nucleotide.to_sym]
    end

    rna_result
  end
end

require 'minitest/autorun'
class RnaTranscriptionTest < Minitest::Test
  def test_empty_rna_sequence
    assert_equal '', Complement.of_dna('')
  end

  def test_rna_complement_of_cytosine_is_guanine
    assert_equal 'G', Complement.of_dna('C')
  end

  # def test_rna_complement_of_guanine_is_cytosine
  #   assert_equal 'C', Complement.of_dna('G')
  # end

  # def test_rna_complement_of_thymine_is_adenine
  #   assert_equal 'A', Complement.of_dna('T')
  # end

  # def test_rna_complement_of_adenine_is_uracil
  #   assert_equal 'U', Complement.of_dna('A')
  # end

  # def test_rna_complement
  #   assert_equal 'UGCACCAGAAUU', Complement.of_dna('ACGTGGTCTTAA')
  # end
end
