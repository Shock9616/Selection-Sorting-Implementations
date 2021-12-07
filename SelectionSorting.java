/*
 * A simple implimentation of the selection sorting algorithm to sort
 * integers either from least to greatest, or greatest to least
 */

import java.util.ArrayList;
import java.util.InputMismatchException;
import java.util.List;
import java.util.Scanner;

public class SelectionSorting {
    /*
     * Order the given array from least to greatest if
     * order is 0, or from greatest to least if order is 1
     */
    public static List<Integer> sort(List<Integer> arr, int order)
    {
        if (order == 0) {
            int max_index = 0;

            for (int i = 0; i < arr.size(); i++) {
                max_index = i;

                for (int j = i + 1; j < arr.size(); j++) {
                    if (arr.get(max_index) < arr.get(j)) {
                        max_index = j;
                    }
                }

                int temp = arr.get(i);
                arr.set(i, arr.get(max_index));
                arr.set(max_index, temp);
            }
        } else if (order == 1) {
            int min_index = 0;

            for (int i = 0; i < arr.size(); i++) {
                min_index = i;

                for (int j = i + 1; j < arr.size(); j++) {
                    if (arr.get(min_index) > arr.get(j)) {
                        min_index = j;
                    }
                }

                int temp = arr.get(i);
                arr.set(i, arr.get(min_index));
                arr.set(min_index, temp);
            }
        }

        return arr;
    }

    public static void main(String[] args)
    {
        Scanner keyboardInput = new Scanner(System.in);
        List<Integer> nums = new ArrayList<Integer>();

        // Set order to 0 for least to greatest, or set it to 1 for greatest to leaast
        int order = 0;

        while (true) {
            System.out.print("-> ");

            try {
                int value = keyboardInput.nextInt();

                nums.add(value);
            } catch (InputMismatchException err) {
                /* If the given input isn't an int, check if it is a
                String that is equal to either "break" or "done" */
                String value = keyboardInput.nextLine();

                if (value.equals("break") || value.equals("done")) {
                    break;
                } else {
                    System.out.println("Invalid input");
                }
            }
        }

        System.out.println(sort(nums, order));
    }
}
