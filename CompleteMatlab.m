close all;
I=imread('C:\Users\Shashwat\Desktop\Lung3.jpeg');
Io=rgb2gray(I);
figure,imshow(Io),title('Original');
baseFileName = 'Original.jpeg'; % Whatever....
fullFileName=fullfile('C:\Users\Shashwat\Desktop', baseFileName);
imwrite(Io,fullFileName);
I1=imtophat(Io,strel('disk',10));
figure,imshow(I1),title('First');
I2=imadjust(I1);
figure,imshow(I2),title('Second');
histogram(I2),title('Histogram');
  level=graythresh(I2); %threshold finding using ostut segemtation
  BW=im2bw(I2,level);
  bw1=bwareaopen(BW,800);
  figure,imshow(bw1),title('Black and White C-Cells');
  g = imgradient(bw1)
  figure,imshow(g),title('Gradient Magnitude')  
  C=~bw1;
  figure,imshow(C),title('White and Black');
  D= bwdist(-C);
  D(C)= Inf;
  L = watershed(C)
  Wi=label2rgb(L,'jet','w','shuffle');
  Wi=I
  figure,imshow(I),title('Watershed');
  im=I;
  im(L==0)=0;
  figure,imshow(im);

