function [filteredImage ]= myBilateralFiltering(corruptedImage,sd_sp,sd_int,windowSize)


[x,y] = meshgrid(-windowSize:windowSize,-windowSize:windowSize);
spaceGaussian = exp(-(x.^2+y.^2)/(2*(sd_sp^2)));


[ m, n,d ] = size(corruptedImage);


for i = 1:m
    for j = 1:n
        leftb = max(i-windowSize,1);
        rightb = min(i+windowSize,m);
        topb = max(j-windowSize,1);
        botb = min(j+windowSize,n);
        
        for k = 1:d      
            submatrix = corruptedImage(leftb:rightb,topb:botb,k);
            intensityGaussian = exp(-(corruptedImage(i,j,k)-submatrix).^2/(2*sd_int^2));
            weightMatrix = intensityGaussian.*spaceGaussian((leftb:rightb)-i+windowSize+1,(topb:botb)-j+windowSize+1);
            filteredImage(i,j,k) = sum(sum(weightMatrix.*submatrix))/sum(sum(weightMatrix));
        end
    end
end

end