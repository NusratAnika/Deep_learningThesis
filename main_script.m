input_Image = zeros(5,5,5);
 
input_Image(:,:,1) = [1 0 0 1 1;
 
1 1 0 1 1;
 
1 1 0 1 1;
 
1 1 0 1 1;
 
1 0 0 0 1;
 
];
 
input_Image(:,:,2) = [0 0 0 0 1;
 
1 1 1 1 0;
 
1 0 0 0 1;
 
0 1 1 1 1;
 
0 0 0 0 0;
 
];
 
input_Image(:,:,3) = [0 0 0 0 1;
 
1 1 1 1 0;
 
1 0 0 0 1;
 
1 1 1 1 0;
 
0 0 0 0 0;
 
];
 
input_Image(:,:,4) = [1 1 1 0 1;
 
1 1 0 0 1;
 
1 0 1 0 1;
 
0 0 0 0 0;
 
1 1 1 0 1;
 
];
 
input_Image(:,:,5) = [0 0 0 0 0;
 
0 1 1 1 1;
 
0 0 0 0 1;
 
1 1 1 1 0;
 
0 0 0 0 1;
 
];
 
correct_Output = [1 0 0 0 0;
 
0 1 0 0 0;
 
0 0 1 0 0;
 
0 0 0 1 0;
 
0 0 0 0 1;
 
];
 
w1 = 2*rand(20,25)-1;
 
w2 = 2*rand(20,20)-1;
 
w3 = 2*rand(20,20)-1;
 
w4 = 2*rand(5,20)-1;
 
for epoch = 1:10000
[w1, w2, w3, w4] = DeepLearning(w1, w2, w3, w4, input_Image, correct_Output);
end
save('DeepNeuralNetwork.mat')