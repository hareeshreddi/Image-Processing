files = dir('*.jpg');
for i = 1:size(files,1),
    Y = imread(files(i).name);
    Y = imresize(Y,[50 50]);
    Y = reshape(Y,50*50,1);
    X = [X;Y'];
end