# RailSurfaceDetection
Defect Classification Based on Deep Features for Railway Tracks in Sustainable Transportation
# Introduction
This method concerned the detection and classification of rail surface defects. The proposed method consists of image processing, feature extraction from multiple deep learning models, feature combining, and classification with SVMs. The proposed image processing-based approach obtains a high contrast image from the original image, and the region of the rail surface is cropped. The proposed contrast enhancement approach eliminates the problems that occur on the rail surface due to illumination and increases the performance of the ROI extraction method. After the rail track was obtained, feature extraction, feature combination from multiple deep learning networks, feature selection, and classification with SVMs were applied in order to classify the surface defects. The SqueezeNet and MobileNetV2 models were used for feature extraction, and the ReliefF algorithm was used for feature selection. The proposed approach achieved a classification success of 97.10%, which is better than the reported methods available in the literature. To the best knowledge of the authors, this method was the first method to use deep learning models to detect rail surface defects.
# Dependencies
- Matlab 2018b or Higher
- MobileNetv2
- SqueezeNet
# Usages
- For rail detection following code is required. 
- MATLAB Command Line:\>>rail_detection
- Results <br/>
![image](/TestRailextraction/Result1.PNG)
- For image enhancement please write following code.
-\>>[R,E,J]=Enhance_Image(I);<br/>
\>> imshow(1-R)<br/>
\>> figure, imshow(E)<br/>
\>> figure, imshow(1-J)<br/>
<p float="left">
  <img src="/TestEnhancement/Enhance_1.PNG" width="200" />
  <img src="/TestEnhancement/Enhanced_Image.PNG" width="200" /> 
  <img src="/TestEnhancement/Segmented_Image.PNG" width="200" />
</p><br/>
- The following main program should be run for feature extraction, feature selection and feature merging with deep learning models.<br/>
\>>main_program <br/>
# Results
