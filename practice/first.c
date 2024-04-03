#include <stdio.h>
#include <ctype.h>

int nop;
void first(char[], char);
void addtoResult(char[], char);
char productionSet[20][20];

int main()
{

    printf("Enter number of Productions? : ");
    scanf(" %d", &nop);

    char choice, c;
    char result[20];

    for (int i = 0; i < nop; i++)
    {
        printf("Enter production %d : ", i + 1);
        scanf(" %s", productionSet[i]);
    }

    do
    {
        printf("\nFind the first of : ");

        scanf(" %c", &c);
        first(result, c);

        printf("\nFirst(%c) = { ", c);

        for (int i = 0; i < result[i] != '\0'; i++)
        {
            printf("%c, ", result[i]);
        }

        printf(" }\n");

        printf("\nPress y or Y to continue.");
        scanf(" %c", &choice);

    } while (choice == 'y' || choice == 'Y');
}

void first(char *result, char c)
{
    int i, j, k;

    result[0] = '\0';
    int foundEpsilon = 0;
    char subResult[20];
    subResult[0] = '\0';

    if (!(isupper(c)))
    {
        addtoResult(result, c);
        return;
    }

    for (int i = 0; i < nop; i++)
    {

        if (productionSet[i][0] == c)
        {

            if (productionSet[i][2] == '$')
            {
                addtoResult(result, '$');
            }

            else
            {
                j = 2;

                while (productionSet[i][j] != '\0')
                {
                    foundEpsilon = 0;

                    first(subResult, productionSet[i][j]);

                    for (k = 0; subResult[k] != '\0'; k++)
                    {
                        addtoResult(result, subResult[k]);
                    }

                    for (k = 0; subResult[k] != '\0'; k++)
                    {
                        if (subResult[k] == '$')
                        {
                            foundEpsilon = 1;
                            break;
                        }
                    }

                    if (!foundEpsilon)
                        break;

                    j++;
                }
            }
        }
    }

    return;
}

void addtoResult(char *result, char c)
{
    int k;
    for (k = 0; result[k] != '\0'; k++)
    {
        if (result[k] == c)
            return;
    }

    result[k] = c;
    result[k + 1] = '\0';
}
