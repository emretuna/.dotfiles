const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#09040a", /* black   */
  [1] = "#D77952", /* red     */
  [2] = "#BA8575", /* green   */
  [3] = "#D79E76", /* yellow  */
  [4] = "#BE8E81", /* blue    */
  [5] = "#D5AD91", /* magenta */
  [6] = "#DAB095", /* cyan    */
  [7] = "#ead7c8", /* white   */

  /* 8 bright colors */
  [8]  = "#a3968c",  /* black   */
  [9]  = "#D77952",  /* red     */
  [10] = "#BA8575", /* green   */
  [11] = "#D79E76", /* yellow  */
  [12] = "#BE8E81", /* blue    */
  [13] = "#D5AD91", /* magenta */
  [14] = "#DAB095", /* cyan    */
  [15] = "#ead7c8", /* white   */

  /* special colors */
  [256] = "#09040a", /* background */
  [257] = "#ead7c8", /* foreground */
  [258] = "#ead7c8",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
