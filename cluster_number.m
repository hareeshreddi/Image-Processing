function U = cluster_number(idx,K)
U = zeros(K,1);
for i = 1:K,
    for j = 1:size(idx,1),
        if idx(j) == i,
            U(i) = U(i)+1;
        end
    end
end
end