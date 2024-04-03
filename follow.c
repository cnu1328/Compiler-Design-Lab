#include <stdio.h>
#include <string.h>
#include<ctype.h>

int nop, resultIndex;
char productions[10][10], result[20];
void follow(char);
void first(char);
void addtoResult(char);

int main()
{
    char choice;
    char c;

    printf("Enter number of productions? : ");
    scanf(" %d", &nop);

    for (int i = 0; i < nop; i++)
    {
        printf("Enter production %d : ", i + 1);
        scanf(" %s", productions[i]);
    }

    do
    {
        resultIndex = 0;

        printf("Find the follow of : ");
        scanf(" %c", &c);

        follow(c);

        printf("Follow(%c) = { ", c);

        for (int i = 0; i < resultIndex; i++)
        {
            printf(" %c, ", result[i]);
        }
        printf(" }\n");

        printf("\nPress y or Y to continue.");
        scanf(" %c", &choice);

    } while (choice == 'y' || choice == 'Y');
}

void follow(char c)
{
    if (productions[0][0] == c)
        addtoResult('$');

    for (int i = 0; i < nop; i++)
    {

        for (int j = 2; j < strlen(productions[i]); j++)
        {
            if (productions[i][j] == c)
            {
                if (productions[i][j + 1] != '\0')
                    first(productions[i][j + 1]);

                if (productions[i][j + 1] == '\0' && productions[i][0] != c)
                    follow(productions[i][0]);
            }
        }
    }
}

void first(char c)
{
    int k;

    if (!(isupper(c)))
    {
        addtoResult(c);
    }

    for (k = 0; k < nop; k++)
    {
        if (productions[k][0] == c)
        {
            if (productions[k][2] == '$')
                follow(productions[k][0]);

            else if (islower(productions[k][2]))
                addtoResult(productions[k][2]);

            else
                first(productions[k][2]);
        }
    }
}

void addtoResult(char c)
{
    int i;

    for (int i = 0; i <= resultIndex; i++)
    {
        if (result[i] == c)
            return;
    }

    result[resultIndex++] = c;
}