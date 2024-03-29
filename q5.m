[y,fs] = audioread("sa_re_ga_ma.mp3");
y1 = smoothdata(y,"movmean");
y2 = smoothdata(y,"movmedian");
y3 = smoothdata(y,"gaussian");
y4 = smoothdata(y,"lowess");
y5 = smoothdata(y,"loess");
y6 = smoothdata(y,"rlowess");
y7 = smoothdata(y,"rloess");
y8 = smoothdata(y,"sgolay");

figure("NAME","Q5");
subplot(4,3,2);
plot(y(10000:10150));
title("ORIGINAL");
subplot(4,3,4);
plot(y1(10000:10150));
title("MOVMEAN");
subplot(4,3,5);
plot(y2(10000:10150));
title("MOVMEDIAN");
subplot(4,3,6);
plot(y3(10000:10150));
title("GAUSSIAN");
subplot(4,3,7);
plot(y4(10000:10150));
title("LOWESS");
subplot(4,3,8);
plot(y5(10000:10150));
title("LOESS");
subplot(4,3,9);
plot(y6(10000:10150));
title("RLOWESS");
subplot(4,3,10);
plot(y7(10000:10150));
title("RLOESS");
subplot(4,3,11);
plot(y8(10000:10150));
title("SGOLAY");
