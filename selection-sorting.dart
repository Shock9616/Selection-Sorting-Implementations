import "dart:io";

String input(String prompt) {
    /* Print out a prompt and then get the
     * user's response to that prompt */
    stdout.write(prompt);
    return stdin.readLineSync()!;
}

List<int> sort(List<int> arr, int order) {
    /*
     * Order the given array from least to greatest if
     * order i 0, or from greatest to least if order is 1
     */

     if (order == 0) {
        int max_index = 0;

        for (int i = 0; i < arr.length; i++) {
            max_index = i;

            for (int j = i + 1; j < arr.length; j++) {
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

        for (int i = 0; i < arr.length; i++) {
            min_index = i;

            for (int j = i + 1; j < arr.length; j++) {
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

void main() {
    List<int> nums = [];

    // Set to 0 for least to greatest, or set it to 1 for greatest to least
    int order = 0;

    while (true) {
        String value = input("-> ");

        try {
            int number = int.parse(value);

            nums.add(number);
        } catch (err) {
            if (value == "break" || value == "done") {
                break;
            } else {
                print("Invalid input");
            }
        }
    }

    print(sort(nums, order));
}
