package lib::if::dev;

# ABSTRACT: Use lib/ if we're in a dev repo

sub import {

    return unless -d 'lib';
    return unless -f 'dist.ini' || -f 'Makefile.PL' || -f 'Build.PL';

    push @INC, 'lib';
    return;
}

!!42;
__END__

=head1 SYNOPSIS

    # does a 'use lib "lib/"' if exists Makefile.PL, Build.PL, or dist.ini
    use lib::if::dev;

=head1 DESCRIPTION

If you're running a script from your development root (or anything else for
that matter), it's often fun to figure out how to include lib/ in your command
both so that you don't need to remember to do a "-Ilib" or have to rememeber
to remove 'use lib "lib"' statements before releasing.

This package aims to solve that (for one value of "solve").

If your current directory contains a directory "lib" and one or more of
Makefile.PL, Build.PL, or dist.ini, then this package pushes 'lib/' onto
C<@INC>.

=cut
