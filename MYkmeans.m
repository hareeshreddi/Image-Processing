function [centroids, idx] = MYkmeans(X, initial_centroids, max_iters)
[m n] = size(X);
K = size(initial_centroids, 1);
idx = zeros(m,1);
centroids = initial_centroids;
for i = 1:max_iters,
    idx = assign_indices(X,centroids);
    centroids = newCentroids(X, idx, K);
end
end