static const char norm_fg[] = "#a1a9c5";
static const char norm_bg[] = "#0a070c";
static const char norm_border[] = "#707689";

static const char sel_fg[] = "#a1a9c5";
static const char sel_bg[] = "#47394F";
static const char sel_border[] = "#a1a9c5";

static const char urg_fg[] = "#a1a9c5";
static const char urg_bg[] = "#293568";
static const char urg_border[] = "#293568";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
