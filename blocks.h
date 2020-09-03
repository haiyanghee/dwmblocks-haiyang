// Modify this file to change what commands output to your statusbar, and
// recompile using the make command.
// clang-format off
static const Block blocks[] = {
	/*Icon*/ /*Command*/ /*Update Interval*/ /*Update Signal*/
	{"", "dwm_resources.sh", 15, 0},
	{"", "dwm_network.sh", 10, 1},
	{"", "dwm_battery.sh", 10, 2},
	//{"", "dwm_alsa.sh | tr '\n' ' '", 0, 3},
	{"", "dwm_alsa.sh", 0, 3},
    // update weather and news in every 15 min
	{"", "dwm_news.sh", 54000, 4},
	{"", "dwm_weather.sh | tr '\n' ' ' | sed 's/^[ \t]*//;s/[ \t]*$//'", 54000, 5},
	{"", "date \"+%Y-%m-%d %a %I:%M %p\"", 20, 5}};

// sets delimeter between status commands. NULL character ('\0') means no
// delimeter.
static char delim[] = "|";
static unsigned int delimLen = 5;
