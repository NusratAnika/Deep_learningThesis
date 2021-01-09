load('DeepNeuralNetwork.mat');
% input_Image =  [0 0 0 0 1;
%  
% 1 1 1 1 0;
%  
% 1 0 0 0 1;
%  
% 0 1 1 1 1;
%  
% 0 0 0 0 0;
%  
% ];

% input_Image = [0 0 0 0 1;
%  
% 1 1 1 1 0;
%  
% 1 0 0 0 1;
%  
% 1 1 1 1 0;
%  
% 0 0 0 0 0;
%  
% ];
% input_Image = [0 0 0 0 0;
%  
% 0 1 1 1 1;
%  
% 0 0 0 0 1;
%  
% 1 1 1 1 0;
%  
% 0 0 0 0 1;
%  
% ];

input_Image= [0 0 0 0 0;
 
0 1 1 1 1;
 
0 0 0 0 1;
 
1 1 1 1 0;
 
0 0 0 0 1;
 
];

input_Image = reshape(input_Image, 25, 1);
 
input_of_hidden_layer1 = w1*input_Image;
 
output_of_hidden_layer1 = ReLU(input_of_hidden_layer1);
 
input_of_hidden_layer2 = w2*output_of_hidden_layer1;
 
output_of_hidden_layer2 = ReLU(input_of_hidden_layer2);
 
input_of_hidden_layer3 = w3*output_of_hidden_layer2;
 
output_of_hidden_layer3 = ReLU(input_of_hidden_layer3);
 
input_of_output_node = w4*output_of_hidden_layer3;
 
final_output = Softmax(input_of_output_node)