static const char norm_fg[] = "#dd9cd5";
static const char norm_bg[] = "#0F0913";
static const char norm_border[] = "#9a6d95";

static const char sel_fg[] = "#dd9cd5";
static const char sel_bg[] = "#574E52";
static const char sel_border[] = "#dd9cd5";

static const char urg_fg[] = "#dd9cd5";
static const char urg_bg[] = "#5D1C51";
static const char urg_border[] = "#5D1C51";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
