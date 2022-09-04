static const char norm_fg[] = "#cacddd";
static const char norm_bg[] = "#0a0c16";
static const char norm_border[] = "#8d8f9a";

static const char sel_fg[] = "#cacddd";
static const char sel_bg[] = "#676E93";
static const char sel_border[] = "#cacddd";

static const char urg_fg[] = "#cacddd";
static const char urg_bg[] = "#3B508B";
static const char urg_border[] = "#3B508B";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
