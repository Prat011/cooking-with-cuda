#include <iostream>
#include <cuda_runtime.h>

__constant__ char d_message[20];

__global__ void hello_world(){
    printf("Hello world, from the GPU\n");
}

int main() {
    int threadsperBlock = 256;
    hello_world<<<1,1>>>();
    cudaDeviceSynchronize(); //This ensures the code works synchronously
    //without the synchronize function, the CPU print statement executes before the GPU print statement
    printf("Hello world from the CPU\n");
}
