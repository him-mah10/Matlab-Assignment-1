[original,f]=audioread("my.wav");
fast=downsample(original,2);
slow=upsample(original,2);

subplot(3,1,1)
plot(original);
title("ORIGINAL");

subplot(3,1,2);
plot(fast);
title("FAST");

subplot(3,1,3);
plot(slow);
title("SLOW");

