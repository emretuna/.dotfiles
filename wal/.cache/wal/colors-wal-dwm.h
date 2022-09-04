static const char norm_fg[] = "#bcc4ca";
static const char norm_bg[] = "#071416";
static const char norm_border[] = "#83898d";

static const char sel_fg[] = "#bcc4ca";
static const char sel_bg[] = "#A96F47";
static const char sel_border[] = "#bcc4ca";

static const char urg_fg[] = "#bcc4ca";
static const char urg_bg[] = "#526675";
static const char urg_border[] = "#526675";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
