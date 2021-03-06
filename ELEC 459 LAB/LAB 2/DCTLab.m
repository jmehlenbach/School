load camera256.mat;
%should be a 256x256 matrix of zeroes
%used to store the compressed version of the image
zeroMatrix = zeros(256); 

%Generate a variable that stores the quantization matrix Q50
q50matrix = [16 11 10 16 24 40 51 61
12 12 14 19 26 58 60 55
14 13 16 24 40 57 69 56
14 17 22 29 51 87 80 62
18 22 37 56 68 109 103 77
24 35 55 64 81 104 113 92
49 64 78 87 103 121 120 101
72 92 95 98 112 100 103 99];

%4. Generate a variable that stores the quality level of the compressed version of the image
%(should be 10, 40 or 90).
prompt = 'Value of scaling factor is: (10, 40, 90) ';
x = input(prompt);
qualityLevel = x;

%computer the scaling factor
%(for quality factor greater than 50)=> t = (100-qualityLevel)/50;
%(for quality factor <50) => t = 50/quality level 
scalingFactor_t=0.0;
if (qualityLevel >50)
    scalingFactor_t = (100-qualityLevel)/50;
else
    scalingFactor_t = 50/qualityLevel;
end

%%Split each of the test images in 8 8 ? block matrices,
%On each block B, do the following:
%Split into 8x8 matrices (32 for 256 image)
splitMatrix = mat2cell(camera256, [8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8], [8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8])

%Level off: subtract 128 from all entries of B; call the resulting variable Bt. 
Bt = splitMatrix;
for n = 1:32
    for k = 1:32
        Bt{n,k}= Bt{n,k}-128;
    end
end

%Apply 2-D DCT to Bt to obtain matrix C
%From lab manual,dct2 used to obtain C from B
C = dct2(Bt);

%Pointwise divide C by the scaled quantization matrix t *Q50 , to obtain matrix S. 
%Round the values of S to integers
scaledQMatrix = scalingFactor_t*q50matrixmatrix;
S = C;
for n = 1:32
    for k = 1:32
        S{n,k}= round (S{n,k}./scaledQMatrix); %might need to do differently for this? Pointwise?
    end
end

%Pointwise multiply S by the same scaled quantization matrix t Q50 to obtain matrix Ct
Ct = S;
for n = 1:32
    for k = 1:32
        Ct{n,k}= round (Ct{n,k}.*scaledQMatrix); %might need to do differently for this? Pointwise?
    end
end

%Apply inverse 2-D DCT to Ct to obtain Bt. 
Bt_fromCt = idct2(Ct);

%Reverse the level-off operation: add 128 to all entries of Bt. 
for n = 1:32
    for k = 1:32
        Bt_fromCt{n,k}= Bt_fromCt{n,k}+128;
    end
end