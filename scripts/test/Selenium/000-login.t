# --
# 000-login.t - frontend tests for login
# Copyright (C) 2001-2010 OTRS AG, http://otrs.org/
# --
# $Id: 000-login.t,v 1.2 2010-11-17 11:28:10 mg Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

use strict;
use warnings;

use vars qw($Self);

use Kernel::System::UnitTest::Selenium;
use Time::HiRes qw(sleep);

my $sel = Kernel::System::UnitTest::Selenium->new(
    Verbose        => 1,
    UnitTestObject => $Self,
);

my $ScriptAlias = $Self->{ConfigObject}->Get('ScriptAlias');

$sel->open_ok("${ScriptAlias}index.pl");
$sel->type_ok( "User",     "root\@localhost" );
$sel->type_ok( "Password", "root" );
$sel->click_ok("//button[\@id='LoginButton']") || die "Could not submit login form";
$sel->wait_for_page_to_load_ok("30000");
$sel->click_ok("//a[\@id='LogoutButton']") || die "Could not submit logout form";
$sel->wait_for_page_to_load_ok("30000");

# $sel->_ok();

1;
