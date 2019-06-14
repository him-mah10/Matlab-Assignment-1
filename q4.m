input = imread("1.jpeg");
outputn=nearest(input,3);
outputb=bilinear(input,3);
figure("Name","INPUT");
imshow(input,[]);
figure("Name","Nearest Neighbour");
imshow(outputn,[]);
figure("Name","BILINEAR");
imshow(outputb,[]);


function [outputn] = nearest(input,x)
scale = [x x];
oldSize = size(input);
newSize = max(floor(scale.*oldSize(1:2)),1);
rowIndex = min(round(((1:newSize(1))-0.5)./scale(1)+0.5),oldSize(1));
colIndex = min(round(((1:newSize(2))-0.5)./scale(2)+0.5),oldSize(2));
outputn= input(rowIndex,colIndex,:);
end

function [outputb] = bilinear(input,x)
    in_rows = size(input,1);
    in_cols = size(input,2);
    out_rows = in_rows*x;
    out_cols = in_cols*x;
    [cf, rf] = meshgrid(1 : out_cols, 1 : out_rows);
    rf = rf / x;
    cf = cf / x;
    r = floor(rf);
    c = floor(cf);
    r(r < 1) = 1;
    c(c < 1) = 1;
    r(r > in_rows - 1) = in_rows - 1;
    c(c > in_cols - 1) = in_cols - 1;
    delta_R = rf - r;
    delta_C = cf - c;
    in1_ind = sub2ind([in_rows, in_cols], r, c);
    in2_ind = sub2ind([in_rows, in_cols], r+1,c);
    in3_ind = sub2ind([in_rows, in_cols], r, c+1);
    in4_ind = sub2ind([in_rows, in_cols], r+1, c+1);       
    outputb = zeros(out_rows, out_cols, size(input, 3));
    outputb = cast(outputb, class(input));

    for idx = 1 : size(input, 3)
        chan = double(input(:,:,idx));
        tmp = chan(in1_ind).*(1 - delta_R).*(1 - delta_C) + ...
                       chan(in2_ind).*(delta_R).*(1 - delta_C) + ...
                       chan(in3_ind).*(1 - delta_R).*(delta_C) + ...
                       chan(in4_ind).*(delta_R).*(delta_C);
        outputb(:,:,idx) = cast(tmp, class(input));
    end
end
