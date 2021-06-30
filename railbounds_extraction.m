function DVP=railbounds_extraction(R)
[r,c]=size(R);
H=zeros(1,c);
 for j=1:c
   for i=1:r
        H(j)=H(j)+R(i,j);
   end
 end
 DVP=zeros(1,c-1);
 for i=2:c
     DVP(i)=abs(H(i)-H(i-1));
 end
 imshow(R)
 hold on
 plot(DVP);
 
     