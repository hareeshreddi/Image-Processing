function centroids = newCentroids(X, idx, K)
[m n] = size(X);
centroids = zeros(K,n);
for i = 1:K,
    centroids(i,:) = sum(X(idx==i,:))/length(X(idx==i,:));
end
end