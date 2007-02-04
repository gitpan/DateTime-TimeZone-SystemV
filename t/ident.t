use Test::More tests => 15;

require_ok "DateTime::TimeZone::SystemV";

$tz = DateTime::TimeZone::SystemV->new("EST5");
ok $tz;
ok !$tz->is_floating;
ok !$tz->is_utc;
ok !$tz->is_olson;
is $tz->category, undef;
is $tz->name, "EST5";
ok !$tz->has_dst_changes;

$tz = DateTime::TimeZone::SystemV->new("EST5EDT");
ok $tz;
ok !$tz->is_floating;
ok !$tz->is_utc;
ok !$tz->is_olson;
is $tz->category, undef;
is $tz->name, "EST5EDT";
ok $tz->has_dst_changes;
