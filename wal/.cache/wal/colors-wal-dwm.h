static const char norm_fg[] = "#c2cfdc";
static const char norm_bg[] = "#10161c";
static const char norm_border[] = "#87909a";

static const char sel_fg[] = "#c2cfdc";
static const char sel_bg[] = "#48637C";
static const char sel_border[] = "#c2cfdc";

static const char urg_fg[] = "#c2cfdc";
static const char urg_bg[] = "#435B72";
static const char urg_border[] = "#435B72";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
