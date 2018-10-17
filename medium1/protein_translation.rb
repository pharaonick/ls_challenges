=begin
RNA: "AUGUUUUCU" =>
Codons: "AUG", "UUU", "UCU" => 
Protein: "Methionine", "Phenylalanine", "Serine"
(64 codons => 20 amino acids)
STOP codons terminate translation of RNA strand
=end

class InvalidCodonError < StandardError; end

class Translation
  CODON_LOOKUP = {
    %w[AUG]             => 'Methionine',
    %w[UUU UUC]         => 'Phenylalanine',
    %w[UUA UUG]         => 'Leucine',
    %w[UCU UCC UCA UCG] => 'Serine',
    %w[UAU UAC]         => 'Tyrosine',
    %w[UGU UGC]         => 'Cysteine',
    %w[UGG]             => 'Tryptophan',
    %w[UAA UAG UGA]     => 'STOP'
  }

  # ACTUALLY THE VALIDITY CHECK SHOULD BE HERE REALLY SINCE YOU 
  # CAN OTHERWISE BYPASS IT IF IT'S ON THE STRAND METHOD

  # most people set the CODON hash up more simply to make all this easier
  # have separate entries for each so can simply 
  # CODON_LOOKUP.fetch(codon) { fail InvalidCodonError }

  def self.of_codon(codon)
    CODON_LOOKUP.find { |codons, _| codons.include?(codon) }.last
  end

  def self.of_rna(strand)
    raise InvalidCodonError if invalid_strand?(strand)

    non_terminating = strand.split(/(UAA)|(UAG)|(UGA)/).first
    
    non_terminating.scan(/.../).map do |codon|
      of_codon(codon)
    end
  end

  def self.invalid_strand?(strand)
    strand.match(/[^ACGU]/) || strand.length % 3 != 0
  end
end

# Array#take_while is a good option to interrupt iteration
  # basically scan, take while codon != STOP, map

# Can also just return out of `each_with_object` since have an object to return
# if the codon is STOP

# Must be a more 'pure' regexp solution?


# note this below would be pointless because you can break out of an iteration
# Could also manually loop 3 codons at a time and break when the triple matches STOP
  # results = []
  # idx = 0
  # loop do
    # strand[idx...idx+3]
      # break if STOP else add value to results
    # idx += 3
  # end

p Translation.of_codon('BBB')
