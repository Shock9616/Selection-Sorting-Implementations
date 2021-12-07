/*
A simple implimentation of the selection sorting algorithm to sort
integers either from least to greatest, or greatest to least
*/

#include <iostream>
#include <vector>

using namespace std;

/*
Print out the contents of a vector the way
that a list gets printed out in Python
*/
void display_vector(vector<int> vec)
{
    cout << "[";
    for (int i = 0; i < vec.size() - 1; i++) {
        cout << vec[i] << ", ";
    }
    cout << vec[vec.size() - 1] << "]";
}

/*
Order the given array from least to greatest if
order is 0, or from greatest to least if order is 1
*/
vector<int> sort(vector<int> arr, int order)
{
    if (order == 0) {
        int max_index = 0;

        for (int i = 0; i < arr.size(); i++) {
            max_index = i;

            for (int j = i + 1; j < arr.size(); j++) {
                if (arr[max_index] < arr[j]) {
                    max_index = j;
                }
            }

            int temp = arr[i];
            arr[i] = arr[max_index];
            arr[max_index] = temp;
        }
    } else if (order == 1) {
        int min_index = 0;

        for (int i = 0; i < arr.size(); i++) {
            min_index = i;

            for (int j = i + 1; j < arr.size(); j++) {
                if (arr[min_index] > arr[j]) {
                    min_index = j;
                }
            }

            int temp = arr[i];
            arr[i] = arr[min_index];
            arr[min_index] = temp;
        }
    }

    return arr;
}

int main(void)
{
    vector<int> nums;
    string input;

    // Set order to 0 for least to greatest, or set it to 1 for greatest to least
    int order = 0;

    while (true) {
        cout << "-> ";
        getline(cin, input);

        try {
            int num = stoi(input);
            nums.push_back(num);
        } catch (invalid_argument err) {
            /* If the given input isn't able to be converted to an
            int, check if it is equal to either "break" or "done" */
            if (input == "break" || input == "done") {
                break;
            } else {
                cout << "Invalid input" << endl;
            }
        }
    }

    display_vector(sort(nums, order));

    return 0;
}
