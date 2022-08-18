static const char norm_fg[] = "#e7c79e";
static const char norm_bg[] = "#091110";
static const char norm_border[] = "#a18b6e";

static const char sel_fg[] = "#e7c79e";
static const char sel_bg[] = "#4F4C4F";
static const char sel_border[] = "#e7c79e";

static const char urg_fg[] = "#e7c79e";
static const char urg_bg[] = "#335765";
static const char urg_border[] = "#335765";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
