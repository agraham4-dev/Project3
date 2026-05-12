#include <stdio.h>
#include <stdlib.h>

int main(){
    FILE *bf; //stands for binary file
    bf = fopen("binary.out", "r"); //opens with read
    if(bf==NULL){
        exit(-1); //exit immediately as the memory failed to allocate
    }
    fseek(bf, 0L, SEEK_END); //Goes to the end of the file
    int len = ftell(bf); //Checks the length
    fseek(bf, 0L, SEEK_SET); //returns to start of the file
    char *cs = (char *)calloc(0x10, sizeof(char)); //save the message
    int bp = 0; //bytes passed
    while(bp < len){
        printf("%08x ", bp); //prints the number of bytes passed
        size_t br = fread(cs, sizeof(char), 0x10, bf); //bytes read
        for(int i = 0; i < (int)br; i++){ //iterates through every byte read
            printf("%02x ", (unsigned char)cs[i]); //prints the hex representation of the char
        }
        printf("|"); //prints | to start the ascii representation
        for(int i = 0; i < (int)br; i++){ //iterates through every byte read
            if(cs[i] < 0x20 || cs[i] > 0xFE){ //attempts to print non-ascii
                printf("."); //replace non-ascii with .
            }else{
                printf("%c", cs[i]); //otherwise print normally
            }
        }
        printf("|\n"); //complete | and print newline
        bp += (int)br; //increase the number of bytes read
    }
    free(cs); //free dynamically allocated memory
    fclose(bf); //close the file
    return 0;
}
