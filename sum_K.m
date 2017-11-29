function value = sum_K(S,l,n)
value = 0;
for i = l:n,
    value = value + S(i,i);
end
end