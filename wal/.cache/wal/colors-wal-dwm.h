static const char norm_fg[] = "#c7bbbe";
static const char norm_bg[] = "#1d2731";
static const char norm_border[] = "#8b8285";

static const char sel_fg[] = "#c7bbbe";
static const char sel_bg[] = "#596C86";
static const char sel_border[] = "#c7bbbe";

static const char urg_fg[] = "#c7bbbe";
static const char urg_bg[] = "#C18E78";
static const char urg_border[] = "#C18E78";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
