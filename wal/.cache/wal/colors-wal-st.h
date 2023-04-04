const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#10161c", /* black   */
  [1] = "#435B72", /* red     */
  [2] = "#48637C", /* green   */
  [3] = "#3B6486", /* yellow  */
  [4] = "#4E6C88", /* blue    */
  [5] = "#607C96", /* magenta */
  [6] = "#7091B0", /* cyan    */
  [7] = "#c2cfdc", /* white   */

  /* 8 bright colors */
  [8]  = "#87909a",  /* black   */
  [9]  = "#435B72",  /* red     */
  [10] = "#48637C", /* green   */
  [11] = "#3B6486", /* yellow  */
  [12] = "#4E6C88", /* blue    */
  [13] = "#607C96", /* magenta */
  [14] = "#7091B0", /* cyan    */
  [15] = "#c2cfdc", /* white   */

  /* special colors */
  [256] = "#10161c", /* background */
  [257] = "#c2cfdc", /* foreground */
  [258] = "#c2cfdc",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
