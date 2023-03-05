const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#0F0913", /* black   */
  [1] = "#5D1C51", /* red     */
  [2] = "#574E52", /* green   */
  [3] = "#7F747F", /* yellow  */
  [4] = "#991823", /* blue    */
  [5] = "#922F57", /* magenta */
  [6] = "#CB4049", /* cyan    */
  [7] = "#dd9cd5", /* white   */

  /* 8 bright colors */
  [8]  = "#9a6d95",  /* black   */
  [9]  = "#5D1C51",  /* red     */
  [10] = "#574E52", /* green   */
  [11] = "#7F747F", /* yellow  */
  [12] = "#991823", /* blue    */
  [13] = "#922F57", /* magenta */
  [14] = "#CB4049", /* cyan    */
  [15] = "#dd9cd5", /* white   */

  /* special colors */
  [256] = "#0F0913", /* background */
  [257] = "#dd9cd5", /* foreground */
  [258] = "#dd9cd5",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
