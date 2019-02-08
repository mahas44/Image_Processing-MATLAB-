image = imread('C:\lena512.jpg');
%c = double(image);
germe = imadjust(image);
imageSP = imnoise(germe,'salt & pepper',0.05);
[r,c] = size(imageSP); %satýr ve sütun sayýsý
medyan = zeros(r,c);

for i=2:r-1
    for j=2:c-1
        filtre = [imageSP(i-1,j-1),imageSP(i-1,j),imageSP(i-1,j+1),imageSP(i,j-1),imageSP(i,j),imageSP(i,j+1),imageSP(i+1,j-1),imageSP(i+1,j),imageSP(i+1,j+1)];
        medyan(i,j) = median(filtre);
    end
end

imshow(image);title('Original Resim');
figure
imshow(imageSP,[]);title('Salt&Pepper');
figure
imshow(medyan,[]);title('Median Filtre');
figure
imshow(germe);title('Histogram Germe');
figure
imhist(germe);title('Histogram');