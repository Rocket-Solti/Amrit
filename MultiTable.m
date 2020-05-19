function [table]= MultiTable(n)
table = zeros(n);
for column =1:1:n
    for row =1:1:n
        Mat=row * column;
        table( column ,row)=Mat;
    end
end
end