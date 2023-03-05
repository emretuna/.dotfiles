const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#070E0D", /* black   */
  [1] = "#28546A", /* red     */
  [2] = "#466874", /* green   */
  [3] = "#2C6998", /* yellow  */
  [4] = "#4A7993", /* blue    */
  [5] = "#0A7CC3", /* magenta */
  [6] = "#598AAA", /* cyan    */
  [7] = "#9ec3e1", /* white   */

  /* 8 bright colors */
  [8]  = "#6e889d",  /* black   */
  [9]  = "#28546A",  /* red     */
  [10] = "#466874", /* green   */
  [11] = "#2C6998", /* yellow  */
  [12] = "#4A7993", /* blue    */
  [13] = "#0A7CC3", /* magenta */
  [14] = "#598AAA", /* cyan    */
  [15] = "#9ec3e1", /* white   */

  /* special colors */
  [256] = "#070E0D", /* background */
  [257] = "#9ec3e1", /* foreground */
  [258] = "#9ec3e1",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
