a=imread('rice.png');
b=graythresh(a);
c=double(a);
for i=1: size(c,1)-2
    for j=1: size(c,2)-2
        
        Gx=((2*c(i+2,j+1)+c(i+2,j)+c(i+2,j+2))-(2*c(i,j+1)+c(i,j)+c(i,j+2)));
        
        Gy=((2*c(i+1,j+2)+c(i,j+2)+c(i+2,j+2))-(2*c(i+1,j)+c(i,j)+c(i+2,j)));
        
        a(i,j)=abs(Gx)+abs(Gy);
        a(i,j)=sqrt(Gx.^2+Gy.^2);
    end
end
s=edge(a,'sobel',b);
figure,imshow(a); title('Sobel Gradient');
%figure,imshow(s); title('Sobel Edge');
