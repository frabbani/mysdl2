# mysdl2
Simple C++ SDL2 interface (requires SDL2.dll).

Code example:
```
void init() {
  /** initialization logic goes here **/
}

void step() {
  /** step logic goes here **/
}

void draw() {
  /** draw logic goes here **/
}

void term() {
  /** termination logic goes here **/
}

int main(int argc, char *args[]) {
  setbuf( stdout, NULL);

  if (!sdl.init( DISP_W, DISP_H, false, "Run Boy Run!")) {
    printf("SDL failed...?\n");
    return 0;
  }

  double drawTimeInSecs = 0.0;
  Uint32 drawCount = 0.0;
  double invFreq = 1.0 / sdl.getPerfFreq();

  auto start = sdl.getTicks();
  auto last = start;
  init();

  while (true) {
    auto now = sdl.getTicks();
    auto elapsed = now - last;
    if (sdl.keyDown(SDLK_ESCAPE))
      break;
    if (elapsed >= 20) {
      sdl.pump();
      step();
      last = (now / 20) * 20;
    }
    Uint64 beginCount = sdl.getPerfCounter();
    draw();
    drawCount++;
    sdl.swap();
    drawTimeInSecs += (double) (sdl.getPerfCounter() - beginCount) * invFreq;
  }
  term();
  if (drawCount)
    printf("Average draw time: %f ms\n",
           (float) ((drawTimeInSecs * 1e3) / (double) drawCount));

  sdl.term();

  printf("goodbye!\n");
  return 0;
}
```
