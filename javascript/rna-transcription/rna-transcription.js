let complements = {G: "C", C: "G", T: "A", A: "U"}

function DnaTranscriber() {}

DnaTranscriber.prototype.toRna = function (dna) {
  return dna.split("").map(nucleotide => complements[nucleotide]).join("")
}

module.exports = DnaTranscriber
