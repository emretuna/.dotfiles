static const char norm_fg[] = "#ddc1cb";
static const char norm_bg[] = "#06090E";
static const char norm_border[] = "#9a878e";

static const char sel_fg[] = "#ddc1cb";
static const char sel_bg[] = "#5D5E96";
static const char sel_border[] = "#ddc1cb";

static const char urg_fg[] = "#ddc1cb";
static const char urg_bg[] = "#185EAD";
static const char urg_border[] = "#185EAD";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
