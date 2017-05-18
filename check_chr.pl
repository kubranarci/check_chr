use strict;
use warnings;

my $num_args = $#ARGV + 1;
if ($num_args != 2) {
    print "\nUsage: check_chr.pl input_file output_file\n";
    exit;
}

my $input_file=$ARGV[0];
my $output_file=$ARGV[1];

open(OUTPUT,">",$output_file);

my @array1;

open (my $inFile, '<', $input_file) or die $!;

while (<$inFile>) {
	push (@array1, split /\n/);

}

close ($inFile);

foreach my $el (@array1){

	my @line = (split /\t/, $el);


	if ($line[0] =~ /^chr/ || $line[0] =~/[a-zA-Z]/ && $line[0] =~/[\d]/)

	{print OUTPUT "$el\n";}

	else {print OUTPUT "chr$el\n";}

}

close OUTPUT;

