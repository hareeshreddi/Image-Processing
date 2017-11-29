function centroid = Kmeans_intialization(X,K)
centroids = zeros(K, size(X, 2));
p = randperm(size(X,1));
p = p(1:K);
for i=1:K,
    centroid(i,:) = X(p(i),:);
end
end