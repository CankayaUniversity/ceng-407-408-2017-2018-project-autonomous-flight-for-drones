im=imread('bitirmephoto.png');
imshow(im)
B=zeros(1,1,3);
B(1,1,1)=102;
B(1,1,2)=102;
B(1,1,3)=102;
[r,c,d]=size(im);
m=zeros(r,c);
c=im==B;
c1=c(:, :, 1);
m(c1)=130;

B(1,1,1)=139;
B(1,1,2)=183;
B(1,1,3)=44;
[r,c,d]=size(im);
m=zeros(r,c);
c=im==B;
c1=c(:,:,1);
m(c1)=1;

B(1,1,1)=255;
B(1,1,2)=174;
B(1,1,3)=201;
[r,c,d]=size(im);
m=zeros(r,c);
c=im==B;
c1=c(:,:,1);
m(c1)=30;

B(1,1,1)=77;
B(1,1,2)=77;
B(1,1,3)=77;
[r,c,d]=size(im);
m=zeros(r,c);
c=im==B;
c1=c(:, :, 1);
m(c1)=200;

B(1,1,1)=255;
B(1,1,2)=255;
B(1,1,3)=255;
[r,c,d]=size(im);
m=zeros(r,c);
c=im==B;
c1=c(:, :, 1);
m(c1)=1;

B(1,1,1)=103;
B(1,1,2)=132;
B(1,1,3)=23;
[r,c,d]=size(im);
m=zeros(r,c);
c=im==B;
c1=c(:, :, 1);
m(c1)=10;

B(1,1,1)=230;
B(1,1,2)=230;
B(1,1,3)=230;
[r,c,d]=size(im);
m=zeros(r,c);
c=im==B;
c1=c(:, :, 1);
m(c1)=1;

B(1,1,1)=117;
B(1,1,2)=76;
B(1,1,3)=36;
[r,c,d]=size(im);
m=zeros(r,c);
c=im==B;
c1=c(:, :, 1);
m(c1)=50;

B(1,1,1)=132;
B(1,1,2)=81;
B(1,1,3)=40;
[r,c,d]=size(im);
m=zeros(r,c);
c=im==B;
c1=c(:, :, 1);
m(c1)=30;

B(1,1,1)=89;
B(1,1,2)=109;
B(1,1,3)=15;
[r,c,d]=size(im);
m=zeros(r,c);
c=im==B;
c1=c(:, :, 1);
m(c1)=10;

B(1,1,1)=79;
B(1,1,2)=113;
B(1,1,3)=255;
[r,c,d]=size(im);
m=zeros(r,c);
c=im==B;
c1=c(:, :, 1);
m(c1)=1;

B(1,1,1)=255;
B(1,1,2)=29;
B(1,1,3)=37;
[r,c,d]=size(im);
m=zeros(r,c);
c=im==B;
c1=c(:, :, 1);
m(c1)=100000;



[x,y]=ginput(2)

lineLength=sqrt(((x(1)-x(2))^2+((y(1)-y(2))^2)));
aci=((y(2)-y(1))/(x(2)-x(1)));
s=atand(aci);
s=180-s;
line=strel('line', lineLength,s);
img=getnhood(line);
%imshow(img)

if y(1)<y(2)
    if x(1)<x(2)
        Subim= im(floor(y(1)):ceil(y(2)) , floor(x(1)):ceil(x(2)));
    end
    if x(1)>x(2)
        Subim= im(floor(y(1)):ceil(y(2)) , floor(x(2)):ceil(x(1)));
    end
else 
    if x(1)>x(2)
    Subim= im(floor(y(2)):ceil(y(1)) , floor(x(2)):ceil(x(1)));
    end
    if x(1)<x(2)
        Subim= im(floor(y(2)):ceil(y(1)) , floor(x(1)):ceil(x(2)));
    end
end    
[r1,c1] = size(img);
Subim=Subim(1:r1, 1:c1);
k=Subim.*uint8(img);
figure, imshow(k)

dr=imread('drone.png');
%im(x(1):x(1)+size(dr,1)-1, y(1):y(1)+size(dr,2)-1, :) = dr;
im(1:24,1:24, :) = dr;
figure(3)
imshow(im)    
function [ x,y ] = FindNextPointOnPath( curX, curY, destX, destY )
% Estimates the next point on the way from source to destination.
% m is the map and is modified each time a coordinate is visited
global m;
T = 128;
if curX < destX && m(curX+1, curY ) < T
    x = curX+1;
    y = curY;
elseif curX > destX && m(curX -1, curY ) < T
    x = curX-1;
    y = curY;
elseif curY < destY && m(curX, curY+1 ) < T
    x = curX;
    y = curY+1;
elseif curY > destY && m(curX, curY-1 ) < T
    x = curX;
    y = curY-1;
elseif m(curX-1, curY) < T
    m(curX,curY) = T;
    x = curX-1;
    y = curY;
elseif m(curX+1, curY ) < T
    m(curX,curY) = T;
    x = curX+1;
    y = curY;
elseif m(curX, curY-1 ) < T
    m(curX,curY) = T;
    x = curX;
    y = curY-1;
elseif m(curX, curY+1 ) < T
    m(curX,curY) = T;
    x = curX;
    y = curY+1;
elseif m(curX-1, curY-1 ) < T
    m(curX,curY) = T;
    x = curX-1;
    y = curY-1;
elseif m(curX+1, curY+1 ) < T
    m(curX,curY) = T;
    x = curX+1;
    y = curY+1;
end
