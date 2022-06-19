open (DATA, '<','DNA-ex.txt') or die "Can't open database";
@dna = <DATA> ;
$size = @dna;
close(DATA) or die "Can't open database";
print ("\n\n");

my(%genetic_code_table) = (
    'UUU' => 'F',    
    'UUC' => 'F',
    'UUA' => 'L',
    'UUG' => 'L',
    'CUU' => 'L',
    'CUC' => 'L',
    'CUA' => 'L',
    'CUG' => 'L',
    'AUU' => 'I',
    'AUC' => 'I',
    'AUA' => 'I',
    'AUG' => 'M',
    'GUU' => 'V',
    'GUC' => 'V',
    'GUA' => 'V',
    'GUG' => 'V',
    'UCU' => 'S',
    'UCC' => 'S',
    'UCA' => 'S',
    'UCG' => 'S',
    'CCU' => 'P',
    'CCC' => 'P',
    'CCA' => 'P',
    'CCG' => 'P',
    'ACU' => 'T',
    'ACC' => 'T',
    'ACA' => 'T',
    'ACG' => 'T',
    'GCU' => 'A',
    'GCC' => 'A',
    'GCA' => 'A',
    'GCG' => 'A',
    'UAU' => 'Y',
    'UAC' => 'Y',
    'UAA' => '.',
    'UAG' => '.',
    'CAU' => 'H',
    'CAC' => 'H',
    'CAA' => 'Q',
    'CAG' => 'Q',
    'AAU' => 'N',
    'AAC' => 'N',
    'AAA' => 'K',
    'AAG' => 'K',
    'GAU' => 'D',
    'GAC' => 'D',
    'GAA' => 'E',
    'GAG' => 'E',
    'UGU' => 'C',
    'UGC' => 'C',
    'UGA' => '.',
    'UGG' => 'W',
    'CGU' => 'R',
    'CGC' => 'R',
    'CGA' => 'R',
    'CGG' => 'R',
    'AGU' => 'S',
    'AGC' => 'S',
    'AGA' => 'R',
    'AGG' => 'R',
    'GGU' => 'G',
    'GGC' => 'G',
    'GGA' => 'G',
    'GGG' => 'G',
);
$x = 0;
for (my $k=0; $k < $size + 1; $k++) { 
$i = 0;    
$check = substr( @dna[$k], $i, 1);

if($check eq '>' || $k == $size){
    if($k > 0){
    print "Final form of amino acit sequence process. \n";
    for ($i = 0 ; $i < $x; $i++ )  {
    print "@fullAacid[$i] ";
    }
    print "\n\n";
    }
    
    if($k < $size){
    print "NEW sequence starting....";
    print "\n\n";   
    }
    
    $x=0;
    }
else{
    
print "@dna[$k]"; 

if($k == $size - 1){
print "\n";   
}
    
for ($i = 0 ; $i < length(@dna[$k]); $i++ )  { 
    @tmp[$i] = substr( @dna[$k], $i, 1);
    
    if(@tmp[$i] eq 'A') { 
        @codingstrand[$i]="T";
        @rna[$i]="U";
    }
    
    elsif(@tmp[$i] eq 'T') { 
        @codingstrand[$i]="A";
        @rna[$i]="A";
    }
        
    elsif(@tmp[$i] eq 'C') { 
        @codingstrand[$i]="G";
        @rna[$i]="G";
        
    }
    
    elsif(@tmp[$i] eq 'G') { 
        @codingstrand[$i]="C";
        @rna[$i]="C";
    }
 print "@codingstrand[$i]";   
}
print "\t\t-> Coding strand of DNA\n";

for ($i = 0 ; $i < length(@dna[$k]); $i++ )  {
print "@rna[$i]";
}
print "\t\t-> mRNA\n";

my $j = 0;
for ($i = 0 ; $i < length(@dna[$k]); $i = $i+3) {
    @codon[$j] = @rna[$i].@rna[$i+1].@rna[$i+2];
    print "@codon[$j] ";
    $j++;
}

print "-> Codon\n";  

for (my $j = 0 ; $j < length(@dna[$k])/3; $j++) {
        print "$genetic_code_table{@codon[$j]}   ";
        @fullAacid[$x]=$genetic_code_table{@codon[$j]} ;    
        $x = $x + 1 ;
}

 print "\n\n";
}
};