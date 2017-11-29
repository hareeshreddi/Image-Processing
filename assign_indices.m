function idx = assign_indices(X, centroids)
K = size(centroids, 1);
idx = zeros(size(X,1), 1);
s = size(X,1);
for i = 1:s,
    for j = 1:K,
        a(j) = norm(X(i,:)-centroids(j,:));
    end
    for j = 1:K,
        if a(j) == min(a),
            idx(i)=j;
        end
    end
    clear a;
end
