s.boot

Env(
  [0, 1, 0],
  [1.0, 0.5]
  ).plot

Env.perc(
  0.05, 0.5, 1.0, 0
  ).plot

{
  EnvGen.ar(
    Env(
      [1, 0],
      [1.0]
      )
    )
}.scope

{
  SinOsc.ar(
    440,
    0,
    0.1
    ) *
    EnvGen.kr(
      Env(
        [1, 0],
        [1.0]
        )
      )
}.scope

{
  var env = Env([10000, 20], [1.0]);
  Saw.ar(
    EnvGen.ar(
      env
      ),
      0.1
    )
}.scope

({
  SinOsc.ar(
    SinOsc.ar(10, 0, 10, 440),
    0.0,
    EnvGen.kr(Env([0.5, 0.0], [1.0]),
    doneAction: 2)
  )
}.scope)
