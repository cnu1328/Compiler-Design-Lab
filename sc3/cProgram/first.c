#include<stdio.h>
#include<ctype.h>

void FIRST(char ,int ,int );
int count,n=0;
char prodn[10][10],first[10];

void main()
{
	int i,choice;
	char c,ch;
	printf("no.of productions:");
	scanf("%d",&count);
	printf("enter %d production epsilon=$:\n\n",count);
	
	for(i=0;i<count;i++)
	{
		scanf("%s%c",prodn[i],&ch);
	}
	
	do{
		n=0;
		printf("element :");
		scanf("%c",&c);
		FIRST(c,0,0);
		printf("\nFIRST(%c) = {",c);
		for(i=0;i<n;i++)
			printf("%c ",first[i]);
	    printf("}\n");
	    
	    printf("press 1 to continue:");
	    scanf("%d%c",&choice,&ch);
	}while(choice==1);
}

void FIRST(char c,int q1,int q2)
{
	int j;
	if(!(isupper(c)))
	  first[n++]=c;
	for(j=0;j<count;j++)
	{
		if(prodn[j][0]==c)
		{
			if(prodn[j][2]=='$')
			{
			  	if(prodn[q1][q2]=='\0')
			     	first[n++]='$';
				else if(prodn[q1][q2]!='\0' && (q1!=0 || q2!=0))
					FIRST(prodn[q1][q2],q1,(q2+1));
				else
			  		first[n++]='$';
		    }
	       	else if(islower(prodn[j][2]))
			 	first[n++]=prodn[j][2];
			else
			 	FIRST(prodn[j][2],j,3);
		}
	}
}

/*S-AaAb
S-BbBa
S-CcCa
A-$
B-$
C-c*/
