const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#24222b", /* black   */
  [1] = "#F5919A", /* red     */
  [2] = "#D197AA", /* green   */
  [3] = "#DF9AA8", /* yellow  */
  [4] = "#F9B2B0", /* blue    */
  [5] = "#FDC7BA", /* magenta */
  [6] = "#D3B5C5", /* cyan    */
  [7] = "#f3dfdd", /* white   */

  /* 8 bright colors */
  [8]  = "#aa9c9a",  /* black   */
  [9]  = "#F5919A",  /* red     */
  [10] = "#D197AA", /* green   */
  [11] = "#DF9AA8", /* yellow  */
  [12] = "#F9B2B0", /* blue    */
  [13] = "#FDC7BA", /* magenta */
  [14] = "#D3B5C5", /* cyan    */
  [15] = "#f3dfdd", /* white   */

  /* special colors */
  [256] = "#24222b", /* background */
  [257] = "#f3dfdd", /* foreground */
  [258] = "#f3dfdd",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
