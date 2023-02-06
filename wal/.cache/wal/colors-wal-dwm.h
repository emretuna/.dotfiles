static const char norm_fg[] = "#f3dfdd";
static const char norm_bg[] = "#24222b";
static const char norm_border[] = "#aa9c9a";

static const char sel_fg[] = "#f3dfdd";
static const char sel_bg[] = "#D197AA";
static const char sel_border[] = "#f3dfdd";

static const char urg_fg[] = "#f3dfdd";
static const char urg_bg[] = "#F5919A";
static const char urg_border[] = "#F5919A";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
