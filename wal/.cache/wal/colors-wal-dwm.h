static const char norm_fg[] = "#e8be9e";
static const char norm_bg[] = "#0F0F10";
static const char norm_border[] = "#a2856e";

static const char sel_fg[] = "#e8be9e";
static const char sel_bg[] = "#4E3D42";
static const char sel_border[] = "#e8be9e";

static const char urg_fg[] = "#e8be9e";
static const char urg_bg[] = "#714437";
static const char urg_border[] = "#714437";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
