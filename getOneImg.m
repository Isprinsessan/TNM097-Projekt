function [ out_img ] = getOneImg( nr )

load('data/test_batch');

count = 1;
out_img = zeros(32,32,3);
    for j = 1:1:3
        for i = 1:1:32
            for k = 1:1:32
                out_img(i,k,j) = data(nr,count);
                count = count + 1;

            end

        end

    end
out_img = out_img./255;
end

