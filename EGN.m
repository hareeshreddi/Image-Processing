function [Ev,Lamda,sig] = EGN(X,mean)
for i = 1:size(X,1),
    X(i,:) = X(i,:) - mean;
end
sig = 1/size(X,1)*X'*X;%sig is covariance matrix  
[Ev Lamda] = svd(sig);%matrix 'Ev' contains eigen vectors and 
                        % matrix 'Lamda' contains eigen values along
                        % diagnol 
end