const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#06070C", /* black   */
  [1] = "#A6563A", /* red     */
  [2] = "#9C655D", /* green   */
  [3] = "#B4896F", /* yellow  */
  [4] = "#EC9850", /* blue    */
  [5] = "#CF9572", /* magenta */
  [6] = "#947982", /* cyan    */
  [7] = "#e2c9bd", /* white   */

  /* 8 bright colors */
  [8]  = "#9e8c84",  /* black   */
  [9]  = "#A6563A",  /* red     */
  [10] = "#9C655D", /* green   */
  [11] = "#B4896F", /* yellow  */
  [12] = "#EC9850", /* blue    */
  [13] = "#CF9572", /* magenta */
  [14] = "#947982", /* cyan    */
  [15] = "#e2c9bd", /* white   */

  /* special colors */
  [256] = "#06070C", /* background */
  [257] = "#e2c9bd", /* foreground */
  [258] = "#e2c9bd",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
