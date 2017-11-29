function J = costFunction(X,centroids,idx)
J = 0;
for i = 1:size(X,1),
    J = J + (norm(X(i,:)-centroids(idx(i),:))^2)/size(X,1);
end
end