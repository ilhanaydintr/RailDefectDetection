%This code finds the rail bounds. Firstl, the image is enhanced.
%Afterwards, the left and right bounds of rail are extracted. 
Directory = 'TestRailextraction\'; 
% This code can be used to obtain rail bounds. 
% First, images from a folder are read and image enhancement is 
% applied to the read images.Then, the left and right boundaries 
% of the rail are obtained.Some images have been added to the 
%TestRailextraction folder to test the method.
% Read images from Images folder
Imgs = dir(Directory);
for j=1:length(Imgs)
    thisname = Imgs(j).name;
    thisfile = fullfile(Directory, thisname);
      Img = imread(thisfile);  % try to read image
      Im = Img(:,:,1);
      [R,E,J]=Enhance_Image(Img);
      DVP=railbounds_extraction(1-R);
      [ray,ind]=sort(DVP,'Descend');
      if(ind(1)>ind(2))
          sol=ind(2);
          sag=ind(1);
      else
          sol=ind(1);
          sag=ind(2);
      end
      figure,
      imshow(1-J);
end