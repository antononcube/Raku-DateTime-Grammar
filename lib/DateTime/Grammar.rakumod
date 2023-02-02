use v6.d;

use DateTime::Grammarish;
use DateTime::Actions::Raku;

grammar DateTime::Grammar
        does DateTime::Grammarish {

}

#-----------------------------------------------------------
my $pCOMMAND = DateTime::Grammar;

my $actionsObj = DateTime::Actions::Raku.new();

sub datetime-parse(Str:D $command, Str:D :$rule = 'TOP') is export {
    $pCOMMAND.parse($command, :$rule);
}

sub datetime-subparse(Str:D $command, Str:D :$rule = 'TOP') is export {
    $pCOMMAND.subparse($command, :$rule);
}

sub datetime-interpret(Str:D $command,
                       Str:D:$rule = 'TOP',
                       :$actions = $actionsObj) is export {
    $pCOMMAND.parse($command, :$rule, :$actions).made;
}