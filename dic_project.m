%This is the file used to run the whole project : "overcomplete dictionary learning"

%---------------------------Reading Input----------------------------------
%in my case I read 
%input from '60 folders' and stored in a file 'project_input.mat(X)' 

%AVOID THIS: you may read images from '80 folders' by using 'input_read80.m' 
%            and it stores all data in X
%(it will take some more time as it should read input from 80 different folders)


load('project_input.mat');  %This loads all images data into matrix-'X',
                            %Such that each row is an image signal 
K = 3; %'K'-MEANS ,here i choosed '3' (is best predicted by 'Elbow method')
       % you can change this to whatever you want correspondingly you will 
       % get some other dictionary 

%---------------------------Applying K-means-----------------------------
%Here 'best_result.m' does is that initialing_centroids 30 times randomly, 
%  Finding centroids and indexes using 'MYkmeans' for each and every
%  initialization and
%  choosing the one which gives the minimum distortion value(costFunction)

fprintf('now running K-means,it may take some more time \n');
fprintf('press enter to continue\n');
%pause;
%[centroids,idx,J] = best_result(X,K);%K-MEANS(30 times initializing centroids
load('bestcentroids3.mat');           % and iterating 15 times for each
load('bestidx3.mat');                 % initialization) 'centroids' contains
                                      % K-centroids and idx stores indices
                                      % of each signal(1 to K)

%--------------------------separating clusters-----------------------------
%------------------finding eigen vectors and eigen values------------------


COV_E_cell = cell(K,4);%cell stores Kth-cluster corresponding 
                       %eigen vectors,eigen values and
                       %important eigen vectors in Kth-row 
fprintf('finding eigen vectors and values it may take few minutes\n');
fprintf('enter to continue\n');
%pause;
for i = 1:K,
    COV_E_cell{i,1} = [X(idx==i,:)];%K-clusters separation
                                    %[X(idx==i,:)] is 'i'th cluster
    [COV_E_cell{i,2},COV_E_cell{i,3}] = EGN([X(idx==i,:)],centroids(i,:));
                       % EGN gives matrix of eigen vectors and 
                       % matrix of eigen values (check 'EGN.m' file) 
end

%-----------------------IMPORTANT EIGEN VECTORS----------------------------
%
%here "I choose first 'n' eigen vectors using 'select_keign.m'
% so that 99.3% of varaince was retained" and storing them in 4th column of
% cell corresponding to that cluster row

for i = 1:K,
    COV_E_cell{i,4} = COV_E_cell{i,2}(:,1:select_keign(COV_E_cell{i,3},0.993));
    % this 'select_keign.m' function finds n-eigen vectors
end
open COV_E_cell;% contains 1st column - clusters,2nd column - eigen vectors
                % 3rd column - eigen values and 4th column - first 'n' eign
                % vectors (correspondingly)..
%------------------------AN OVERCOMPLETE DICTIONARY -----------------------

%by appending all those first 'n' eigen vectors from all clusters we will
%get an OVER complete dictionary (based on that 'retaining varaince'
                    %assumed,we may not get an overcomplete so that can be 
                    %a under complete or complete dictionary):choose wisely

%here in my case i assumed 'retaining variance = 99.3%'
D = zeros(size(COV_E_cell{1,2},1),1);%initializing with column matrix of zeros
                                     %for purpose of appending
for i = 1:K,
    D = [D COV_E_cell{i,4}];
end

D = D(:,2:size(D,2));%eliminating that column of zeros(first column)
% and this resulted D is our 'OVER COMPLETE DICTIONARY'.
fprintf('now our DICTIONARY is ready \n');
fprintf('click enter to open it\n');
pause;
open D; %since (in our case) 'D' contains more atoms than the dimension of 
        %an image signal,so that this can be called as an 
        % " OVER COMPLETE DICTIONARY ".......

%------------------------------THE END------------------------------------
