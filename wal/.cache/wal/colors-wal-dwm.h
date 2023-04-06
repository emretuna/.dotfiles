static const char norm_fg[] = "#bab4b7";
static const char norm_bg[] = "#1b1a1c";
static const char norm_border[] = "#827d80";

static const char sel_fg[] = "#bab4b7";
static const char sel_bg[] = "#6D6977";
static const char sel_border[] = "#bab4b7";

static const char urg_fg[] = "#bab4b7";
static const char urg_bg[] = "#505369";
static const char urg_border[] = "#505369";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
