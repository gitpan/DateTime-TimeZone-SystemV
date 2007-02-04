use ExtUtils::MakeMaker;

WriteMakefile(
	NAME => "DateTime::TimeZone::SystemV",
	VERSION_FROM => "lib/DateTime/TimeZone/SystemV.pm",
	PREREQ_PM => {
		Date::ISO8601 => "0.000",
		Date::JD => "0.001",
	},
);
