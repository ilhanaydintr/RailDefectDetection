
function [R,E,J]=Enhance_Image(I,p)
I=histeq(I);
J=rgb2hcm(double(I)/256);
t=graythresh(J);
if(exist('p'))
    p=-0.05;
end
R=J>t;
E=bwperim(R,4);
%[R,E]=MorphoFood(J,t+p);
function J=rgb2hcm(RGB)
if(size(RGB,3)==1)
    I=RGB;
else
    RGB64=imresize(RGB,[64 64]);
    k=fminsearch('StdMonochrome',[1 1],[ ],RGB64);
    I=k(1)*RGB(:,:,1)+k(2)*RGB(:,:,2)+RGB(:,:,3);
end
J=I-min(I(:));
J=J/max(J(:));
n=fix(size(J,1)/4);
if(mean2(J(1:n,1:n))>0.1)
    J=1-J;
end

function [R,E]=MorphoFood(J,t)
%A=bwareaopen(J>t,fix(length(J(:))/100));
C=imclose(J,strel('disk',8));
R=bwfill(C,'holes',4);
%R=A;
E=bwperim(R,4);