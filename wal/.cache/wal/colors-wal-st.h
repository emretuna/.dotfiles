const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#101322", /* black   */
  [1] = "#716779", /* red     */
  [2] = "#89647C", /* green   */
  [3] = "#7A6A84", /* yellow  */
  [4] = "#8D748B", /* blue    */
  [5] = "#AC7789", /* magenta */
  [6] = "#AA909D", /* cyan    */
  [7] = "#e2caca", /* white   */

  /* 8 bright colors */
  [8]  = "#9e8d8d",  /* black   */
  [9]  = "#716779",  /* red     */
  [10] = "#89647C", /* green   */
  [11] = "#7A6A84", /* yellow  */
  [12] = "#8D748B", /* blue    */
  [13] = "#AC7789", /* magenta */
  [14] = "#AA909D", /* cyan    */
  [15] = "#e2caca", /* white   */

  /* special colors */
  [256] = "#101322", /* background */
  [257] = "#e2caca", /* foreground */
  [258] = "#e2caca",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
