const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#0a0c16", /* black   */
  [1] = "#3B508B", /* red     */
  [2] = "#676E93", /* green   */
  [3] = "#A1648D", /* yellow  */
  [4] = "#7887B2", /* blue    */
  [5] = "#7890C4", /* magenta */
  [6] = "#9A97AC", /* cyan    */
  [7] = "#cacddd", /* white   */

  /* 8 bright colors */
  [8]  = "#8d8f9a",  /* black   */
  [9]  = "#3B508B",  /* red     */
  [10] = "#676E93", /* green   */
  [11] = "#A1648D", /* yellow  */
  [12] = "#7887B2", /* blue    */
  [13] = "#7890C4", /* magenta */
  [14] = "#9A97AC", /* cyan    */
  [15] = "#cacddd", /* white   */

  /* special colors */
  [256] = "#0a0c16", /* background */
  [257] = "#cacddd", /* foreground */
  [258] = "#cacddd",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
