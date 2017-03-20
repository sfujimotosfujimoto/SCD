Server.local.boot;
//or
s.boot;
s.plotTree;

// Supercollider Tutorial 4
(
x = {
	arg gate=0;
	var sig, env;
	env = EnvGen.kr(Env.new(
		[0, 1, 0.2, 0],
		[0.5, 1, 2],
		[3, -3, 0]),gate);
	sig = Pulse.ar(LFPulse.kr(8).range(600, 900)) * env;
}.play;
)

x.set(\gate, 1);

s.freeAll;

Env.new.plot;

(
{
	var sig, env;
	env = EnvGen.kr(Env.new, doneAction:2);
	sig = Pulse.ar(ExpRand(30, 500)) * env;
}.play;
)

Env.new([0, 1, 0.2, 0], [0.5, 1, 2], [3, -3, 0]).plot;

// Supercollider Tutorial 3
(.
SynthDef.new(\pulseTest, {
	arg ampHz=4, fund=40, maxPartial=4, width=0.5;
	var amp1, amp2, freq1, freq2, sig1, sig2;
	amp1 = LFPulse.kr(ampHz, 0, 0.12) * 0.75;
	amp2 = LFPulse.kr(ampHz, 0.5, 0.12) * 0.75;
	freq1 = LFNoise0.kr(4).exprange(fund, fund*maxPartial).round(fund);
	freq2 = LFNoise0.kr(4).exprange(fund, fund*maxPartial).round(fund);
	freq1 = freq1 * LFPulse.kr(8, add:1);
	freq2 = freq2 * LFPulse.kr(6, add:1);
	sig1 = Pulse.ar(freq1, width, amp1);
	sig2 = Pulse.ar(freq2, width, amp2);

	sig1 = FreeVerb.ar(sig1, 0.7, 0.8, 0.25);
	sig2 = FreeVerb.ar(sig2, 0.7, 0.8, 0.25);

	Out.ar(0, sig1);
	Out.ar(1, sig2);
}).add;
)

x = Synth.new(\pulseTest);

x.set(\width, 0.25);
x.set(\fund, 320);