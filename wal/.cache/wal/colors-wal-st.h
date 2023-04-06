const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#1b1a1c", /* black   */
  [1] = "#505369", /* red     */
  [2] = "#6D6977", /* green   */
  [3] = "#92513E", /* yellow  */
  [4] = "#9A7263", /* blue    */
  [5] = "#9C8177", /* magenta */
  [6] = "#757282", /* cyan    */
  [7] = "#bab4b7", /* white   */

  /* 8 bright colors */
  [8]  = "#827d80",  /* black   */
  [9]  = "#505369",  /* red     */
  [10] = "#6D6977", /* green   */
  [11] = "#92513E", /* yellow  */
  [12] = "#9A7263", /* blue    */
  [13] = "#9C8177", /* magenta */
  [14] = "#757282", /* cyan    */
  [15] = "#bab4b7", /* white   */

  /* special colors */
  [256] = "#1b1a1c", /* background */
  [257] = "#bab4b7", /* foreground */
  [258] = "#bab4b7",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
