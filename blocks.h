// Modify this file to change what commands output to your statusbar, and
// recompile using the make command.
// clang-format off
static const Block blocks[] = {
	/*Icon*/ /*Command*/ /*Update Interval*/ /*Update Signal*/
    // resoures will display memory and cpu
	{"", "dwm_resources.sh", 15, 0},
    // since storage rarely updates, will update every one hour..
	{"", "dwm_storage.sh", 3600, 0},
    // display ethernet and wifi status
	{"", "dwm_network.sh", 20, 1},
    // display battery
	{"", "dwm_battery.sh", 10, 2},
    // display volume
    // will update volume every min
	{"", "dwm_alsa.sh", 60, 3},
    // update newsboat
	{"", "dwm_news.sh", 900, 4},
    // update weather and news in every 15 min
	{"", "dwm_weather.sh | tr '\n' ' ' | sed 's/^[ \t]*//;s/[ \t]*$//'", 900, 5},
    // display date
	{"", "date \"+%Y-%m-%d %a %I:%M %p\"", 20, 5}};

// sets delimeter between status commands. NULL character ('\0') means no
// delimeter.
static char delim[] = "|";
static unsigned int delimLen = 5;
