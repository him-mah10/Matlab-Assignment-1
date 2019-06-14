a=audiorecorder(44100,24,1,-1);
recordblocking(a,3);
data = getaudiodata(a);
file= "my.wav";
audiowrite(file,data,44100);

[a,f]=audioread("my.wav");

sound1=audioplayer(a,f);
sound2=audioplayer(a,24000);
sound3=audioplayer(a,16000);
sound4=audioplayer(a,8000);
sound5=audioplayer(a,4000);

playblocking(sound1);
playblocking(sound2);
playblocking(sound3);
playblocking(sound4);
playblocking(sound5);

[a1,f1]=audioread("1.wav");
[a2,f2]=audioread("2.wav");
[a3,f3]=audioread("3.wav");

a=a(:,1);
a1=a1(:,1);
a2=a2(:,1);
a3=a3(:,1);

c1=conv(a,a1);
c2=conv(a,a2);
c3=conv(a,a3);

sound6=audioplayer(c1,f);
sound7=audioplayer(c1,f);
sound8=audioplayer(c1,f);

playblocking(sound6);
playblocking(sound7);
playblocking(sound8);
