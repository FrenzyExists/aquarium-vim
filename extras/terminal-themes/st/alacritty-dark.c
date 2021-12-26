
/*
* Terminal colors (16 first used in escape sequence)
* Template taken from spacecamp
*/
static const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#3b3b4d", /* black   */
  [1] = "#EBB9B9", /* red     */
  [2] = "#B1DBA4", /* green   */
  [3] = "#E6DFB8", /* yellow  */
  [4] = "#B8DEEB", /* blue    */
  [5] = "#F6BBE7", /* magenta */
  [6] = "#CDDBF9", /* cyan    */
  [7] = "#C6D0E9", /* white   */

  /* 8 bright colors */
  [8]  = "#3b3b4d", /* black   */
  [9]  = "#cc9b9d", /* red     */
  [10] = "#a3ccad", /* green   */
  [11] = "#d1ba97", /* yellow  */
  [12] = "#B8C9EA", /* blue    */
  [13] = "#c497b3", /* magenta */
  [14] = "#95C2D1", /* cyan    */
  [15] = "#63718b", /* white   */

  /* special colors */
  [256] = "#20202A", /* background */
  [257] = "#63718B", /* foreground */
};

/*
 * Default colors (colorname index)
 * foreground, background, cursor
 */
static unsigned int defaultfg = 257;
static unsigned int defaultbg = 256;
static unsigned int defaultcs = 257;

/*
 * Colors used, when the specific fg == defaultfg. So in reverse mode this
 * will reverse too. Another logic would only make the simple feature too
 * complex.
 */
static unsigned int defaultitalic = 7;
static unsigned int defaultunderline = 7;

