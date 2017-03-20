Server.default = s = Server.internal.boot

SynthDef("sine", {Out.ar(0, SinOsc.ar)}).play

(
SynthDef("one_tone_only", {
	var out, freq = 440;
	out = SinOsc.ar(freq);
	Out.ar(0, out)
}).add
)

Synth("one_tone_only")

SynthDef("different_tones", {
	arg freq = 440;
	var out;
	out = SinOsc.ar(freq)*0.3;
	Out.ar(0, out)
}).play

Synth("different_tones", ["freq", 550]);
Synth("different_tones", [\freq, 660]);
Synth("different_tones", ["freq", 880]);

a = Synth("different_tones", ["freq", 64.midicps]);
b = Synth("different_tones", ["freq", 67.midicps]);
c = Synth("different_tones", ["freq", 72.midicps]);
a.set("freq", 65.midicps);
c.set("freq", 71.midicps);
a.set("freq", 64.midicps);c.set("freq", 72.midicps);
a.free;
b.free;
c.free;

(
{
	r = Impulse.kr(10);
	c = TRand.kr(100, 5000, r);
	m = TRand.kr(100, 5000, r);
	PMOsc.ar(c, m, 12) * 0.3;
}.play
)


(
{
	var rate = 4, carrier, modRatio;
	carrier = LFNoise0.kr(rate) * 500 + 700;
	modRatio = MouseX.kr(1, 2.0);
	PMOsc.ar(carrier, carrier*modRatio, 12)*0.3
}.play
)




(


play({
	var lf = LFNoise0.kr(
		2,
		mul: 600,
		add: 1000
	);
	SinOsc.ar(
		lf,
		0.3
	)
})
)

(
play({
	var sines = 5;
	var speed = 6;
	Mix.fill(sines,
		{
			arg x;
			Pan2.ar(
				SinOsc.ar(
					x+1*100,
					mul: max(
						0,
						LFNoise1.kr(speed) +
						Line.kr(1, -1, 30)
					)
				), rand(1.0)
			)
		}
	)/sines
})
)

exprand(1, 1000.0)
{exprand(1, 1000.0)}

dup(rand(1000.0), 5)

[45, 13, 10, 498, 78].sort;
{1000.0.rand.round(0.1).postln}.dup(100).postln.sort.plot
12 - [0, 11, 10, 1, 9, 8, 6, 4, 3].reverse

{Blip.ar(25, LFNoise0.kr([5, 10], 12, 14), 0.3)}.play

{PMOsc.ar(440, 550, 7)}.play
{SinOsc.ar(mul: MouseX.kr(0, 1.0))}.scope

(
{
	Blip.ar(
		TRand.kr(
			100, 1000,
			Impulse.kr(Line.kr(1, 20, 60))
		),
		TRand.kr(
			1, 10,
			Impulse.kr(Line.kr(1, 20, 60))
		),
		Linen.kr(
			Impulse.kr(Line.kr(1, 20, 60)),
			0,
			0.5,
			1/Line.kr(1, 20, 60)
		)
	)
}.play
)

(
{
	r = MouseX.kr(1/3, 40);
	SinOsc.ar(mul: Linen.kr(Impulse.kr(r), 0, 1, 1/r))
}.play
)
