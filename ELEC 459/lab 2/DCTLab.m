clear all;
close all;
clc;


load camera256.mat;
load boat512.mat;
load goldhill512.mat;
load peppers512.mat;

%used to specify one of the test images
inputpic = peppers512;

%Generate a variable that stores the quantization matrix Q50
q50matrix = [16 11 10 16 24  40  51  61;
             12 12 14 19 26  58  60  55;
             14 13 16 24 40  57  69  56;
             14 17 22 29 51  87  80  62;
             18 22 37 56 68  109 103 77;
             24 35 55 64 81  104 113 92;
             49 64 78 87 103 121 120 101;
             72 92 95 98 112 100 103 99];

%4. Generate a variable that stores the quality level of the compressed version of the image
%(should be 10, 40 or 90).
prompt = 'Value of scaling factor is: (10, 40, 90) ';
x = input(prompt);
qualityLevel = x;

%compute the scaling factor
%(for quality factor greater than 50)=> t = (100-qualityLevel)/50;
%(for quality factor <50) => t = 50/quality level 
scalingFactor_t=0.0;
if (qualityLevel >50)
    scalingFactor_t = (100-qualityLevel)/50;
else
    scalingFactor_t = 50/qualityLevel;
end

scaledQMatrix = scalingFactor_t * q50matrix;

%splitMatrix for 512x512 images. Altered for 256x256
splitMatrix = mat2cell(inputpic - 128, [8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8], [8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8]);

Bt_in = splitMatrix;
C_cell = splitMatrix;
S_cell = splitMatrix;
Ct_cell = splitMatrix;
Bt_cell = splitMatrix;


for i = 1:64
    for j = 1:64
        C_cell{i,j} = dct2(Bt_in{i,j}); % DCT2 operation on each 8x8 block
        
        S_cell{i,j} = round(C_cell{i,j} ./ scaledQMatrix);
        
        Ct_cell{i,j} = S_cell{i,j} .* scaledQMatrix;
        
        Bt_cell{i,j} = idct2(Ct_cell{i,j});
    end 
end

Bt_out = cell2mat(Bt_cell) + 128;   % conversion back to matrix

sigma2 = mean(mean(((Bt_out - inputpic).^2)))

PSNR = 10*log10(abs(65025/sigma2))

zoutput = (1 - (nnz(cell2mat(S_cell(1,1)))/64))*100


figure(1);
imshow(inputpic,[]);
figure(2);
imshow(Bt_out,[]);


