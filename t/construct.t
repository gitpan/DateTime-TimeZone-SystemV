use warnings;
use strict;

use Test::More tests => 23;

require_ok "DateTime::TimeZone::SystemV";

my $tz;

$tz = DateTime::TimeZone::SystemV->new("EST5EDT");
ok $tz;
is $tz->name, "EST5EDT";

$tz = DateTime::TimeZone::SystemV->new(recipe => "EST5EDT");
ok $tz;
is $tz->name, "EST5EDT";

$tz = DateTime::TimeZone::SystemV->new(recipe => "EST5EDT", name => "foobar");
ok $tz;
is $tz->name, "foobar";

$tz = DateTime::TimeZone::SystemV->new(name => "foobar", recipe => "EST5EDT");
ok $tz;
is $tz->name, "foobar";

eval { DateTime::TimeZone::SystemV->new(); };
like $@, qr/\Arecipe not specified\b/;

eval { DateTime::TimeZone::SystemV->new(name => "foobar"); };
like $@, qr/\Arecipe not specified\b/;

eval { DateTime::TimeZone::SystemV->new(quux => "foobar"); };
like $@, qr/\Aunrecognised attribute\b/;

eval { DateTime::TimeZone::SystemV->new(name => "foobar", name => "quux"); };
like $@, qr/\Atimezone name specified redundantly\b/;

eval {
	DateTime::TimeZone::SystemV->new(recipe => "EST5EDT",
		recipe => "EST5EDT");
};
like $@, qr/\Arecipe specified redundantly\b/;

eval { DateTime::TimeZone::SystemV->new(recipe => "EST"); };
like $@, qr/\Anot a valid SysV-style timezone recipe\b/;

foreach(
	undef,
	[],
	*STDOUT,
	bless({}),
) {
	eval { DateTime::TimeZone::SystemV->new(name => $_) };
	like $@, qr/\Atimezone name must be a string\b/;
	eval { DateTime::TimeZone::SystemV->new(recipe => $_) };
	like $@, qr/\Arecipe must be a string\b/;
}

1;
