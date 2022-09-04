static const char norm_fg[] = "#e2c9bd";
static const char norm_bg[] = "#06070C";
static const char norm_border[] = "#9e8c84";

static const char sel_fg[] = "#e2c9bd";
static const char sel_bg[] = "#9C655D";
static const char sel_border[] = "#e2c9bd";

static const char urg_fg[] = "#e2c9bd";
static const char urg_bg[] = "#A6563A";
static const char urg_border[] = "#A6563A";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
