static const char norm_fg[] = "#ead7c8";
static const char norm_bg[] = "#09040a";
static const char norm_border[] = "#a3968c";

static const char sel_fg[] = "#ead7c8";
static const char sel_bg[] = "#BA8575";
static const char sel_border[] = "#ead7c8";

static const char urg_fg[] = "#ead7c8";
static const char urg_bg[] = "#D77952";
static const char urg_border[] = "#D77952";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
