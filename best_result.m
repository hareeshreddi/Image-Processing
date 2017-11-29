function [centroids,idx,J] = best_result(X,K);
centroids_cell = cell(50,3);
%% 
%% 
for i = 1:30,
    initial_centroids = Kmeans_intialization(X,K);
    [centroids idx] = MYkmeans(X,initial_centroids,15);
    J = costFunction(X,centroids,idx);
    centroids_cell{i,1} = centroids;
    centroids_cell{i,2} = J;
    centroids_cell{i,3} = idx;
end
for i = 1:50,
    if (centroids_cell{i,2} == min([centroids_cell{:,2}])),
        centroids = centroids_cell{i,1};
        J = centroids_cell{i,2};
        idx = centroids_cell(i,3);
        break
    end
end
idx = idx{1,1};
end
