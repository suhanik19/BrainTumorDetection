# Brain Tumor Detection from MRI Images
Welcome to the Brain Tumor Identification and Segmentation tool. This MATLAB-based project aims to detect and segment brain tumors from MRI images using advanced image processing techniques. By leveraging thresholding, morphological operations, and region-based segmentation, the project facilitates the identification of tumor regions, aiding in medical image analysis.

## Project Objective
The primary goal is to process brain MRI images to:

1. Identify and highlight tumor regions using segmentation methods.
2. Analyze morphological features of tumors, such as size, shape, and boundary characteristics.
3. Provide clear visualizations to facilitate further diagnosis or research.

## Dataset
The MRI images used in this project come from the Kaggle dataset linked here: [Brain Tumor Classification (MRI)](https://www.kaggle.com/datasets/sartajbhuvaji/brain-tumor-classification-mri/data)

## Methods Used
*  **Image Preprocessing**: Resize the images for uniformity and then conduct noise reduction using Gaussian filtering. Also, perform contrast enhancement with Histogram Equalization for better tumor visibility.
*  **Segmentation Techniques**: Binary thresholding with a manually set threshold and connected component labeling are used to identify tumor regions.
*  **Morphological Operations**: Remove small, unwanted regions and refine tumor boundaries with erosion and dilation
*  **Visualization**: Overlay the segmented tumor region onto the original MRI image for visualization.

## Technologies
* MATLAB
* Image Processing Toolbox (for segmentation, filtering, and morphological operations)

## Usage
1. **Run the Script**: Open the MATLAB script provided in the project folder. Load the dataset of MRI brain scan images by modifying the input path in the code.
2. **Visualize Results**: The output will display:
    * Original MRI Image
    * Binary Thresholded Image
    * Segmented Tumor Region
    * Tumor overlay on the original image.

## Future Work
To further improve the accuracy and robustness of tumor segmentation, the following enhancements can be explored:

* **Dynamic Thresholding**:
  * Implementing Otsu’s method or adaptive thresholding to dynamically determine threshold values.
* **Machine Learning Integration**:
  * Training classification models to identify tumor regions more accurately.
* **Feature Extraction**:
  * Extracting shape and texture features for advanced tumor analysis.
 
## Releases
12/17/2024: First working release of the brain tumor segmentation project.

## Acknowledgments
Acknowledgements for Dataset: Navoneel Chakrabarty and Swati Kanchan

I would also like to acknowledge my team members Sai Samatham, Aminah Rangwala, Kassidy Goddard, and Claire Grimes for their contributions to this project.

## Contact
For any issues or further inquiries, please contact Suhani Khandelwal at suhanikhnadelwal05@gmail.com. If you encounter any bugs or have suggestions, feel free to open an issue on the GitHub repository.

