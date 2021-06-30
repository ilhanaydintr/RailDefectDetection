function s=StdMonochrome(k,RGB)
I=k(1)*RGB(:,:,1)+k(2)*RGB(:,:,2)+RGB(:,:,3);
s=-std2(I)/(max(I(:))-min(I(:)));