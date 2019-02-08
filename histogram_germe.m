imageOriginal = imread('rice.png');
[h,w] = size(imageOriginal);
imageOut = zeros(0,0,'uint8');

yeni_min = 0;
yeni_max = 255;
eski_min = 0;
eski_max = 0;
esik_degeri = graythresh(imageOriginal)*255;   % esik degerini 0-255 aras�nda otomatik se�me %

for i = 1 : h  % Form�l� uygulayabilmek i�in eski min ve eski max de�erlerini bulmam�z gerekiyor %
    for j = 1 : w      
        if (imageOriginal(i,j) <= esik_degeri && imageOriginal(i,j) ~= 0 )
            eski_min = imageOriginal(i,j);
        end
        if (imageOriginal(i,j) > esik_degeri && imageOriginal(i,j) ~= 255 )
            eski_max = imageOriginal(i,j);
        end
    end
end

for i = 1:h       %Form�l%
    for j = 1:w      
       imageOut(i,j) = ((yeni_max - yeni_min)/(eski_max - eski_min)) * (imageOriginal(i,j) - eski_min) + yeni_min;
    end
end

imshow(imageOriginal);title('Orijinal Resim');
figure
imhist(imageOriginal);title('Orijinal Histogram');
figure
imshow(imageOut);title('Germe Sonucu Olu�an Resim');
figure
imhist(imageOut);title('Germe Sonucu Olu�an Histogram');