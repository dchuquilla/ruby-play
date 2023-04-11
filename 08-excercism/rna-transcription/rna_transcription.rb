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