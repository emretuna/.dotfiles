static const char norm_fg[] = "#e2caca";
static const char norm_bg[] = "#101322";
static const char norm_border[] = "#9e8d8d";

static const char sel_fg[] = "#e2caca";
static const char sel_bg[] = "#89647C";
static const char sel_border[] = "#e2caca";

static const char urg_fg[] = "#e2caca";
static const char urg_bg[] = "#716779";
static const char urg_border[] = "#716779";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
