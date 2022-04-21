// This is "First Snow" by #bestULTIMAduo2021

// Let's start! (and let it snow!)

s.record;

// Coolest chimey wall of sound!

// (snowflakes)

b = Buffer.read(s, "C:/Users/user/Desktop/first snow/chime wall.wav");
b.play;


// Our breathey-voicey ambience rocks!

// (wind)

c = Buffer.read(s, "C:/Users/user/Desktop/first snow/breath intro.wav"); // reading our file
c.play;      // playing it


// Let's put some harmonies!

// (snowfall started)

a = NodeProxy.new.play; // play to hardware output.

a.fadeTime = 2; // fadeTime specifies crossfade

a.source = { SinOsc.ar([185,277,311,370], 0, 0.4) };

a.clear(3); // clear after 3 seconds

// Bass time!
// (snowstorm whoo)

(
SynthDef("MyBass", { arg freq = 46, sustain = 1, amp = 0.1, att = 0.1, rel = 2, lofreq = 1000, hifreq = 3000;
    var env, snd;
    snd = Saw.ar(freq: freq * [0.99, 1, 1.001, 1.008]);
	snd = LPF.ar(
		in: snd,
		freq: LFNoise2.kr(1).range(lofreq, hifreq)
	);
    snd = Splay.ar(snd);
    Out.ar(0, snd);
}).add;
)

~playMyBass = Synth(\MyBass); // Starting with F#
~playMyBass.set(\freq, 43);

~playMyBass.free;


// Back to harmonies!
// (and back to snowfall)

w = NodeProxy.new.play;
w.fadeTime = 2;

w.source = { SinOsc.ar([207,246,311,349], 0, 0.4) };
w.clear(3);

// Final chime!
// (last snowflake)

b = Buffer.read(s, "C:/Users/user/Desktop/first snow/final chime.wav");
b.play;


s.stopRecording;

// Cheers!
