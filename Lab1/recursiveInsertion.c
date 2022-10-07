void InsertionSort(int i, int array[], int size)
{
    if (i < size)
    {
        int j;
        int temp = array[i];

        for (j = i; j > 0 && array[j-1] > temp; j--)
            array[j] = array[j-1];
        array[j] = temp;

        InsertionSort(++i, array, size);
    }
}