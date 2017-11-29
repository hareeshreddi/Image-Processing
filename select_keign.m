 function K = select_keign(S,v)

for i = 1:size(S,1),
    p = sum_K(S,1,i)/sum_K(S,1,size(S,1));
    if p>v,
        break
    end
end
K = i;
end