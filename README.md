# RailSurfaceDetection
Defect Classification Based on Deep Features for Railway Tracks in Sustainable Transportation
# Introduction
This method concerned the detection and classification of rail surface defects. The proposed method consists of image processing, feature extraction from multiple deep learning models, feature combining, and classification with SVMs. The proposed image processing-based approach obtains a high contrast image from the original image, and the region of the rail surface is cropped. The proposed contrast enhancement approach eliminates the problems that occur on the rail surface due to illumination and increases the performance of the ROI extraction method. After the rail track was obtained, feature extraction, feature combination from multiple deep learning networks, feature selection, and classification with SVMs were applied in order to classify the surface defects. The SqueezeNet and MobileNetV2 models were used for feature extraction, and the ReliefF algorithm was used for feature selection. The proposed approach achieved a classification success of 97.10%, which is better than the reported methods available in the literature. To the best knowledge of the authors, this method was the first method to use deep learning models to detect rail surface defects.
# Dependencies
- Matlab 2018b or Higher
- MobileNetv2
- SqueezeNet

![image](/TestRailextraction/101517_33834630_1208_35895.jpg)
