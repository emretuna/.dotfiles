static const char norm_fg[] = "#e6dad7";
static const char norm_bg[] = "#000916";
static const char norm_border[] = "#a19896";

static const char sel_fg[] = "#e6dad7";
static const char sel_bg[] = "#EBAD76";
static const char sel_border[] = "#e6dad7";

static const char urg_fg[] = "#e6dad7";
static const char urg_bg[] = "#92907B";
static const char urg_border[] = "#92907B";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
