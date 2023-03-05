static const char norm_fg[] = "#9ec3e1";
static const char norm_bg[] = "#070E0D";
static const char norm_border[] = "#6e889d";

static const char sel_fg[] = "#9ec3e1";
static const char sel_bg[] = "#466874";
static const char sel_border[] = "#9ec3e1";

static const char urg_fg[] = "#9ec3e1";
static const char urg_bg[] = "#28546A";
static const char urg_border[] = "#28546A";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
