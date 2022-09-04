const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#071416", /* black   */
  [1] = "#526675", /* red     */
  [2] = "#A96F47", /* green   */
  [3] = "#2F668E", /* yellow  */
  [4] = "#617787", /* blue    */
  [5] = "#738C9C", /* magenta */
  [6] = "#70A6C4", /* cyan    */
  [7] = "#bcc4ca", /* white   */

  /* 8 bright colors */
  [8]  = "#83898d",  /* black   */
  [9]  = "#526675",  /* red     */
  [10] = "#A96F47", /* green   */
  [11] = "#2F668E", /* yellow  */
  [12] = "#617787", /* blue    */
  [13] = "#738C9C", /* magenta */
  [14] = "#70A6C4", /* cyan    */
  [15] = "#bcc4ca", /* white   */

  /* special colors */
  [256] = "#071416", /* background */
  [257] = "#bcc4ca", /* foreground */
  [258] = "#bcc4ca",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
