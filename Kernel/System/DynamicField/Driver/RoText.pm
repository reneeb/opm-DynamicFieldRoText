# --
# Copyright (C) 2022 - 2023 Perl-Services.de, https://perl-services.de
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see https://www.gnu.org/licenses/gpl-3.0.txt.
# --

package Kernel::System::DynamicField::Driver::RoText;

use strict;
use warnings;

use Kernel::System::VariableCheck qw(:all);

use parent qw(Kernel::System::DynamicField::Driver::Text);

=head1 NAME

Kernel::System::DynamicField::Driver::RoText

=head1 DESCRIPTION

DynamicFields Text Driver delegate

=head1 PUBLIC INTERFACE

This module implements the public interface of L<Kernel::System::DynamicField::Backend>.
Please look there for a detailed reference of the functions.

=cut

no warnings 'redefine';

sub EditFieldRender {
    my ( $Self, %Param ) = @_;

    my $Data = $Self->SUPER::EditFieldRender( %Param );

    $Data->{Field} =~ s{<input\K}{ readonly}xms;

    return $Data;
}

1;
