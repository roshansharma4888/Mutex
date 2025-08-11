#include<stdio.h>
#include<pthread.h>
#include<stdlib.h>
#include<stdint.h>
#include"tls.h"

char LOCK=0;
int mail=0;
void *routine(void* arg){
   enter_region(&LOCK);
   for (int i=0;i<100000;i++)
   {
    mail+=1;
   }
   leave_region(&LOCK);
   free(arg);
   return NULL;
}

int main(int argc,char* argv[]){
    pthread_t pt[5];
    int i=0;
    
    for(i;i<5;i++)
    {
        int *a= (int *)malloc(sizeof(int));
        *a=i;
        if(pthread_create(pt+i,NULL,&routine,(void *) a)!=0){
            perror("Error creating thread!!!\n");
            return 1;
        }
    }

    for(i=0;i<5;i++)
    {
        if(pthread_join(pt[i],NULL)!=0){
            perror("Error joining thread!!!\n");
            return 2;
        }
    }
    printf("Mail:%d\n",mail);
    return 0;
}