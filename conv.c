#include <stdio.h>

#define IMAGE_SIZE 9
#define KERNEL_SIZE 3

// Function to perform convolution on a 9x9 image with a 3x3 kernel
void convolution(int image[IMAGE_SIZE][IMAGE_SIZE], int kernel[KERNEL_SIZE][KERNEL_SIZE]) {
    int result[IMAGE_SIZE - KERNEL_SIZE + 1][IMAGE_SIZE - KERNEL_SIZE + 1];

    // Perform convolution
    for (int i = 0; i <= IMAGE_SIZE - KERNEL_SIZE; i++) {
        for (int j = 0; j <= IMAGE_SIZE - KERNEL_SIZE; j++) {
            int sum = 0;
            for (int k = 0; k < KERNEL_SIZE; k++) {
                for (int l = 0; l < KERNEL_SIZE; l++) {
                    sum += image[i + k][j + l] * kernel[k][l];
                }
            }
            result[i][j] = sum;
        }
    }

    // Print the result
    printf("Convolution Result:\n");
    for (int i = 0; i <= IMAGE_SIZE - KERNEL_SIZE; i++) {
        for (int j = 0; j <= IMAGE_SIZE - KERNEL_SIZE; j++) {
            printf("%d\t", result[i][j]);
        }
        printf("\n");
    }
}

int main() {
    // Sample 9x9 image
    int image[IMAGE_SIZE][IMAGE_SIZE] = {
        {0, 3, 9, 6, 4, 7, 8, 1, 2},
        {7, 8, 5, 1, 3, 6, 6, 3, 0},
        {8, 5, 6, 9, 1, 0, 5, 2, 4},
        {9, 5, 1, 6, 4, 0, 7, 1, 9},
        {5, 7, 3, 2, 1, 6, 1, 0, 1},
        {7, 5, 8, 4, 0, 3, 5, 2, 1},
        {5, 1, 8, 6, 4, 6, 8, 5, 9},
        {0, 1, 5, 7, 4, 3, 4, 8, 9},
        {1, 0, 5, 2, 3, 6, 9, 1, 7},
    };

    // Sample 3x3 kernel
    int kernel[KERNEL_SIZE][KERNEL_SIZE] = {
        {-1, -1, -1},
        {-1, 8, -1},
        {-1, -1, -1},
    };

    // Perform convolution
    convolution(image, kernel);

    return 0;
}
