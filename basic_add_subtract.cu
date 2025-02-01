#include <iostream>
#include <cuda_runtime.h>

__constant__ char d_message[20];

__global__ void add_subtract(int* a, int* b, int* c){
    *c = *a+*b+(*a-*b);
    printf("%d",*c);
}

int main() {
    int a, b, c;
    int *d_a, *d_b, *d_c;
    a = 9;
    b = 3;
    int size = sizeof(int);
    cudaMalloc((void**)&d_a, size);
    cudaMalloc((void**)&d_b, size);
    cudaMalloc((void**)&d_c, size);

    cudaMemcpy(d_a, &a, size, cudaMemcpyHostToDevice);
    cudaMemcpy(d_b, &b, size, cudaMemcpyHostToDevice);

    calculator<<<1,1>>>(d_a, d_b, d_c);
    cudaMemcpy(d_c, &c, size, cudaMemcpyDeviceToHost);
    cudaDeviceSynchronize();
    printf("Hello world from the CPU\n");
}
